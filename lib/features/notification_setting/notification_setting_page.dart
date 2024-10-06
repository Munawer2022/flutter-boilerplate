import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/features/setting/setting_page.dart';
import 'notification_setting_cubit.dart';
import 'notification_setting_state.dart';
import 'notification_setting_state.dart';
import '/core/status_switcher.dart';

class NotificationSettingPage extends StatefulWidget {
  final NotificationSettingCubit cubit;

  const NotificationSettingPage({
    super.key,
    required this.cubit,
  });

  @override
  State<NotificationSettingPage> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSettingPage> {
  NotificationSettingCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
  }

  bool isEmailNotificationEnabled = true;
  bool isInAppNotificationEnabled = true;
  bool isUpdateNotificationEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text(
          'Notification setting',
          style: TextStyle(color: Colors.black87, fontSize: 18),
        ),
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                "In this section, you will be able to manage notifications. We will continue to send you notifications for security reasons or if we need to contact you about your account.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            50.verticalSpace,
            _buildNotificationOption(
              title: "Email notifications",
              description:
                  "You will receive an email about any notification regularly.",
              value: isEmailNotificationEnabled,
              onChanged: (bool value) {
                setState(() {
                  isEmailNotificationEnabled = value;
                });
              },
            ),
            _buildNotificationOption(
              title: "In app notifications",
              description:
                  "You will receive a notification inside the application.",
              value: isInAppNotificationEnabled,
              onChanged: (bool value) {
                setState(() {
                  isInAppNotificationEnabled = value;
                });
              },
            ),
            _buildNotificationOption(
              title: "Update application",
              description:
                  "You will receive a notification about update application.",
              value: isUpdateNotificationEnabled,
              onChanged: (bool value) {
                setState(() {
                  isUpdateNotificationEnabled = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationOption({
    required String title,
    required String description,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Switch(
                value: value,
                activeColor: Colors.red,
                onChanged: onChanged,
              ),
            ],
          ),
          10.verticalSpace,
          Divider(color: Colors.grey.shade300)
        ],
      ),
    );
  }
}
