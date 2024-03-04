import 'dart:convert';

class User {
  String id;
  String name;
  String email;
  String token;
  String password;
  String profilePicturePath;
  String lastname;
  String title;
  String birthdate;
  String role;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    required this.password,
    this.profilePicturePath = "",
    this.lastname = "",
    this.title = "",
    this.birthdate = "",
    this.role = "User",
  });

  factory User.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> userJson = json['user'] ?? {};
    return User(
      id: userJson['_id'] ?? '',
      email: userJson['email'] ?? '',
      password: userJson['password'] ?? '',
      name: userJson['name'] ?? '',
      lastname: userJson['lastname'] ?? '',
      title: userJson['title'] ?? "",
      birthdate: userJson['birthdate'] ?? "",
      role: userJson['role'] ?? "User",
      profilePicturePath: userJson['profile_picture'] ?? "",
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'token': token,
      'password': password,
      'profile_picture': profilePicturePath,
      'lastname': lastname,
      'title': title,
      'birthdate': birthdate,
      'role': role,
    };
  }

  String toJson() => json.encode(toMap());
}
