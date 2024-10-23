import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/features/onboarding/onboarding_cubit.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.illustration,
    required this.title,
    required this.text,
    required this.cubit,
  });

  final String? illustration, title, text;
  final OnboardingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Expanded(
        //   child: AspectRatio(
        //     aspectRatio: 1,
        //     child: Image.network(
        //       illustration!,
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        Stack(
          children: [
            Container(
              width: double.infinity.w,
              height: 500.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(illustration!),
                      fit: BoxFit.cover)),
            ),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  cubit.goHomePage();
                },
                child:
                    const Text("Skip", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            children: [
              16.verticalSpace,
              Text(
                title!,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              16.verticalSpace,
              Text(
                text!,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
