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
    required this.profilePicturePath,
    required this.lastname,
    required this.title,
    required this.birthdate,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['_id'] as String,
      email: json['user']['email'] as String,
      password: json['user']['password'] as String,
      name: json['user']['name'] as String,
      lastname: json['user']['lastname'] as String,
      title: json['user']['title'] as String,
      birthdate: json['user']['birthdate'] as String,
      role: json['user']['role'] as String,
      profilePicturePath: json['user']['profile_picture'] as String,
      token: json['token'] ?? '' ,
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
