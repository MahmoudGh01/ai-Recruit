import 'package:airecruit/utils/globalColors.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import '../../../../services/FileManager.dart';


class ResumeSectionWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Future<List<String>> items;
  final Color? textColor;

  const ResumeSectionWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.items,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = GlobalColors.secondaryColor;
    var backgroundColor = isDark ? Colors.black : Colors.white;
    var itemTextColor = GlobalColors.secondaryColor;
    FileManager fileManager = FileManager();

    Future<String> download(BuildContext context, String filename) {
      return fileManager.downloadFile(
        context: context,
        filename: filename,
      );
    }
    return ExpansionTileCard(
      baseColor: backgroundColor,
      expandedColor: backgroundColor,
      elevation: 2,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      trailing: IconButton(
        icon: Icon(Icons.add),
        onPressed: _uploadResume
      ),
      title: Row(
        children: [
          Icon(icon, color: iconColor),
          SizedBox(width: 10),
          Text(title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor ?? itemTextColor)),
        ],
      ),
      children: <Widget>[
        Divider(color: iconColor.withOpacity(0.4)),
        FutureBuilder<List<String>>(
          future: items,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (snapshot.data!.isEmpty) {
                return Center(child: Text('No files available.'));
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                      color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),

                      leading: CircleAvatar(
                        backgroundColor: GlobalColors.secondaryColor,
                        child: Icon(Icons.picture_as_pdf, color: Colors.white),
                      ),
                      title: Text(snapshot.data![index],
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      trailing: IconButton(
                        icon: Icon(Icons.download_rounded,
                            color: GlobalColors.secondaryColor),
                        onPressed: () {
                          // Trigger download

                        },
                      ),
                      onTap: () async {
                        // Implement file tap functionality
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
      ],
    );

  }
  Future<void> _uploadResume() async {
    // Show a dialog or perform other UI updates before uploading
    // showDialog or other UI code...
    FileManager fileManager = FileManager();

    // Call the file manager to upload the resume
    await fileManager.uploadFileToBackend();
  }

  uploadFile() {
    FileManager fileManager = FileManager();

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



