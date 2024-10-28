import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/config/components/app_button.dart';
import 'package:flutter_template/config/components/app_text_form_field.dart';
import 'package:flutter_template/features/bottom_nav/setting/setting/setting_page.dart';
import 'profile_cubit.dart';
import 'profile_state.dart';
import 'profile_state.dart';
import '/core/status_switcher.dart';

class ProfilePage extends StatefulWidget {
  final ProfileCubit cubit;

  const ProfilePage({
    super.key,
    required this.cubit,
  });

  @override
  State<ProfilePage> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  ProfileCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        // backgroundColor: Colors.transparent,
        elevation: 0,
        // scrolledUnderElevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          20.verticalSpace,
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              const CircleAvatar(radius: 60),
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    height: 160.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        shape: BoxShape.circle),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                    child: IconButton(
                        onPressed: () {},
                        icon:
                            const Icon(Icons.edit_square, color: Colors.white)),
                  )
                ],
              ),
            ],
          ),
          40.verticalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Full Name'),
              10.verticalSpace,
              AppTextFormField.textFormField(
                  context: context,
                  titleText: 'Full Nmae',
                  hintText: 'Ahmed',
                  color: Colors.transparent)
            ],
          ),
          20.verticalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Email'),
              10.verticalSpace,
              AppTextFormField.textFormField(
                  context: context,
                  titleText: 'Full Nmae',
                  hintText: 'Ahmed@xyz.com',
                  color: Colors.transparent)
            ],
          ),
          20.verticalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Phone Number'),
              10.verticalSpace,
              AppTextFormField.textFormField(
                  context: context,
                  titleText: 'Full Nmae',
                  keyboardType: TextInputType.number,
                  hintText: '+983258923',
                  color: Colors.transparent),
              30.verticalSpace,
              AppButton.getButton(
                  child: const Text('Edit Profile',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {},
                  color: Colors.blue),
              10.verticalSpace,
              AppButton.getButton(
                  child: const Text('Delete Account',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {},
                  color: Colors.redAccent.shade200),
            ],
          )
        ],
      ),
    );
  }
}
