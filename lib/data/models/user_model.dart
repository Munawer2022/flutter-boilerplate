class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String token;
  final String profileImage;
  final bool isActive;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.token,
    required this.profileImage,
    required this.isActive,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      token: json['token'],
      profileImage: json['profile_image'],
      isActive: json['is_active'] == '1',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'token': token,
        'profile_image': profileImage,
        'is_active': isActive ? '1' : '0',
      };
} 