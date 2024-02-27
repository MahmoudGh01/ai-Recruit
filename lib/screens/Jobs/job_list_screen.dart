import 'package:airecruit/models/job_model.dart';

import 'package:airecruit/services/job_service.dart';
import 'package:flutter/material.dart';

import 'create_job_screen.dart';
import 'job_details_screen.dart';

class JobListScreen extends StatefulWidget {
  @override
  _JobListScreenState createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
  final JobService _jobService = JobService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job List'),
        backgroundColor: Color(0xFFed6843),
      ),
      body: FutureBuilder<List<JobModel>>(
        future: _jobService.getAllJobs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<JobModel> jobs = snapshot.data ?? [];
            return ListView.builder(
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    leading: Icon(
                      Icons.work,
                      color: Color(0xFFed6843),
                      size: 32, // Adjust the size as needed
                    ),
                    title: Text(
                      jobs[index].jobTitle,
                      style: TextStyle(
                        color: Color(0xFFed6843),
                        fontWeight: FontWeight.bold,
                        fontSize: 18, // Adjust the size as needed
                      ),
                    ),
                    subtitle: Text(
                      jobs[index].companyInformation,
                      style:
                          TextStyle(fontSize: 16), // Adjust the size as needed
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              JobDetailsScreen(job: jobs[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateJobScreen()),
          );
        },
        backgroundColor: Color(0xFFed6843),
        child: Icon(Icons.add),
      ),
    );
  }
}
