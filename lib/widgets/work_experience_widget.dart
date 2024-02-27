import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkExperienceWidget extends StatefulWidget {
  @override
  _WorkExperienceWidgetState createState() => _WorkExperienceWidgetState();
}

class _WorkExperienceWidgetState extends State<WorkExperienceWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Work Experience'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Save work experience
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Job Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter job title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Company',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter company name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: _startDateController,
                      decoration: InputDecoration(
                        labelText: 'From',
                        border: OutlineInputBorder(),
                      ),
                      onTap: () => _selectDate(context, _startDateController),
                      readOnly: true,
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: TextFormField(
                      controller: _endDateController,
                      decoration: InputDecoration(
                        labelText: 'To',
                        border: OutlineInputBorder(),
                      ),
                      onTap: () => _selectDate(context, _endDateController),
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              // ... Add other fields in similar fashion
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      controller.text = DateFormat.yMMMM().format(picked);
    }
  }
}
