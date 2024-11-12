class LocalUserInfoStoreModel {
  LocalUserInfoStoreModel({required this.data});

  final Data data;

  LocalUserInfoStoreModel copyWith({Data? data}) {
    return LocalUserInfoStoreModel(data: data ?? this.data);
  }

  factory LocalUserInfoStoreModel.fromJson(Map<String, dynamic> json) {
    return LocalUserInfoStoreModel(data: Data.fromJson(json["data"] ?? {}));
  }
  factory LocalUserInfoStoreModel.empty() {
    return LocalUserInfoStoreModel(data: Data.empty());
  }

  Map<String, dynamic> toJson() => {"data": data.toJson()};
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.token,
    required this.password,
    required this.profileImage,
    required this.otp,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String name;
  final String email;
  final String phone;
  final String token;
  final String password;
  final String profileImage;
  final dynamic otp;
  final String isActive;
  final String createdAt;
  final String updatedAt;

  Data copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? token,
    String? password,
    String? profileImage,
    dynamic otp,
    String? isActive,
    String? createdAt,
    String? updatedAt,
  }) {
    return Data(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      token: token ?? this.token,
      password: password ?? this.password,
      profileImage: profileImage ?? this.profileImage,
      otp: otp ?? this.otp,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      phone: json["phone"] ?? "",
      token: json["token"] ?? "",
      password: json["password"] ?? "",
      profileImage: json["profile_image"] ?? "",
      otp: json["otp"] ?? "",
      isActive: json["is_active"] ?? "",
      createdAt: json["created_at"] ?? "",
      updatedAt: json["updated_at"] ?? "",
    );
  }
  factory Data.empty() {
    return Data(
      id: 0,
      name: "",
      email: "",
      phone: "",
      token: "",
      password: "",
      profileImage: "",
      otp: "",
      isActive: "",
      createdAt: "",
      updatedAt: "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "token": token,
        "password": password,
        "profile_image": profileImage,
        "otp": otp,
        "is_active": isActive,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
