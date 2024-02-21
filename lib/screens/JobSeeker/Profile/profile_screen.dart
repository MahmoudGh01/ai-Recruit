import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../providers/userprovider.dart';
import '../../../utils/globalColors.dart';

// Convert ProfileScreen1 to a StatefulWidget
class ProfileScreen1 extends StatefulWidget {
  @override
  _ProfileScreen1State createState() => _ProfileScreen1State();
}

class _ProfileScreen1State extends State<ProfileScreen1> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'Assets/logo.png',
              width: 40,
              height: 40,
            ),
            SizedBox(width: 10),
            Text(
              'My Profile',
              style: TextStyle(
                  fontSize: 20, fontFamily: AutofillHints.creditCardNumber),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: GestureDetector(
                onTap: _pickImage,
                child: _image != null
                    ? CircleAvatar(
                        radius: 60,
                        backgroundImage: FileImage(_image!),
                      )
                    : CircleAvatar(
                  radius: 60,
                  backgroundColor: GlobalColors.primaryColor,
                  backgroundImage: user.profilePicturePath.isNotEmpty
                      ? NetworkImage(user.profilePicturePath)
                      : AssetImage('assets/default_profile.png') as ImageProvider,
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              user.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(user.email),
            SizedBox(height: 20),
            InformationTile(title: 'Name', content: user.name),
            InformationTile(title: 'Email', content: user.email),
            InformationTile(title: 'Birthdate', content: user.birthdate), // Assuming you have added birthdate
            InformationTile(title: 'Job Title', content: user.title), // Assuming title is the job title
// If you've added roles as a list or single value, display them accordingly
            InformationTile(title: 'Role', content: user.role), // Assuming role is a single value or concatenated string

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: GlobalColors
                      .buttonColor, // Make sure this color is defined in your GlobalColors
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  textStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
                child: Text("Edit Profile"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InformationTile extends StatelessWidget {
  final String title;
  final String content;

  const InformationTile({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(content),
    );
  }
}
