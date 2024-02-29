import 'package:airecruit/utils/globalColors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Applications',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: JobApplicationsScreen(),
    );
  }
}

class JobApplicationsScreen extends StatefulWidget {
  @override
  _JobApplicationsScreenState createState() => _JobApplicationsScreenState();
}

class _JobApplicationsScreenState extends State<JobApplicationsScreen> {
  List<dynamic> jobApplications = [];
  String selectedStatus = 'All'; // Default selected status
  int selectedApplicationIndex = -1;

  @override
  void initState() {
    super.initState();
    fetchJobApplications();
  }

  Future<void> fetchJobApplications() async {
    try {
      final response = await http
          .get(Uri.parse('${Constants.uri}/job-applications'));
      if (response.statusCode == 200) {
        final List<dynamic> applications =
            json.decode(response.body) as List<dynamic>;
        for (final application in applications) {
          final jobID = application['job_id'];
          final jobDetails = await fetchJobDetails(jobID);
          application['jobDetails'] = jobDetails;
        }
        setState(() {
          jobApplications = applications;
        });
      } else {
        // Handle error
        print('Failed to fetch job applications: ${response.statusCode}');
      }
    } catch (e) {
      // Handle error
      print('Error fetching job applications: $e');
    }
  }

  Future<Map<String, dynamic>> fetchJobDetails(String jobID) async {
    try {
      final response =
          await http.get(Uri.parse('${Constants.uri}/jobss/$jobID'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jobDetails =
            json.decode(response.body) as Map<String, dynamic>;
        return jobDetails;
      } else {
        // Handle error
        print('Failed to fetch job details: ${response.statusCode}');
        return {}; // Return an empty map
      }
    } catch (e) {
      // Handle error
      print('Error fetching job details: $e');
      return {}; // Return an empty map
    }
  }

  @override
  Widget build(BuildContext context) {
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
              'My Job Applications',
              style: TextStyle(
                  fontSize: 20, fontFamily: AutofillHints.creditCardNumber),
            ),

          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildStatusButton('All'),
                  _buildStatusButton('In Progress'),
                  _buildStatusButton('Rejected'),
                  _buildStatusButton('Archived'),
                  _buildStatusButton('Interview scheduled'),
                  _buildStatusButton('Shortlisted'),
                  _buildStatusButton('Hired'),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: jobApplications.length,
              itemBuilder: (context, index) {
                final application = jobApplications[index];
                final firstName = application['firstName'];
                final lastName = application['lastName'];
                final email = application['email'];
                final jobDetails = application['jobDetails'];
                final jobTitle =
                    jobDetails != null ? jobDetails['jobTitle'] : 'N/A';
                final location =
                    jobDetails != null ? jobDetails['location'] : 'N/A';

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey, // Choose your border color
                          width: 0.5, // Choose the width of the border
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.asset('Assets/logo.png', height: 40),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('$jobTitle',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.edit_document,
                                      size: 20,
                                      color: Colors.black54,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text('Internship'),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 20,
                                      color: Colors.black54,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text('$location'),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.timer_outlined,
                                      size: 20,
                                      color: Colors.black54,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text('1 day ago'),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusButton(String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedStatus = status;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: selectedStatus == status
                  ? GlobalColors.secondaryColor
                  : Colors.black,
              width: 0.5,
            ),
            color: selectedStatus == status
                ? GlobalColors.secondaryColor.withOpacity(0.8)
                : Colors.transparent,
          ),
          padding: EdgeInsets.all(8.0),
          child: Text(
            status,
            style: TextStyle(
              color: selectedStatus == status ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildJobApplicationTile(Map<String, dynamic> application) {
    final firstName = application['firstName'];
    final lastName = application['lastName'];
    final email = application['email'];
    final job = application['job'];
    final jobTitle = job != null ? job['jobTitle'] : 'N/A';
    final location = job != null ? job['location'] : 'N/A';

    return ListTile(
      title: Text('Name: $firstName $lastName'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Email: $email'),
          Text('Job Title: $jobTitle'),
          Text('Location: $location'),
        ],
      ),
    );
  }
}
