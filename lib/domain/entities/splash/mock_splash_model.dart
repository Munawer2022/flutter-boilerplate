import 'package:equatable/equatable.dart';

class MockSplashModel {
  final String status;
  final MockData data;

  const MockSplashModel({
    required this.status,
    required this.data,
  });
  const MockSplashModel.empty()
      : status = '',
        data = const MockData.empty();

  // copyWith method for SplashModel
  MockSplashModel copyWith({
    String? status,
    MockData? data,
  }) {
    return MockSplashModel(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  // @override
  // List<Object?> get props => throw UnimplementedError();
}

class MockData {
  final String siteName;
  final String address;
  final String phone;
  final String titleText;
  final String footerText;
  final String defaultLanguage;
  final String darkLogo;
  final String lightLogo;
  final String favicon;
  final String emailLibrary;
  final String fromEmail;
  final String smtpHost;
  final String smtpPort;
  final String usernameEmail;
  final String password;
  final String encryption;
  final String testEmail;
  final String thawaniUrl;
  final String thawaniSecretKey;
  final String thawaniPublishKey;
  final String newUser;
  final String newUserSubject;
  final String newUserEmailTemplate;
  final String? bookingSubject;
  final String bookingTemplate;
  final String? statusSubject;
  final String statusTemplate;
  final String timezone;
  final String thawaniActive;
  final String invoiceHeader;
  final String invoicePrefix;
  final String invoiceNumberFormat;
  final String invoiceColor;
  final String invoiceItemBackgroundColor;
  final String invoiceStyle;
  final String invoiceFooter;
  final String invoiceLogo;
  final String defaultCurrency;
  final String profile;
  final String loginBackground;
  final String primaryColor;
  final String awsAccessKey;
  final String awsSecretKey;
  final String awsRegion;
  final String awsBucket;
  final String awsActive;
  final String webhook;
  final String appPrimaryColor;
  final String appSecondaryColor;
  final String appLogo;
  final String appButtonDisableColor;
  final String appHeadingColor;
  final String appButtonActiveColor;
  final String appSubheadingColor;
  final String appIconColor;
  final String appSplashScreenBgColor;
  final String appSplashScreenLogo;
  final String appOnboardingTitle1;
  final String appOnboardingSubtitle1;
  final String appOnboardingTitle2;
  final String appOnboardingSubtitle2;
  final String appOnboardingTitle3;
  final String appOnboardingSubtitle3;
  final String appOnboardingImage1;
  final String appOnboardingImage2;
  final String appOnboardingImage3;

  const MockData({
    required this.siteName,
    required this.address,
    required this.phone,
    required this.titleText,
    required this.footerText,
    required this.defaultLanguage,
    required this.darkLogo,
    required this.lightLogo,
    required this.favicon,
    required this.emailLibrary,
    required this.fromEmail,
    required this.smtpHost,
    required this.smtpPort,
    required this.usernameEmail,
    required this.password,
    required this.encryption,
    required this.testEmail,
    required this.thawaniUrl,
    required this.thawaniSecretKey,
    required this.thawaniPublishKey,
    required this.newUser,
    required this.newUserSubject,
    required this.newUserEmailTemplate,
    this.bookingSubject,
    required this.bookingTemplate,
    this.statusSubject,
    required this.statusTemplate,
    required this.timezone,
    required this.thawaniActive,
    required this.invoiceHeader,
    required this.invoicePrefix,
    required this.invoiceNumberFormat,
    required this.invoiceColor,
    required this.invoiceItemBackgroundColor,
    required this.invoiceStyle,
    required this.invoiceFooter,
    required this.invoiceLogo,
    required this.defaultCurrency,
    required this.profile,
    required this.loginBackground,
    required this.primaryColor,
    required this.awsAccessKey,
    required this.awsSecretKey,
    required this.awsRegion,
    required this.awsBucket,
    required this.awsActive,
    required this.webhook,
    required this.appPrimaryColor,
    required this.appSecondaryColor,
    required this.appLogo,
    required this.appButtonDisableColor,
    required this.appHeadingColor,
    required this.appButtonActiveColor,
    required this.appSubheadingColor,
    required this.appIconColor,
    required this.appSplashScreenBgColor,
    required this.appSplashScreenLogo,
    required this.appOnboardingTitle1,
    required this.appOnboardingSubtitle1,
    required this.appOnboardingTitle2,
    required this.appOnboardingSubtitle2,
    required this.appOnboardingTitle3,
    required this.appOnboardingSubtitle3,
    required this.appOnboardingImage1,
    required this.appOnboardingImage2,
    required this.appOnboardingImage3,
  });
  const MockData.empty()
      : siteName = '',
        address = '',
        phone = '',
        titleText = '',
        footerText = '',
        defaultLanguage = '',
        darkLogo = '',
        lightLogo = '',
        favicon = '',
        emailLibrary = '',
        fromEmail = '',
        smtpHost = '',
        smtpPort = '',
        usernameEmail = '',
        password = '',
        encryption = '',
        testEmail = '',
        thawaniUrl = '',
        thawaniSecretKey = '',
        thawaniPublishKey = '',
        newUser = '',
        newUserSubject = '',
        newUserEmailTemplate = '',
        bookingSubject = null,
        bookingTemplate = '',
        statusSubject = null,
        statusTemplate = '',
        timezone = '',
        thawaniActive = '',
        invoiceHeader = '',
        invoicePrefix = '',
        invoiceNumberFormat = '',
        invoiceColor = '',
        invoiceItemBackgroundColor = '',
        invoiceStyle = '',
        invoiceFooter = '',
        invoiceLogo = '',
        defaultCurrency = '',
        profile = '',
        loginBackground = '',
        primaryColor = '',
        awsAccessKey = '',
        awsSecretKey = '',
        awsRegion = '',
        awsBucket = '',
        awsActive = '',
        webhook = '',
        appPrimaryColor = '',
        appSecondaryColor = '',
        appLogo = '',
        appButtonDisableColor = '',
        appHeadingColor = '',
        appButtonActiveColor = '',
        appSubheadingColor = '',
        appIconColor = '',
        appSplashScreenBgColor = '',
        appSplashScreenLogo = '',
        appOnboardingTitle1 = '',
        appOnboardingSubtitle1 = '',
        appOnboardingTitle2 = '',
        appOnboardingSubtitle2 = '',
        appOnboardingTitle3 = '',
        appOnboardingSubtitle3 = '',
        appOnboardingImage1 = '',
        appOnboardingImage2 = '',
        appOnboardingImage3 = '';
  MockData copyWith({
    String? siteName,
    String? address,
    String? phone,
    String? titleText,
    String? footerText,
    String? defaultLanguage,
    String? darkLogo,
    String? lightLogo,
    String? favicon,
    String? emailLibrary,
    String? fromEmail,
    String? smtpHost,
    String? smtpPort,
    String? usernameEmail,
    String? password,
    String? encryption,
    String? testEmail,
    String? thawaniUrl,
    String? thawaniSecretKey,
    String? thawaniPublishKey,
    String? newUser,
    String? newUserSubject,
    String? newUserEmailTemplate,
    String? bookingSubject,
    String? bookingTemplate,
    String? statusSubject,
    String? statusTemplate,
    String? timezone,
    String? thawaniActive,
    String? invoiceHeader,
    String? invoicePrefix,
    String? invoiceNumberFormat,
    String? invoiceColor,
    String? invoiceItemBackgroundColor,
    String? invoiceStyle,
    String? invoiceFooter,
    String? invoiceLogo,
    String? defaultCurrency,
    String? profile,
    String? loginBackground,
    String? primaryColor,
    String? awsAccessKey,
    String? awsSecretKey,
    String? awsRegion,
    String? awsBucket,
    String? awsActive,
    String? webhook,
    String? appPrimaryColor,
    String? appSecondaryColor,
    String? appLogo,
    String? appButtonDisableColor,
    String? appHeadingColor,
    String? appButtonActiveColor,
    String? appSubheadingColor,
    String? appIconColor,
    String? appSplashScreenBgColor,
    String? appSplashScreenLogo,
    String? appOnboardingTitle1,
    String? appOnboardingSubtitle1,
    String? appOnboardingTitle2,
    String? appOnboardingSubtitle2,
    String? appOnboardingTitle3,
    String? appOnboardingSubtitle3,
    String? appOnboardingImage1,
    String? appOnboardingImage2,
    String? appOnboardingImage3,
  }) {
    return MockData(
      siteName: siteName ?? this.siteName,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      titleText: titleText ?? this.titleText,
      footerText: footerText ?? this.footerText,
      defaultLanguage: defaultLanguage ?? this.defaultLanguage,
      darkLogo: darkLogo ?? this.darkLogo,
      lightLogo: lightLogo ?? this.lightLogo,
      favicon: favicon ?? this.favicon,
      emailLibrary: emailLibrary ?? this.emailLibrary,
      fromEmail: fromEmail ?? this.fromEmail,
      smtpHost: smtpHost ?? this.smtpHost,
      smtpPort: smtpPort ?? this.smtpPort,
      usernameEmail: usernameEmail ?? this.usernameEmail,
      password: password ?? this.password,
      encryption: encryption ?? this.encryption,
      testEmail: testEmail ?? this.testEmail,
      thawaniUrl: thawaniUrl ?? this.thawaniUrl,
      thawaniSecretKey: thawaniSecretKey ?? this.thawaniSecretKey,
      thawaniPublishKey: thawaniPublishKey ?? this.thawaniPublishKey,
      newUser: newUser ?? this.newUser,
      newUserSubject: newUserSubject ?? this.newUserSubject,
      newUserEmailTemplate: newUserEmailTemplate ?? this.newUserEmailTemplate,
      bookingSubject: bookingSubject ?? this.bookingSubject,
      bookingTemplate: bookingTemplate ?? this.bookingTemplate,
      statusSubject: statusSubject ?? this.statusSubject,
      statusTemplate: statusTemplate ?? this.statusTemplate,
      timezone: timezone ?? this.timezone,
      thawaniActive: thawaniActive ?? this.thawaniActive,
      invoiceHeader: invoiceHeader ?? this.invoiceHeader,
      invoicePrefix: invoicePrefix ?? this.invoicePrefix,
      invoiceNumberFormat: invoiceNumberFormat ?? this.invoiceNumberFormat,
      invoiceColor: invoiceColor ?? this.invoiceColor,
      invoiceItemBackgroundColor:
          invoiceItemBackgroundColor ?? this.invoiceItemBackgroundColor,
      invoiceStyle: invoiceStyle ?? this.invoiceStyle,
      invoiceFooter: invoiceFooter ?? this.invoiceFooter,
      invoiceLogo: invoiceLogo ?? this.invoiceLogo,
      defaultCurrency: defaultCurrency ?? this.defaultCurrency,
      profile: profile ?? this.profile,
      loginBackground: loginBackground ?? this.loginBackground,
      primaryColor: primaryColor ?? this.primaryColor,
      awsAccessKey: awsAccessKey ?? this.awsAccessKey,
      awsSecretKey: awsSecretKey ?? this.awsSecretKey,
      awsRegion: awsRegion ?? this.awsRegion,
      awsBucket: awsBucket ?? this.awsBucket,
      awsActive: awsActive ?? this.awsActive,
      webhook: webhook ?? this.webhook,
      appPrimaryColor: appPrimaryColor ?? this.appPrimaryColor,
      appSecondaryColor: appSecondaryColor ?? this.appSecondaryColor,
      appLogo: appLogo ?? this.appLogo,
      appButtonDisableColor:
          appButtonDisableColor ?? this.appButtonDisableColor,
      appHeadingColor: appHeadingColor ?? this.appHeadingColor,
      appButtonActiveColor: appButtonActiveColor ?? this.appButtonActiveColor,
      appSubheadingColor: appSubheadingColor ?? this.appSubheadingColor,
      appIconColor: appIconColor ?? this.appIconColor,
      appSplashScreenBgColor:
          appSplashScreenBgColor ?? this.appSplashScreenBgColor,
      appSplashScreenLogo: appSplashScreenLogo ?? this.appSplashScreenLogo,
      appOnboardingTitle1: appOnboardingTitle1 ?? this.appOnboardingTitle1,
      appOnboardingSubtitle1:
          appOnboardingSubtitle1 ?? this.appOnboardingSubtitle1,
      appOnboardingTitle2: appOnboardingTitle2 ?? this.appOnboardingTitle2,
      appOnboardingSubtitle2:
          appOnboardingSubtitle2 ?? this.appOnboardingSubtitle2,
      appOnboardingTitle3: appOnboardingTitle3 ?? this.appOnboardingTitle3,
      appOnboardingSubtitle3:
          appOnboardingSubtitle3 ?? this.appOnboardingSubtitle3,
      appOnboardingImage1: appOnboardingImage1 ?? this.appOnboardingImage1,
      appOnboardingImage2: appOnboardingImage2 ?? this.appOnboardingImage2,
      appOnboardingImage3: appOnboardingImage3 ?? this.appOnboardingImage3,
    );
  }

  // @override
  // List<Object?> get props => throw UnimplementedError();
}
