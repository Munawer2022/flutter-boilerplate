class LocalUserInfoStoreModel {
  LocalUserInfoStoreModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.token,
    required this.profileImage,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String name;
  final String email;
  final String phone;
  final String token;
  final String profileImage;
  final bool isActive;
  final String createdAt;
  final String updatedAt;

  // Method for creating a copy with optional new values
  LocalUserInfoStoreModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? token,
    String? profileImage,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
  }) {
    return LocalUserInfoStoreModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      token: token ?? this.token,
      profileImage: profileImage ?? this.profileImage,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // Factory constructor for creating an instance from JSON
  factory LocalUserInfoStoreModel.fromJson(Map<String, dynamic> json) {
    return LocalUserInfoStoreModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      phone: json["phone"] ?? "",
      token: json["token"] ?? "",
      profileImage: json["profile_image"] ?? "",
      isActive: json["is_active"] == "1",
      createdAt: json["created_at"] ?? "",
      updatedAt: json["updated_at"] ?? "",
    );
  }

  // Factory constructor for creating an empty instance
  factory LocalUserInfoStoreModel.empty() {
    return LocalUserInfoStoreModel(
      id: 0,
      name: "",
      email: "",
      phone: "",
      token: "",
      profileImage: "",
      isActive: false,
      createdAt: "",
      updatedAt: "",
    );
  }

  // Method for converting an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
      "token": token,
      "profile_image": profileImage,
      "is_active": isActive ? "1" : "0",
      "created_at": createdAt,
      "updated_at": updatedAt,
    };
  }
}
