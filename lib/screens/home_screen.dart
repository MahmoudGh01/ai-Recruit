import 'package:airecruit/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_card/image_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JobListPage(),
    );
  }
}

class Job {
  final String employerName;
  final String employerLogo;
  final String jobTitle;
  final String jobDescription;
  final String jobApplyLink;

  Job({
    required this.employerName,
    required this.employerLogo,
    required this.jobTitle,
    required this.jobDescription,
    required this.jobApplyLink,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      employerName: json['employer_name'] ?? 'N/A',
      employerLogo: json['employer_logo'] ?? '',
      jobTitle: json['job_title'] ?? 'N/A',
      jobDescription: json['job_description'] ?? 'N/A',
      jobApplyLink: json['job_apply_link'] ?? '',
    );
  }
}

class JobListPage extends StatefulWidget {
  @override
  _JobListPageState createState() => _JobListPageState();
}

class _JobListPageState extends State<JobListPage> {
  List<Job> _jobs = [];

  @override
  void initState() {
    super.initState();
    _fetchJobs();
  }

  Future<void> _fetchJobs() async {
    var queryParams = {
      'query': 'Python developer in Texas, USA',
    };

    var url = Uri.https(
      'jsearch.p.rapidapi.com',
      '/search',
      queryParams,
    );

    try {
      var response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'X-RapidAPI-Key': '136114878emsh4b728b9983671a6p118402jsna9c59fae3d04', // Replace with your API key
          'X-RapidAPI-Host': 'jsearch.p.rapidapi.com',
        },
      );

      if (response.statusCode == 200) {
        var jsonMap = json.decode(response.body);

        if (jsonMap is Map<String, dynamic> && jsonMap.containsKey('data')) {
          // Assuming the list of jobs is under the 'data' key
          var jobsList = jsonMap['data'] as List;
          setState(() {
            _jobs = jobsList.map((jobJson) => Job.fromJson(jobJson)).toList();
          });
        } else {
          showSnackBar(context, 'Unexpected JSON format');
        }
      } else {
        showSnackBar(context, 'Error: ${response.statusCode}');
      }
    } on Exception catch (e) {
      showSnackBar(context, e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Job Listings'),
      ),
      body: ListView.builder(
        itemCount: _jobs.length,
        itemBuilder: (context, index) {
          var job = _jobs[index];
          return Center(
            child: TransparentImageCard(
              width: double.infinity, // Assuming you want it to take the full width available
              borderRadius: 12.0, // You can adjust the border radius as needed
              imageProvider: NetworkImage(job.employerLogo),
              //fallbackAssetImage: 'assets/placeholder.png', // Assuming you have a placeholder image in assets
              tags: [
                _tag(job.employerName, () {
                  // TODO: Implement tag tap action, if needed
                }),
              ],
              title: _title(job.jobTitle, color: Colors.white),
              //description: _content(job.jobTitle, color: Colors.white),

              // You may need to adjust the styles to match the TransparentImageCard's API
            ),
          );
        },
      ),
    );
  }

  Widget _tag(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        label: Text(text),
        backgroundColor: Colors.white.withOpacity(0.5),
      ),
    );
  }

  Widget _title(String text, {Color color = Colors.white}) {
    return Text(
      text,
      style: TextStyle(color: color, fontWeight: FontWeight.bold),
    );
  }

  Widget _content(String text, {Color color = Colors.white}) {
    return Text(
      text,
      style: TextStyle(color: color),
    );
  }
}
