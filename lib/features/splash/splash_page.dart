import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/config/components/app_bar.dart';
import 'package:flutter_template/core/app_images.dart';
import 'splash_cubit.dart';

class SplashPage extends StatefulWidget {
  final SplashCubit cubit;

  const SplashPage({
    super.key,
    required this.cubit,
  });

  @override
  State<SplashPage> createState() => _SplashState();
}

class _SplashState extends State<SplashPage> {
  SplashCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
    Future.delayed(const Duration(seconds: 2), () => cubit.checkUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: EdgeInsets.all(80.0.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Image.asset(AppImages.logo, fit: BoxFit.cover, color: Colors.black),
            Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: const CircularProgressIndicator.adaptive(
                        backgroundColor: Colors.black,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.white70)))),
          ],
        ),
      ),
    );
  }
}
