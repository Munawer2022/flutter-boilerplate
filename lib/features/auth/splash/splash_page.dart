import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/config/app_images.dart';
import 'package:flutter_template/config/shimmer.dart';
import 'package:flutter_template/config/status_switcher.dart';
import 'package:flutter_template/data/datasources/app/app_data_sources.dart';
import 'package:flutter_template/data/datasources/app/logo_data_sources.dart';
import 'package:flutter_template/data/models/auth/splash/language_translations_model.dart';
import 'package:flutter_template/data/models/auth/splash/splash_model.dart';
import 'package:flutter_template/features/auth/splash/splash_state.dart';
import 'splash_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SplashPage extends StatefulWidget {
  final SplashCubit cubit;
  final AppDataSources dataSources;
  final LogoDataSources logoDataSources;

  const SplashPage({
    super.key,
    required this.cubit,
    required this.dataSources,
    required this.logoDataSources,
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
    final logo = widget.logoDataSources.state;
    final String logoBase64 =
        data.isNotEmpty ? data['data']['app_logo_base64'] : '';

    Uint8List? logoBytes;
    Uint8List? logoBytes2;
    if (logoBase64.isNotEmpty) {
      try {
        logoBytes = base64Decode(logoBase64);
      } catch (e) {
        logoBytes = null;
      }
    }
    if (logo.isNotEmpty) {
      try {
        // Try to decode the logo data as base64, else use it as URL
        logoBytes2 = base64Decode(logo);
      } catch (e) {
        // If decoding fails, treat logo as a URL and handle it differently (e.g., display a network image)
        logoBytes2 = null;
      }
    }
    print("applogo $logo");
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: Padding(
        padding: EdgeInsets.all(80.0.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),

            if (logo.isNotEmpty)
              Image.memory(logoBytes2!, fit: BoxFit.cover)
            else
              BlocBuilder(
                bloc: widget.dataSources,
                builder: (context, state) {
                  if (logoBytes != null) {
                    return Image.memory(logoBytes, fit: BoxFit.cover);
                  } else {
                    return shimmer(child: CircleAvatar(radius: 80.r));
                  }
                },
              ),

            // BlocBuilder(
            //   bloc: widget.dataSources,
            //   builder: (context, state) {
            //     // Extract the logo URL from data or use a default value
            //     final String logoUrl = data.isNotEmpty
            //         ? data['data']['app_logo']
            //         : ''; // Default placeholder URL

            //     return CachedNetworkImage(
            //       imageUrl: logoUrl,
            //       fit: BoxFit.cover,
            //       placeholder: (context, url) => shimmer(
            //         child: CircleAvatar(radius: 80.r),
            //       ), // Display shimmer while loading
            //       errorWidget: (context, url, error) =>
            //           const CircularProgressIndicator.adaptive(),
            //     );
            //   },
            // ),
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
