import 'package:flutter/cupertino.dart';
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

  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(20.0.r),
        children: [
          20.verticalSpace,
          Text('Settings', style: Theme.of(context).appBarTheme.titleTextStyle),
          30.verticalSpace,
          const Text('General', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(6.r),
            decoration: BoxDecoration(
                color: const Color(0xffF7F8FC),
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: Column(
              children: [
                listTile(
                  title: "Profile",
                  icon: CupertinoIcons.profile_circled,
                  onTap: () => cubit.goProfilePage(),
                ),
                Divider(color: Colors.grey.shade300),
                listTile(
                  title: "Notifications",
                  icon: CupertinoIcons.chat_bubble,
                  onTap: () => cubit.goNotificationPage(),
                ),
                Divider(color: Colors.grey.shade300),
                listTile(title: "Favorites", icon: CupertinoIcons.heart_fill),
                Divider(color: Colors.grey.shade300),
                listTile(title: "Language", icon: Icons.language_rounded),
                Divider(color: Colors.grey.shade300),
                ListTile(
                  title: const Text('Dark mode',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Switch(
                    value: isDarkModeEnabled,
                    onChanged: (bool value) {
                      setState(() {
                        isDarkModeEnabled = value;
                      });
                    },
                  ),
                  leading: const Icon(CupertinoIcons.moon_stars_fill),
                ),
              ],
            ),
          ),

          20.verticalSpace,
          // const Text('General'),

          Container(
            padding: EdgeInsets.all(6.r),
            decoration: BoxDecoration(
                color: const Color(0xffF7F8FC),
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: Column(
              children: [
                listTile(title: "Share the App", icon: CupertinoIcons.share),
                Divider(color: Colors.grey.shade300),
                listTile(title: "About Us", icon: CupertinoIcons.group_solid),
                Divider(color: Colors.grey.shade300),
                listTile(
                    title: "Rate Us", icon: CupertinoIcons.star_circle_fill),
                Divider(color: Colors.grey.shade300),
                listTile(
                    title: "Tems and Condition",
                    icon: Icons.content_paste_go_sharp),
                Divider(color: Colors.grey.shade300),
                listTile(title: "Privacy Policy", icon: Icons.policy),
              ],
            ),
          ),
          20.verticalSpace,
          // const Text('General'),

          Container(
            padding: EdgeInsets.all(6.r),
            decoration: BoxDecoration(
                color: const Color(0xffF7F8FC),
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: Column(
              children: [
                listTile(title: "Whats New", icon: Icons.announcement_sharp),
              ],
            ),
          ),

          30.verticalSpace,

          // Sign Out Button
          ElevatedButton(
            onPressed: () {
              // Action for sign out
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: const Text('Delete Account',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          10.verticalSpace,
          ElevatedButton(
            onPressed: () {
              // Action for sign out
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: const Text('Logout',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          20.verticalSpace
        ],
      ),
    );
  }
}

listTile(
        {required String title,
        required IconData icon,
        void Function()? onTap}) =>
    Column(
      children: [
        ListTile(
            minTileHeight: 0,
            title: Text(title,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
            leading: Icon(icon),
            onTap: onTap),
      ],
    );
