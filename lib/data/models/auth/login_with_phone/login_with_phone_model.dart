class LoginWithPhoneModel {
  String phone;

  LoginWithPhoneModel({
    required this.phone,
  });
  Map<String, dynamic> toJson() => {"phone": phone};
}
