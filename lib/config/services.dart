import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Services {
  // static cachedNetworkImage(image) => CachedNetworkImage(
  //     imageUrl: image,
  //     fit: BoxFit.cover,
  //     placeholder: (context, url) => const CircularProgressIndicator(),
  //     errorWidget: (context, url, error) => const Icon(Icons.error));
}

countryCodePicker(
        {required BuildContext context,
        void Function(CountryCode)? onChanged}) =>
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0.r),
          border: Border.all(
            strokeAlign: 1,
            color: const Color(0xffEFE9E9),
          )),
      child: CountryCodePicker(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          boxDecoration:
              BoxDecoration(borderRadius: BorderRadius.circular(8.0.r)),
          textStyle: Theme.of(context).textTheme.titleLarge,
          onChanged: onChanged,
          initialSelection: 'OM',
          favorite: const ['OM'],
          countryFilter: const [
            'DZ', // Algeria
            'BH', // Bahrain
            'EG', // Egypt
            'IQ', // Iraq
            'JO', // Jordan
            'KW', // Kuwait
            'LB', // Lebanon
            'LY', // Libya
            'MA', // Morocco
            'OM', // Oman
            'PS', // Palestine
            'QA', // Qatar
            'SA', // Saudi Arabia
            'SD', // Sudan
            'SY', // Syria
            'TN', // Tunisia
            'AE', // United Arab Emirates
            'YE', // Yemen
            'SO', // Somalia
            'KM', // Comoros
            'MR' // Mauritania
          ],
          showCountryOnly: false,
          showOnlyCountryWhenClosed: false),
    );
