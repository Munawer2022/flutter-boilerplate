import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/config/components/app_button.dart';
import 'package:flutter_template/features/onboarding/widget/dot_indicator.dart';
import 'package:flutter_template/features/onboarding/widget/onboard_content.dart';
import 'onboarding_cubit.dart';

import 'widget/demo_data.dart';

class OnboardingPage extends StatefulWidget {
  final OnboardingCubit cubit;

  const OnboardingPage({
    super.key,
    required this.cubit,
  });

  @override
  State<OnboardingPage> createState() => _OnboardingState();
}

class _OnboardingState extends State<OnboardingPage> {
  OnboardingCubit get cubit => widget.cubit;
  int currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
  }

  void _nextPage() {
    if (currentPage < demoData.length - 1) {
      setState(() {
        currentPage++;
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void _previousPage() {
    if (currentPage > 0) {
      setState(() {
        currentPage--;
        _pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  cubit.goHomePage(); // Navigate to Home when Skip is pressed
                },
                child: const Text("Skip"),
              ),
            ),
            const Spacer(flex: 2),
            // Onboarding Content
            Expanded(
              flex: 14,
              child: PageView.builder(
                controller: _pageController,
                itemCount: demoData.length,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemBuilder: (context, index) => OnboardContent(
                  illustration: demoData[index]["illustration"],
                  title: demoData[index]["title"],
                  text: demoData[index]["text"],
                ),
              ),
            ),
            const Spacer(),
            // Dot Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                demoData.length,
                (index) => DotIndicator(isActive: index == currentPage),
              ),
            ),
            const Spacer(flex: 2),
            // Previous, Next Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: currentPage == demoData.length - 1
                  ? AppButton.getButton(
                      color: Colors.green,
                      child: const Text('Get Start',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () => cubit.goHomePage())
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (currentPage == 0)
                          const SizedBox()
                        else
                          ElevatedButton(
                              onPressed: _previousPage,
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 14.h),
                                  backgroundColor: Colors.orange,
                                  foregroundColor: Colors.white,
                                  minimumSize: Size.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.r))),
                              child: const Icon(Icons.arrow_back)
                              // currentPage == demoData.length - 1 ? "Finish" : "Next",
                              ) // else
                        , //   _previousPage,
                        // Next Button (disable if last page)
                        ElevatedButton(
                            onPressed: currentPage == demoData.length - 1
                                ? () => cubit.goHomePage()
                                : _nextPage,
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.w, vertical: 14.h),
                                backgroundColor: Colors.orange,
                                foregroundColor: Colors.white,
                                minimumSize: Size.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r))),
                            child: const Icon(Icons.arrow_forward)
                            // currentPage == demoData.length - 1 ? "Finish" : "Next",
                            ),
                      ],
                    ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
