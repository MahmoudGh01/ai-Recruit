import 'dart:convert';
import 'dart:io';

import 'package:airecruit/widgets/skill_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../providers/userprovider.dart';
import '../../../services/FileManager.dart';
import '../../../utils/constants.dart';
import '../../../utils/globalColors.dart';
import '../../../widgets/resume_widget.dart';
import '../../../widgets/social_medialink_widget.dart';
import '../../../widgets/work_experience_widget.dart';
import 'edit_profile_page.dart';
import 'package:http/http.dart' as http;

class ProfileScreen1 extends StatefulWidget {
  @override
  _ProfileScreen1State createState() => _ProfileScreen1State();
}

Future<List<String>> fetchFilesList() async {
  final response = await http.get(Uri.parse('${Constants.uri}/files'));

  if (response.statusCode == 200) {
    List<dynamic> files = jsonDecode(response.body);
    return files.cast<String>();
  } else {
    throw Exception('Failed to load files');
  }
}

class _ProfileScreen1State extends State<ProfileScreen1> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  late Future<List<String>> filesList;
  FileManager fileManager = FileManager();
  Future<void> _uploadResume() async {
    await fileManager.uploadFileToBackend();
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  @override
  void initState() {
    super.initState();
    filesList = fetchFilesList();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    List<Map<String, dynamic>> skills = [
      {'name': 'PHP', 'percentage': 86.0},
      {'name': 'Java', 'percentage': 48.0},
      // Add more skills as needed
    ];
    List<Map<String, dynamic>> socialLinks = [
      {
        'name': 'LinkedIn',
        'icon': Icons
            .linked_camera, // or any other icon that suits the social network
        'url': 'https://www.linkedin.com/in/username'
      },
      {
        'name': 'GitHub',
        'icon': Icons.code, // or any other icon that suits the social network
        'url': 'https://www.github.com/username'
      },
      {
        'name': 'Twitter',
        'icon': Icons.chat, // or any other icon that suits the social network
        'url': 'https://www.twitter.com/username'
      },
      // Add more social media links as needed
    ];

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

        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 120,
              height: 120,
              child: CircleAvatar(
                backgroundColor: GlobalColors.buttonColor,
                backgroundImage: user.profilePicturePath.isNotEmpty
                    ? NetworkImage(user.profilePicturePath)
                    : AssetImage('assets/default_profile.png') as ImageProvider,
              ),
            ),
            SizedBox(height: 20),
            Text(
              user.name,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(user.email),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => UpdateProfileScreen())),
              style: ElevatedButton.styleFrom(
                primary: GlobalColors.buttonColor,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              child: Text("Edit Your Profile"),
            ),
            SizedBox(height: 20),
            ResumeSectionWidget(
              title: "Resumes",
              icon: LineAwesomeIcons.pdf_file,
              items: filesList,
            ),
            SkillsSectionWidget(
              title: "Job Skills",
              icon: LineAwesomeIcons.star_1,
              skills: skills,
            ),
           // WorkExperienceWidget(),
            SocialMediaLinksWidget(
              title: "Social Media Links",
              icon: LineAwesomeIcons.link,
              socialLinks: socialLinks,
            )

          ],
        ),
      ),
    );
  }
}
