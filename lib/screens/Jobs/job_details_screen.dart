import 'package:airecruit/models/job_model.dart';
import 'package:airecruit/screens/JobApplication/ApplicationForm.dart';
import 'package:airecruit/utils/globalColors.dart';
import 'package:flutter/material.dart';
import 'package:airecruit/services/job_service.dart';


import '../main_screen.dart';
import 'edit_job_screen.dart';

class JobDetailsScreen extends StatelessWidget {
  final JobModel job;
  final JobService jobService = JobService();

  JobDetailsScreen({required this.job});

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
              'Find your Job',
              style: TextStyle(
                  fontSize: 20, fontFamily: AutofillHints.creditCardNumber),
            ),

          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Job Title and Company
              Card(
                surfaceTintColor: Colors.white,
                elevation: 4,
                child: ListTile(
                  leading: Icon(Icons.work, color: GlobalColors.secondaryColor),
                  title: Text(job.jobTitle, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: Text(job.companyInformation),
                ),
              ),

              // Job Details Section
              Card(
                surfaceTintColor: Colors.white,
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailSection(title: "Description", content: job.jobDescription),
                      DetailSection(title: "Location", content: job.location),
                      DetailSection(title: "Employment Type", content: job.employmentType),
                      DetailSection(title: "Salary", content: job.salaryCompensation),
                    ],
                  ),
                ),
              ),

              // Requirements List
              Text("Requirements", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: GlobalColors.secondaryColor)),
              ...job.requirements.map((requirement) => ListTile(
                leading: Icon(Icons.check_circle_outline, color: GlobalColors.secondaryColor),
                title: Text(requirement),
              )).toList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ApplicationForm(job))),
        label: Text('Apply Now',style: TextStyle(color: Colors.white),),
        icon: Icon(Icons.send,color: Colors.white,),
        backgroundColor: GlobalColors.buttonColor,
      ),
    );
  }

  Widget DetailSection({required String title, required String content}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: GlobalColors.primaryColor)),
          SizedBox(height: 4),
          Text(content, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }


  Future<void> showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Job'),
          content: const Text('Are you sure you want to delete this job?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await jobService.deleteJob(job.id);
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainScreen(),
                  ),
                ); // Close the JobDetailsScreen
              },
              child: const Text(
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