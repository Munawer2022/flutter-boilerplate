class SignUpModel {
  final String name;
  final String email;
  final String phone;
  final String password;

  // Constructor with named parameters, all required
  SignUpModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  // Method to convert the model to a JSON map
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
      };
}
