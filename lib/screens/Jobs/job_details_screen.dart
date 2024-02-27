import 'package:airecruit/models/job_model.dart';
import 'package:flutter/material.dart';
import 'package:airecruit/services/job_service.dart';

import 'edit_job_screen.dart';
import 'job_list_screen.dart';


class JobDetailsScreen extends StatelessWidget {
  final JobModel job;
  final JobService jobService = JobService();

  JobDetailsScreen({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              navigateToEditScreen(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              showDeleteConfirmationDialog(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDetailItem('Job Title', job.jobTitle),
            buildDetailItem('Job Description', job.jobDescription),
            buildDetailItem('Company Information', job.companyInformation),
            buildDetailItem('Location', job.location),
            buildDetailItem('Employment Type', job.employmentType),
            buildDetailItem('Salary and Compensation', job.salaryCompensation),
            buildDetailItem(
                'Skills and Qualifications', job.skillsQualifications),
          ],
        ),
      ),
    );
  }

  Widget buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Future<void> showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Job'),
          content: Text('Are you sure you want to delete this job?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await jobService.deleteJob(job.id);
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => JobListScreen()),
                );
              },
              child: Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  void navigateToEditScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditJobScreen(job: job),
      ),
    );
  }
}
