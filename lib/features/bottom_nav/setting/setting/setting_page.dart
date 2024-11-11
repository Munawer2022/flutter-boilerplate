import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/config/components/app_button.dart';
import 'package:flutter_template/config/translation_helper.dart';
import 'package:flutter_template/data/datasources/auth/login/login_data_sources.dart';
import 'package:flutter_template/data/datasources/auth/splash/splash_data_sources.dart';
import 'package:flutter_template/features/auth/splash/splash_cubit.dart';
import 'package:flutter_template/features/auth/splash/splash_state.dart';
import 'setting_cubit.dart';
import 'setting_state.dart';
import 'setting_state.dart';
import '../../../../config/status_switcher.dart';

class SettingPage extends StatefulWidget {
  final SettingCubit cubit;
  final SplashDataSources dataSources;
  final SplashCubit splashCubit;
  final LoginDataSources loginDataSources;

  const SettingPage(
      {super.key,
      required this.cubit,
      required this.dataSources,
      required this.splashCubit,
      required this.loginDataSources});

  @override
  State<SettingPage> createState() => _SettingState();
}

class _SettingState extends State<SettingPage> {
  SettingCubit get cubit => widget.cubit;
  SplashCubit get splashCubit => widget.splashCubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
    splashCubit.navigator.context = context;
    cubit.onInitLoginDataSources();
  }

  bool isDarkModeEnabled = false;
  String? selectedValue;
  List<String> options = ['English', 'Arabic'];

  @override
  Widget build(BuildContext context) {
    print(widget.dataSources.state['language']);
    print(widget.dataSources.currentLang);
    return Scaffold(
      // backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
          title: BlocBuilder(
              bloc: widget.dataSources,
              builder: (context, state) {
                return
                    // Text(widget.dataSources.state['language']['file_name']
                    //         ['hello'] ??
                    //     '');
                    Text(TranslationHelper.tr(
                        widget.dataSources.state, 'title'));
              }),
          // title: const Text("Settings"),
          // surfaceTintColor: Colors.grey.shade100,
          // backgroundColor: Colors.grey.shade100,
          centerTitle: true,
          automaticallyImplyLeading: false),
      body: ListView(
        padding: EdgeInsets.all(20.0.r),
        children: [
          BlocBuilder(
              bloc: splashCubit,
              builder: (context, state) {
                state as SplashState;
                return state.isloadingLanguageChange
                    ? const LinearProgressIndicator()
                    : const SizedBox();
              }),
          Container(
            // margin: EdgeInsets.zero
            // shape: Border.all(),
            margin: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: listTile(
              title: TranslationHelper.tr(widget.dataSources.state,
                  widget.loginDataSources.state.data.name),
              subtitle: const Text("A professionally Doctor"),
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/28098286/pexels-photo-28098286/free-photo-of-playa-puerto-angelito.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
              ),
              onTap: () => cubit.goProfilePage(),
            ),
          ),
          10.verticalSpace,
          Text(
              TranslationHelper.tr(
                  widget.dataSources.state, 'member_dashboard'),
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
          10.verticalSpace,
          Container(
            // margin: EdgeInsets.zero
            // shape: Border.all(),
            padding: EdgeInsets.symmetric(vertical: 10.h),
            margin: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
                // color: Colors.white,
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: Column(
              children: [
                listTile(
                    title: TranslationHelper.tr(
                        widget.dataSources.state, 'payment_history'),
                    icon: Icons.history),
                const Divider(),
                listTile(
                  title: TranslationHelper.tr(
                      widget.dataSources.state, 'loyalty_programs'),
                  icon: Icons.loyalty_outlined,
                  onTap: () {},
                ),
                // Divider(color: Colors.grey.shade100),
                // listTile(title: "Favorites", icon: CupertinoIcons.heart_fill),
                const Divider(),

                listTile(
                  title: TranslationHelper.tr(
                      widget.dataSources.state, 'billing_information'),
                  icon: Icons.info_outline,
                  onTap: () {},
                ),
                // Divider(color: Colors.grey.shade100),
                // listTile(title: "Favorites", icon: CupertinoIcons.heart_fill),
              ],
            ),
          ),
          10.verticalSpace,
          Text(
              TranslationHelper.tr(
                  widget.dataSources.state, 'general_settings'),
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
          10.verticalSpace,
          Container(
            // margin: EdgeInsets.zero
            // shape: Border.all(),
            padding: EdgeInsets.symmetric(vertical: 10.h),
            margin: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
                // color: Colors.white,
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: Column(
              children: [
                ListTile(
                  title: Text(TranslationHelper.tr(
                      widget.dataSources.state, 'language')),
                  trailing: SizedBox(
                      // width: 120,
                      child: DropdownButton<String>(
                    value: widget.dataSources.currentLang,
                    // value: selectedValue,
                    // hint: const Text('English'),
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    underline: const SizedBox(),
                    items: widget.splashCubit.languages
                        .map<DropdownMenuItem<String>>((lang) {
                      return DropdownMenuItem<String>(
                        value: lang['code'],
                        child: Text(lang['name']!), // Display language name
                      );
                    }).toList(),
                    onChanged: (String? newLang) {
                      if (newLang != null) {
                        widget.splashCubit.systemSettings(newLang);
                        setState(() {
                          widget.dataSources.currentLang =
                              newLang; // Update the local state immediately
                        });
                      }
                    },
                  )),
                  leading: const Icon(Icons.language_rounded),
                ),
                const Divider(),
                listTile(
                  title: TranslationHelper.tr(
                      widget.dataSources.state, 'notifications'),
                  icon: CupertinoIcons.chat_bubble,
                  onTap: () => cubit.goNotificationPage(),
                ),
                // Divider(color: Colors.grey.shade100),
                // listTile(title: "Favorites", icon: CupertinoIcons.heart_fill),
                const Divider(),
                ListTile(
                  title: Text(TranslationHelper.tr(
                      widget.dataSources.state, 'dark_mode')),
                  trailing: BlocBuilder(
                      bloc: cubit,
                      builder: (context, state) {
                        state as SettingState;
                        return Switch(
                            // inactiveTrackColor: Colors.red,
                            value: state.isDarkTheme,
                            onChanged: cubit.onThemeChanged);
                      }),
                  leading: const Icon(CupertinoIcons.moon_stars),
                ),
              ],
            ),
          ),

          10.verticalSpace,
          Text(TranslationHelper.tr(widget.dataSources.state, 'resources'),
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
          10.verticalSpace,
          // const Text('General'),

          Container(
            // margin: EdgeInsets.zero
            // shape: Border.all(),
            padding: EdgeInsets.symmetric(vertical: 10.h),
            margin: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
                // color: Colors.white,
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: Column(
              children: [
                listTile(
                    title: TranslationHelper.tr(
                        widget.dataSources.state, 'about_us'),
                    icon: CupertinoIcons.group),
                const Divider(),
                listTile(
                  title: TranslationHelper.tr(widget.dataSources.state, 'faqs'),
                  icon: CupertinoIcons.question_square,
                  onTap: () => cubit.goFaqPage(),
                ),
                const Divider(),
                // listTile(
                //     title: "Tems and Service",
                //     icon: Icons.content_paste_go_sharp),
                // Divider(color: Colors.grey.shade100),
                // ListView.builder(
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   itemCount: widget.pagesDataSources.state.data.length,
                //   itemBuilder: (context, index) {
                //     final icons = [
                //       Icons.whatshot_rounded,
                //       Icons.policy_outlined,
                //       Icons.content_paste_go_sharp
                //     ];
                //     final info = widget.pagesDataSources.state.data[index];
                //     return Column(
                //       children: [
                //         listTile(
                //             title: info.name,
                //             onTap: () => widget.cubit.goPagesWebViewPage(
                //                 url:
                //                     "${info.link}?lang=${widget.dataSources.currentLang}",
                //                 title: info.name),
                //             icon: icons[index]),
                //         Divider(color: Colors.grey.shade100),
                //       ],
                //     );
                //   },
                // ),
                listTile(
                    title: TranslationHelper.tr(
                        widget.dataSources.state, 'rate_us'),
                    icon: Icons.rate_review_outlined),
                const Divider(),
                listTile(
                    title: TranslationHelper.tr(
                        widget.dataSources.state, 'invite_friends'),
                    icon: Icons.share_outlined),
                const Divider(),
                listTile(
                    title: TranslationHelper.tr(
                        widget.dataSources.state, 'feedback_support'),
                    icon: Icons.feedback_outlined),
              ],
            ),
          ),
          20.verticalSpace,
          // const Text('General'),

          Container(
            // margin: EdgeInsets.zero
            // shape: Border.all(),
            padding: EdgeInsets.symmetric(vertical: 10.h),
            margin: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
                // color: Colors.white,
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.all(Radius.circular(8))),

            child: Column(
              children: [
                listTile(
                    title: TranslationHelper.tr(
                        widget.dataSources.state, 'whats_new'),
                    icon: Icons.whatshot_rounded),
              ],
            ),
          ),

          20.verticalSpace,

          // Sign Out Button

          AppButton.getButton(
              child: Text(
                  TranslationHelper.tr(widget.dataSources.state, 'logout'),
                  style: const TextStyle(color: Colors.white)),
              onPressed: () => _showLogoutConfirmationDialog(),
              // onPressed: () => cubit.goLoginPage(),
              color: Colors.redAccent.shade200),
          20.verticalSpace,
          Align(
              alignment: Alignment.center,
              child: Text(TranslationHelper.tr(
                  widget.dataSources.state, 'footer_text'))),
          20.verticalSpace
        ],
      ),
    );
  }

  Future<void> _showLogoutConfirmationDialog() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(TranslationHelper.tr(widget.dataSources.state, 'logout')),
          content: Text(TranslationHelper.tr(
              widget.dataSources.state, 'logout_confirmation')),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                  TranslationHelper.tr(widget.dataSources.state, 'cancel')),
            ),
            TextButton(
              onPressed: () => cubit.logout(),
              child: Text(
                  TranslationHelper.tr(widget.dataSources.state, 'confirm')),
            ),
          ],
        );
      },
    );
  }
}

listTile(
        {required String title,
        IconData? icon,
        Widget? leading,
        Widget? subtitle,
        void Function()? onTap}) =>
    ListTile(
        minTileHeight: 0,
        title: Text(title),
        subtitle: subtitle,
        trailing: const Icon(Icons.arrow_forward_ios, size: 14),
        leading: leading ?? Icon(icon),
        onTap: onTap);

class AppDropdownInput<T> extends StatelessWidget {
  final String hintText;
  final List<T> options;
  final T? value;
  final String Function(T) getLabel;
  final void Function(T?) onChanged;

  const AppDropdownInput({
    super.key,
    this.hintText = 'Please select an Option',
    this.options = const [],
    required this.getLabel,
    this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      builder: (FormFieldState<T> state) {
        return InputDecorator(
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            labelText: hintText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
          isEmpty: value == null || value == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              isDense: true,
              onChanged: onChanged,
              items: options.map((T value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: Text(getLabel(value)),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
