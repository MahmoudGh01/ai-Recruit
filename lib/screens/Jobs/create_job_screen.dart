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
  List<String> requirements = []; // Store job requirements as a list of strings
  late TextEditingController requirementController = TextEditingController();

  @override
  void initState() {
    super.initState();
    jobTitleController = TextEditingController();
    jobDescriptionController = TextEditingController();
    companyInformationController = TextEditingController();
    locationController = TextEditingController();
    employmentTypeController = TextEditingController();
    salaryCompensationController = TextEditingController();
    requirementController = TextEditingController();
  }

  void addRequirement() {
    if (requirementController.text.isNotEmpty) {
      setState(() {
        requirements.add(requirementController.text);
        requirementController.clear();
      });
    }
  }

  void removeRequirement(int index) {
    setState(() {
      requirements.removeAt(index);
    });
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
                  'Skills and Qualifications', requirementController),
              SizedBox(height: 16),
              Column(
                children: [
                  TextField(
                    controller: requirementController,
                    decoration: InputDecoration(
                      labelText: "Add Requirement",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: addRequirement,
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: requirements.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(requirements[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.remove_circle_outline),
                          onPressed: () => removeRequirement(index),
                        ),
                      );
                    },
                  ),
                ],
              )
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
