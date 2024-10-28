class SplashModel {
  final String status;
  final Data data;

  SplashModel({
    required this.status,
    required this.data,
  });

  factory SplashModel.fromJson(Map<String, dynamic> json) => SplashModel(
        status: json['status'] ?? '',
        data: Data.fromJson(json['data'] ?? {}),
      );
  factory SplashModel.empty() => SplashModel(status: '', data: Data.empty());
}

class Data {
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

  Data({
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
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      siteName: json['site_name'] ?? "",
      address: json['address'] ?? "",
      phone: json['phone'] ?? "",
      titleText: json['title_text'] ?? "",
      footerText: json['footer_text'] ?? "",
      defaultLanguage: json['default_language'] ?? "",
      darkLogo: json['dark_logo'] ?? "",
      lightLogo: json['light_logo'] ?? "",
      favicon: json['favicon'] ?? "",
      emailLibrary: json['email_library'] ?? "",
      fromEmail: json['from_email'] ?? "",
      smtpHost: json['smtp_host'] ?? "",
      smtpPort: json['smtp_port'] ?? "",
      usernameEmail: json['username_email'] ?? "",
      password: json['password'] ?? "",
      encryption: json['encryption'] ?? "",
      testEmail: json['test_email'] ?? "",
      thawaniUrl: json['thawani_url'] ?? "",
      thawaniSecretKey: json['thwani_secret_key'] ?? "",
      thawaniPublishKey: json['thwani_publish_key'] ?? "",
      newUser: json['new_user'] ?? "",
      newUserSubject: json['new_user_subject'] ?? "",
      newUserEmailTemplate: json['new_user_email_template'] ?? "",
      bookingSubject: json['booking_subject'],
      bookingTemplate: json['booking_template'] ?? "",
      statusSubject: json['status_subject'],
      statusTemplate: json['status_template'] ?? "",
      timezone: json['timezone'] ?? "",
      thawaniActive: json['thwani_active'] ?? "",
      invoiceHeader: json['invoice_header'] ?? "",
      invoicePrefix: json['invoice_prefix'] ?? "",
      invoiceNumberFormat: json['invoice_number_format'] ?? "",
      invoiceColor: json['invoice_color'] ?? "",
      invoiceItemBackgroundColor: json['invoice_item_background_color'] ?? "",
      invoiceStyle: json['invoice_style'] ?? "",
      invoiceFooter: json['invoice_footer'] ?? "",
      invoiceLogo: json['invoice_logo'] ?? "",
      defaultCurrency: json['default_currency'] ?? "",
      profile: json['profile'] ?? "",
      loginBackground: json['login_background'] ?? "",
      primaryColor: json['primary_color'] ?? "",
      awsAccessKey: json['aws_access_key'] ?? "",
      awsSecretKey: json['aws_secret_key'] ?? "",
      awsRegion: json['aws_region'] ?? "",
      awsBucket: json['aws_bucket'] ?? "",
      awsActive: json['aws_active'] ?? "",
      webhook: json['webhook'] ?? "",
      appPrimaryColor: json['app_primary_color'] ?? "",
      appSecondaryColor: json['app_secondary_color'] ?? "",
      appLogo: json['app_logo'] ?? "",
      appButtonDisableColor: json['app_button_disable_color'] ?? "",
      appHeadingColor: json['app_heading_color'] ?? "",
      appButtonActiveColor: json['app_button_active_color'] ?? "",
      appSubheadingColor: json['app_subheading_color'] ?? "",
      appIconColor: json['app_icon_color'] ?? "",
      appSplashScreenBgColor: json['app_splash_screen_bg_color'] ?? "",
      appSplashScreenLogo: json['app_logo'] ?? "",
      // appSplashScreenLogo: json['app_splash_screen_logo'] ?? "",
      appOnboardingTitle1: json['app_onboarding_title_1'] ?? "",
      appOnboardingSubtitle1: json['app_onboarding_subtitle_1'] ?? "",
      appOnboardingTitle2: json['app_onboarding_title_2'] ?? "",
      appOnboardingSubtitle2: json['app_onboarding_subtitle_2'] ?? "",
      appOnboardingTitle3: json['app_onboarding_title_3'] ?? "",
      appOnboardingSubtitle3: json['app_onboarding_subtitle_3'] ?? "",
      appOnboardingImage1: json['app_onboarding_image_1'] ?? "",
      appOnboardingImage2: json['app_onboarding_image_2'] ?? "",
      appOnboardingImage3: json['app_onboarding_image_3'] ?? "",
    );
  }
  Data.empty()
      : siteName = "",
        address = "",
        phone = "",
        titleText = "",
        footerText = "",
        defaultLanguage = "",
        darkLogo = "",
        lightLogo = "",
        favicon = "",
        emailLibrary = "",
        fromEmail = "",
        smtpHost = "",
        smtpPort = "",
        usernameEmail = "",
        password = "",
        encryption = "",
        testEmail = "",
        thawaniUrl = "",
        thawaniSecretKey = "",
        thawaniPublishKey = "",
        newUser = "",
        newUserSubject = "",
        newUserEmailTemplate = "",
        bookingSubject = "",
        bookingTemplate = "",
        statusSubject = "",
        statusTemplate = "",
        timezone = "",
        thawaniActive = "",
        invoiceHeader = "",
        invoicePrefix = "",
        invoiceNumberFormat = "",
        invoiceColor = "",
        invoiceItemBackgroundColor = "",
        invoiceStyle = "",
        invoiceFooter = "",
        invoiceLogo = "",
        defaultCurrency = "",
        profile = "",
        loginBackground = "",
        primaryColor = "",
        awsAccessKey = "",
        awsSecretKey = "",
        awsRegion = "",
        awsBucket = "",
        awsActive = "",
        webhook = "",
        appPrimaryColor = "",
        appSecondaryColor = "",
        appLogo = "",
        appButtonDisableColor = "",
        appHeadingColor = "",
        appButtonActiveColor = "",
        appSubheadingColor = "",
        appIconColor = "",
        appSplashScreenBgColor = "",
        appSplashScreenLogo = "",
        appOnboardingTitle1 = "",
        appOnboardingSubtitle1 = "",
        appOnboardingTitle2 = "",
        appOnboardingSubtitle2 = "",
        appOnboardingTitle3 = "",
        appOnboardingSubtitle3 = "",
        appOnboardingImage1 = "",
        appOnboardingImage2 = "",
        appOnboardingImage3 = "";
}
