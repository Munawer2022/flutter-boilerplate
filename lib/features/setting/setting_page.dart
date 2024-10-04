import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/show/show/show_material_banner.dart';
import 'setting_cubit.dart';
import 'setting_state.dart';
import 'setting_state.dart';
import '/core/status_switcher.dart';

import '/domain/entities/setting/mock_setting_model.dart';

class SettingPage extends StatefulWidget {
  final SettingCubit cubit;

  const SettingPage({
    super.key,
    required this.cubit,
  });

  @override
  State<SettingPage> createState() => _SettingState();
}

class _SettingState extends State<SettingPage> {
  SettingCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        padding: EdgeInsets.all(20.r),
        children: [
          50.verticalSpace,
          Text("Setting",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontWeight: FontWeight.bold)),
          10.verticalSpace,
          Card(
            elevation: 0,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                    'assets/profile_image.png'), // Replace with your image
              ),
              title: Text(
                'Faisal ALBusaidi',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('سبحانك ربي ولك الحمد'),
              trailing: Icon(Icons.qr_code),
            ),
          ),

          // Settings List Section 1
          Card(
            elevation: 0,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                const SettingsListTile(
                  icon: Icons.favorite,
                  title: 'Favorites',
                ),
                Divider(
                  color: Colors.grey.shade100,
                ),
                const SettingsListTile(
                  icon: Icons.speaker_group,
                  title: 'Broadcast lists',
                ),
                Divider(
                  color: Colors.grey.shade100,
                ),
                const SettingsListTile(
                  icon: Icons.star,
                  title: 'Starred messages',
                ),
                Divider(
                  color: Colors.grey.shade100,
                ),
                const SettingsListTile(
                  icon: Icons.devices,
                  title: 'Linked devices',
                ),
              ],
            ),
          ),

          // Divider between sections

          // Settings List Section 2
          Card(
            elevation: 0,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                const SettingsListTile(
                  icon: Icons.account_circle,
                  title: 'Account',
                ),
                Divider(
                  color: Colors.grey.shade100,
                ),
                const SettingsListTile(
                  icon: Icons.lock,
                  title: 'Privacy',
                ),
                Divider(
                  color: Colors.grey.shade100,
                ),
                SettingsListTile(
                  icon: Icons.chat,
                  title: 'Chats',
                  trailing: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey.shade100,
                ),
                const SettingsListTile(
                  icon: Icons.notifications,
                  title: 'Notifications',
                ),
                Divider(
                  color: Colors.grey.shade100,
                ),
                const SettingsListTile(
                  icon: Icons.storage,
                  title: 'Storage and data',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable ListTile Widget for Settings
class SettingsListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;

  const SettingsListTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      minTileHeight: 0,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
