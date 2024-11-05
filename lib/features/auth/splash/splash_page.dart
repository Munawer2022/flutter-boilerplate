import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/app_images.dart';
import 'package:flutter_template/core/shimmer.dart';
import 'package:flutter_template/core/status_switcher.dart';
import 'package:flutter_template/data/datasources/auth/splash/splash_data_sources.dart';
import 'package:flutter_template/data/models/auth/splash/splash_model.dart';
import 'package:flutter_template/features/auth/splash/splash_state.dart';
import 'splash_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SplashPage extends StatefulWidget {
  final SplashCubit cubit;
  final SplashDataSources dataSources;

  const SplashPage({
    super.key,
    required this.cubit,
    required this.dataSources,
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
    cubit.checkUser();
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.dataSources.state;
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: Padding(
        padding: EdgeInsets.all(80.0.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            BlocBuilder(
              bloc: widget.dataSources,
              builder: (context, state) {
                // Extract the logo URL from data or use a default value
                final String logoUrl = data.isNotEmpty
                    ? data['data']['app_logo']
                    : ''; // Default placeholder URL

                return CachedNetworkImage(
                  imageUrl: logoUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => shimmer(
                    child: CircleAvatar(radius: 80.r),
                  ), // Display shimmer while loading
                  errorWidget: (context, url, error) =>
                      const CircularProgressIndicator.adaptive(),
                );
              },
            ),

            // BlocBuilder(
            //     bloc: cubit,
            //     builder: (context, state) {
            //       state as SplashState;
            //       print("data${state.response.status}");
            //       return StatusSwitcher<Map<String, dynamic>>(
            //           response: state.response,
            //           onLoading: (BuildContext context) =>
            //               shimmer(child: CircleAvatar(radius: 80.r)),
            //           onCompleted: (BuildContext context, data) {
            //             return CachedNetworkImage(
            //               imageUrl: data['data']['app_logo'],
            //               fit: BoxFit.cover,
            //               placeholder: (context, url) => shimmer(
            //                   child: CircleAvatar(
            //                       radius: 80.r)), // Placeholder while loading
            //               errorWidget: (context, url, error) =>
            //                   const Icon(Icons.error), // Handle error
            //             );
            //           });
            //     }),
            Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: const CircularProgressIndicator.adaptive(
                            backgroundColor: Colors.black,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white70))),
                    40.verticalSpace,
                    const Text('Crafted with ❤ by Ramz')
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
