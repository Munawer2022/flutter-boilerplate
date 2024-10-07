import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/config/components/app_bar.dart';
import 'package:flutter_template/config/components/app_button.dart';
import 'package:flutter_template/core/app_images.dart';
import 'package:lottie/lottie.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Wi-Fi and phone illustration
            Center(
              child: Column(
                children: [
                  // Wi-Fi Icon with alert
                  const Text(
                    'No internet connection',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Lottie.asset(AppImages.noInternet),
                  const SizedBox(height: 40),

                  // Sad Face in Phone illustration

                  // Message

                  Text(
                    'Please check your connection again, or connect to Wi-Fi.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Refresh Button
            AppButton.getButton(
                width: 0,
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                color: Colors.blueGrey.shade900,
                child: const Text('REFRESH',
                    style: TextStyle(color: Colors.white, letterSpacing: 3)),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
