import 'package:flutter/material.dart';
import 'package:airecruit/models/job_model.dart';
import 'package:airecruit/services/job_service.dart';


class CreateJobScreen extends StatefulWidget {
  @override
  _CreateJobScreenState createState() => _CreateJobScreenState();
}

class _CreateJobScreenState extends State<CreateJobScreen> {
  final JobService _jobService = JobService();
  late TextEditingController jobTitleController;
  late TextEditingController jobDescriptionController;
  late TextEditingController companyInformationController;
  late TextEditingController locationController;
  late TextEditingController employmentTypeController;
  late TextEditingController salaryCompensationController;
  late TextEditingController skillsQualificationsController;

  @override
  void initState() {
    super.initState();
    jobTitleController = TextEditingController();
    jobDescriptionController = TextEditingController();
    companyInformationController = TextEditingController();
    locationController = TextEditingController();
    employmentTypeController = TextEditingController();
    salaryCompensationController = TextEditingController();
    skillsQualificationsController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Job'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextField('Job Title', jobTitleController),
              buildTextField('Job Description', jobDescriptionController),
              buildTextField(
                  'Company Information', companyInformationController),
              buildTextField('Location', locationController),
              buildTextField('Employment Type', employmentTypeController),
              buildTextField(
                  'Salary and Compensation', salaryCompensationController),
              buildTextField(
                  'Skills and Qualifications', skillsQualificationsController),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  JobModel newJob = JobModel(
                    id: '', // Leave the id empty as it will be generated on the server
                    jobTitle: jobTitleController.text,
                    jobDescription: jobDescriptionController.text,
                    companyInformation: companyInformationController.text,
                    location: locationController.text,
                    employmentType: employmentTypeController.text,
                    salaryCompensation: salaryCompensationController.text,
                    skillsQualifications: skillsQualificationsController.text,
                  );

                  await _jobService.createJob(newJob);

                  // Navigate back to the job list screen
                  Navigator.pop(context);
                },
                child: Text('Create Job'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 4),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
