import 'package:airecruit/utils/globalColors.dart';
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';

import '../../models/job_model.dart';
import '../../services/job_service.dart';
import 'create_job_screen.dart';
import 'job_details_screen.dart';

class JobListScreen extends StatefulWidget {
  @override
  _JobListScreenState createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
  final JobService _jobService = JobService();
  List<JobModel> _allJobs = [];
  List<JobModel> _filteredJobs = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  _onSearchChanged() {
    _filterJobs(_searchController.text);
  }

  _filterJobs(String query) {
    List<JobModel> _jobs = _allJobs.where((job) {
      return job.jobTitle.toLowerCase().contains(query.toLowerCase()) ||
          job.companyInformation.toLowerCase().contains(query.toLowerCase());
    }).toList();
    setState(() {
      _filteredJobs = _jobs;
    });
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
              'My Profile',
              style: TextStyle(
                  fontSize: 20, fontFamily: AutofillHints.creditCardNumber),
            ),

          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Jobs',
                hintText: 'Enter job title or company',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),

                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<JobModel>>(
              future: _jobService.getAllJobs(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  _allJobs = snapshot.data ?? [];
                  _filteredJobs = _filteredJobs.isEmpty && _searchController.text.isEmpty ? _allJobs : _filteredJobs;
                  return ListView.separated(
                    itemCount: _filteredJobs.length,
                    separatorBuilder: (context, index) => SizedBox(height: 20),
                    itemBuilder: (context, index) {
                      JobModel job = _filteredJobs[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => JobDetailsScreen(job: job),
                            ),
                          );
                        },
                        child: Center(
                          child: TransparentImageCard(
                            endColor: Colors.black54,
                            width: 320,
                            borderRadius: 20,
                            imageProvider: AssetImage('Assets/logo-google.jpeg'),
                            tags: [_tag(job.skillsQualifications)],
                            title: _title(job.jobTitle, color: GlobalColors.secondaryColor),
                            description: _content(job.companyInformation, color: Colors.black54),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
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

  Widget _tag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.transparent, // Adjust the opacity as needed
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,

          //fontWeight: FontWeight.w900, // Slightly less bold than FontWeight.bold for a more refined look
          fontSize: 20, // Slightly larger for emphasis
          letterSpacing: 0.5, // Add some spacing between letters for better readability
          fontFamily: 'Roboto', // Example: Use a specific font family (ensure it's included in your pubspec.yaml)
        ),
      ),
    );
  }



  Widget _title(String text, {Color color = Colors.white}) {
    return Text(
      text,
      style: TextStyle(
        color: color,

        fontWeight: FontWeight.bold, // Slightly less bold than FontWeight.bold for a more refined look
        fontSize: 22, // Slightly larger for emphasis
        letterSpacing: 0.5, // Add some spacing between letters for better readability
        fontFamily: 'Roboto', // Example: Use a specific font family (ensure it's included in your pubspec.yaml)
      ),
    );
  }

  Widget _content(String text, {Color color = Colors.white}) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 18, // Increased for better readability
        fontWeight: FontWeight.w400, // Regular weight, but you can adjust as needed
        letterSpacing: 0.25, // Slightly tighter letter spacing than title for dense text
        fontFamily: 'Roboto', // Keep consistent with the title for a cohesive look
      ),
    );
  }

}
