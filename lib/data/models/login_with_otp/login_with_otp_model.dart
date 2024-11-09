class LoginWithOtpModel {
  String phone;

  LoginWithOtpModel({
    required this.phone,
  });
  Map<String, dynamic> toJson() => {"phone": phone};
}
