import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/config/components/app_button.dart';
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
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
          title: const Text("Settings"),
          surfaceTintColor: Colors.grey.shade100,
          backgroundColor: Colors.grey.shade100,
          centerTitle: true,
          automaticallyImplyLeading: false),
      body: ListView(
        padding: EdgeInsets.all(20.0.r),
        children: [
          listTile(
            title: "Ahmed Ali",
            subtitle: const Text("A professionally Doctor"),
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/28098286/pexels-photo-28098286/free-photo-of-playa-puerto-angelito.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            ),
            onTap: () => cubit.goProfilePage(),
          ),
          10.verticalSpace,
          Column(
            children: [
              listTile(
                title: "Notifications",
                icon: CupertinoIcons.chat_bubble,
                onTap: () => cubit.goNotificationPage(),
              ),
              listTile(title: "Favorites", icon: CupertinoIcons.heart_fill),
              listTile(title: "Language", icon: Icons.language_rounded),
              Container(
                // margin: EdgeInsets.zero
                // shape: Border.all(),
                margin: const EdgeInsets.only(bottom: 4),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: ListTile(
                  title: const Text('Dark mode'),
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
              ),
            ],
          ),

          20.verticalSpace,
          // const Text('General'),

          Column(
            children: [
              listTile(title: "Share the App", icon: CupertinoIcons.share),
              listTile(title: "About Us", icon: CupertinoIcons.group_solid),
              listTile(title: "Rate Us", icon: CupertinoIcons.star_circle_fill),
              listTile(
                  title: "Tems and Condition",
                  icon: Icons.content_paste_go_sharp),
              listTile(title: "Privacy Policy", icon: Icons.policy),
            ],
          ),
          20.verticalSpace,
          // const Text('General'),

          Column(
            children: [
              listTile(title: "Whats New", icon: Icons.announcement_sharp),
            ],
          ),

          30.verticalSpace,

          // Sign Out Button

          AppButton.getButton(
              child:
                  const Text('Logout', style: TextStyle(color: Colors.white)),
              onPressed: () {},
              color: Colors.redAccent.shade200),
          20.verticalSpace
        ],
      ),
    );
  }
}

listTile(
        {required String title,
        IconData? icon,
        Widget? leading,
        Widget? subtitle,
        void Function()? onTap}) =>
    Container(
      // margin: EdgeInsets.zero
      // shape: Border.all(),
      margin: const EdgeInsets.only(bottom: 4),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: ListTile(
          minTileHeight: 0,
          title: Text(title),
          subtitle: subtitle,
          trailing: const Icon(Icons.arrow_forward_ios, size: 14),
          leading: leading ?? Icon(icon),
          onTap: onTap),
    );
