import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'notifications_setting_cubit.dart';
import 'notifications_setting_state.dart';
import 'notifications_setting_state.dart';
import '/core/status_switcher.dart';



class NotificationsSettingPage extends StatefulWidget {
final NotificationsSettingCubit cubit;

const NotificationsSettingPage({
super.key,
required this.cubit,
});

@override
State<NotificationsSettingPage> createState() => _NotificationsSettingState();
}

class _NotificationsSettingState extends State<NotificationsSettingPage> {

NotificationsSettingCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
  }

@override
Widget build(BuildContext context) {
return Scaffold(
  
    
    );
  }
}