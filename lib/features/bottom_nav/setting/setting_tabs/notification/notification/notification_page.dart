import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'notification_cubit.dart';
import 'notification_state.dart';
import 'notification_state.dart';
import '../../../../../../config/status_switcher.dart';

class NotificationPage extends StatefulWidget {
  final NotificationCubit cubit;

  const NotificationPage({
    super.key,
    required this.cubit,
  });

  @override
  State<NotificationPage> createState() => _NotificationState();
}

class _NotificationState extends State<NotificationPage> {
  NotificationCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        elevation: 0,
        // surfaceTintColor: Colors.white,
        // backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: const Text(
          'Notifications',
          style: TextStyle(fontSize: 18),
        ),
        titleSpacing: 0,
        // actions: [
        //   IconButton(
        //       onPressed: () => cubit.goNoticationSettingPage(),
        //       icon: const Icon(Icons.settings))
        // ],
      ),
      body: Column(
        children: [
          // Notification Alert Container
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                        color: Colors.red.shade400,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12))),
                    child: const Icon(CupertinoIcons.bell_fill,
                        color: Colors.white)),
                10.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Information!",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
                      ),
                      5.verticalSpace,
                      Text(
                        "Please note that there might be a brief delay in securing your seats at the theater while processing your ticket purchase.",
                        style: TextStyle(color: Colors.red.shade700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildSectionHeader('Today'),
                _buildNotificationItem(
                  title:
                      "50% Off Extravaganza: Grab Your Movie Tickets at Half the Price!",
                  subtitle: "10:00 AM",
                  icon: Icons.local_offer,
                  color: Colors.red,
                ),
                _buildNotificationItem(
                  title:
                      "Successful purchase enjoy unforgettable Adventures with Super Mario movies",
                  subtitle: "10:50 AM",
                  icon: Icons.local_offer,
                  color: Colors.red,
                ),
                _buildNotificationItem(
                  title: "Yo, Your account got spotted on a new device",
                  subtitle: "11:25 AM",
                  icon: Icons.local_offer,
                  color: Colors.red,
                ),
                16.verticalSpace,
                _buildSectionHeader('Yesterday'),
                _buildNotificationItem(
                  title:
                      "Jingle Deals: Spectacular Christmas Discounts at the Bioskop!",
                  subtitle: "10:00 AM",
                  dotWant: false,
                  icon: Icons.local_offer,
                  color: Colors.red,
                ),
                _buildNotificationItem(
                  title:
                      "Presale Frenzy: Grab Your Tickets Now at a Whopping 90% Discount!",
                  subtitle: "10:00 AM",
                  dotWant: false,
                  icon: Icons.local_offer,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          // TextButton(
          //   onPressed: () {
          //     // Handle Mark all as read
          //   },
          //   child: const Text(
          //     "Mark all read",
          //     style: TextStyle(color: Colors.red),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    bool dotWant = true,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // if (dotWant)
          //   Row(
          //     children: [
          //       CircleAvatar(
          //           backgroundColor: Colors.red.shade100,
          //           radius: 5,
          //           child: CircleAvatar(
          //               backgroundColor: Colors.red.shade400, radius: 3)),
          //       15.horizontalSpace,
          //     ],
          //   ),
          Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              child: Icon(icon, color: color)),
          10.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                4.verticalSpace,
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
