import 'package:airecruit/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    lastname: '',
    email: '',
    token: '',
    password: '',
    profilePicturePath: '',
    birthdate: '',
    title: '',
    role: 'user', // Assuming 'user' as default role
  );

  User get user => _user;

  void setUser(Map<String, dynamic> userMap) {
    _user = User.fromJson(userMap);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }

  void setPasswordResetEmail(String email) {
    _user.email = email;
    notifyListeners();
  }

  void updateUserProfile(String birthdate, String jobTitle) {
    // Update the user's profile on the backend
    // Then update the local user object
    _user.birthdate = birthdate;
    _user.title = jobTitle;
    notifyListeners();
  }
}