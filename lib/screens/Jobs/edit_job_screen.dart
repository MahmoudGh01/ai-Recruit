import 'package:flutter/material.dart';
import 'package:airecruit/models/job_model.dart';
import 'package:airecruit/services/job_service.dart';

import 'job_list_screen.dart';


class EditJobScreen extends StatefulWidget {
  final JobModel job;
  final JobService jobService = JobService();

  EditJobScreen({required this.job});

  @override
  _EditJobScreenState createState() => _EditJobScreenState();
}

class _EditJobScreenState extends State<EditJobScreen> {
  late TextEditingController jobTitleController;
  late TextEditingController jobDescriptionController;
  late TextEditingController companyInformationController;
  late TextEditingController locationController;
  late TextEditingController employmentTypeController;
  late TextEditingController salaryCompensationController;
  List<String> requirements = []; // Initialized with existing job requirements
  final TextEditingController requirementController = TextEditingController();

  @override
  void initState() {
    super.initState();
    jobTitleController = TextEditingController(text: widget.job.jobTitle);
    jobDescriptionController =
        TextEditingController(text: widget.job.jobDescription);
    companyInformationController =
        TextEditingController(text: widget.job.companyInformation);
    locationController = TextEditingController(text: widget.job.location);
    employmentTypeController =
        TextEditingController(text: widget.job.employmentType);
    salaryCompensationController =
        TextEditingController(text: widget.job.salaryCompensation);
    requirements = List.from(widget.job.requirements);
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
        title: Text('Edit Job'),
        backgroundColor: Color(0xFFed6843),
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
                  'Salary Compensation', salaryCompensationController),
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
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  JobModel updatedJob = JobModel(
                    id: widget.job.id,
                    jobTitle: jobTitleController.text,
                    jobDescription: jobDescriptionController.text,
                    companyInformation: companyInformationController.text,
                    location: locationController.text,
                    employmentType: employmentTypeController.text,
                    salaryCompensation: salaryCompensationController.text,
                    requirements: requirements,
                  );

                  await widget.jobService.editJob(updatedJob);

                  Navigator.pop(context); // Close the EditJobScreen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => JobListScreen()),
                  );
                },
                child: Text('Save Changes'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFed6843),
                  onPrimary: Colors.white,
                ),
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
            color: Color(0xFFed6843),
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