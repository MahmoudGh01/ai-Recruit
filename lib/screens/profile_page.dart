
import 'package:flutter/material.dart';

import '../services/FileManager.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _degreeTypeController = TextEditingController();
  FileManager fileManager = FileManager();
  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _universityController.dispose();
    _degreeTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Full name'),
            ),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            TextField(
              controller: _universityController,
              decoration: InputDecoration(labelText: 'University or College'),
            ),
            TextField(
              controller: _degreeTypeController,
              decoration: InputDecoration(labelText: 'Degree Type'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadResume,
              child: Text('Upload Resume'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _uploadResume() async {
    // Show a dialog or perform other UI updates before uploading
    // showDialog or other UI code...

    // Call the file manager to upload the resume
    await fileManager.uploadFileToBackend();
  }

  uploadFile() {
    return fileManager.uploadFileToBackend();
  }
}
