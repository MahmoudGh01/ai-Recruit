import 'dart:io';

import 'package:airecruit/services/FileManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:path_provider/path_provider.dart';

import '../../../utils/constants.dart';


Future<List<String>> fetchFilesList() async {
  final response = await http.get(Uri.parse('${Constants.uri}/files'));

  if (response.statusCode == 200) {
    List<dynamic> files = jsonDecode(response.body);
    return files.cast<String>();
  } else {
    throw Exception('Failed to load files');
  }
}




class FilesListScreen extends StatefulWidget {
  @override
  _FilesListScreenState createState() => _FilesListScreenState();
}

class _FilesListScreenState extends State<FilesListScreen> {
  late Future<List<String>> filesList;
  FileManager fileManager = FileManager();

  Future<String> download(BuildContext context, String filename) {
    return fileManager.downloadFile(
      context: context,
      filename: filename,
    );
  }
  @override
  void initState() {
    super.initState();
    filesList = fetchFilesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder<List<String>>(
        future: filesList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (snapshot.data!.isEmpty) {
              return Center(child: Text('No files available.'));
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Icon(Icons.picture_as_pdf, color: Colors.white),
                    ),
                    title: Text(snapshot.data![index], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    trailing: IconButton(
                      icon: Icon(Icons.download_rounded, color: Theme.of(context).primaryColor),
                      onPressed: () {
                        // Trigger download
                      },
                    ),
                    onTap: () async {
                      String filename = snapshot.data![index];
                      String filePath = await download(context, filename);
                      openPdf(context, filePath);
                    },
                  ),
                );


              },
            );

          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _uploadResume();
        },
        tooltip: 'Upload Resume',
        child: Icon(Icons.file_upload),
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


void openPdf(BuildContext context, String filePath) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => PdfViewPage(path: filePath),
    ),
  );
}

class PdfViewPage extends StatefulWidget {
  final String path;

  PdfViewPage({required this.path});

  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PDFView(
        filePath: widget.path,
      ),
    );
  }
}

