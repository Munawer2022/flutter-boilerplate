import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/config/components/app_button.dart';
import 'package:flutter_template/config/components/app_text_form_field.dart';
import 'package:flutter_template/data/datasources/user/user_data_sources.dart';
import 'package:flutter_template/features/bottom_nav/setting/setting/setting_page.dart';
import 'profile_cubit.dart';
import 'profile_state.dart';
import 'profile_state.dart';
import '../../../../../config/status_switcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  final ProfileCubit cubit;
  final UserDataSources dataSources;

  const ProfilePage({
    super.key,
    required this.cubit,
    required this.dataSources,
  });

  @override
  State<ProfilePage> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  XFile? _selectedImage;
  bool _isLoading = false;

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    final info = widget.dataSources.state.data;
    _nameController = TextEditingController(text: info.name);
    _emailController = TextEditingController(text: info.email);
    _phoneController = TextEditingController(text: info.phone);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _updateProfile() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final userId = widget.dataSources.state.data.id;
      final uri = Uri.parse('https://pro.ramzdev.space/api/customers/$userId');
      
      // Create multipart request
      final request = http.MultipartRequest('POST', uri);
      
      // Add text fields
      request.fields['name'] = _nameController.text;
      request.fields['email'] = _emailController.text;
      request.fields['phone'] = _phoneController.text;

      // Add image if selected
      if (_selectedImage != null) {
        final file = await http.MultipartFile.fromPath(
          'profile_image',
          _selectedImage!.path,
        );
        request.files.add(file);
      }

      // Send request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );
        
        // Optionally refresh user data here
        // await widget.dataSources.refreshUserData();
      } else {
        if (!mounted) return;
        final error = jsonDecode(response.body)['message'] ?? 'Update failed';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error)),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating profile: ${e.toString()}')),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );
      if (image != null) {
        setState(() => _selectedImage = image);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to pick image')),
      );
    }
  }

  Future<void> _showDeleteConfirmation() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text(
            'Are you sure you want to delete your account? This action cannot be undone.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _deleteAccount();
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteAccount() async {
    setState(() => _isLoading = true);

    try {
      final response = await http.post(
        Uri.parse('https://pro.ramzdev.space/api/delete-account'),
        body: {
          'id': widget.dataSources.state.data.id.toString(),
        },
      );

      if (!mounted) return;

      if (response.statusCode == 200) {
        // Clear user data and navigate to login
        // You might want to call a logout method from your auth service here
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/login', // Replace with your login route name
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to delete account. Please try again.'),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // surfaceTintColor: Colors.white,
        // backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        // backgroundColor: Colors.transparent,
        elevation: 0,
        // scrolledUnderElevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            20.verticalSpace,
            // Profile image section
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: _selectedImage != null 
                      ? FileImage(File(_selectedImage!.path))
                      : NetworkImage(widget.dataSources.state.data.profileImage ?? '') as ImageProvider,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: _pickImage,
                      icon: const Icon(Icons.camera_alt),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            40.verticalSpace,
            // Name field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Full Name'),
                10.verticalSpace,
                AppTextFormField.textFormField(
                  controller: _nameController,
                  context: context,
                  titleText: 'Full Name',
                  color: Colors.transparent,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Name is required';
                    }
                    return null;
                  },
                )
              ],
            ),
            20.verticalSpace,
            // Email field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Email'),
                10.verticalSpace,
                AppTextFormField.textFormField(
                  controller: _emailController,
                  context: context,
                  titleText: 'Email',
                  color: Colors.transparent,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Email is required';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                )
              ],
            ),
            20.verticalSpace,
            // Phone field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Phone Number'),
                10.verticalSpace,
                AppTextFormField.textFormField(
                  controller: _phoneController,
                  context: context,
                  titleText: 'Phone Number',
                  keyboardType: TextInputType.phone,
                  color: Colors.transparent,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Phone number is required';
                    }
                    return null;
                  },
                ),
                30.verticalSpace,
                // Submit button
                AppButton.getButton(
                  child: _isLoading 
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Save Changes', style: TextStyle(color: Colors.white)),
                  onPressed: _isLoading ? null : _updateProfile,
                  color: Colors.blue,
                ),
              ],
            ),
            30.verticalSpace,
            AppButton.getButton(
              child: const Text(
                'Delete Account',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: _isLoading ? null : _showDeleteConfirmation,
              color: Colors.grey,
            ),
            30.verticalSpace,
          ],
        ),
      ),
    );
  }
}
