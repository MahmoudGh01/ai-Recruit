import 'package:flutter/material.dart';
import 'package:fl_score_bar/fl_score_bar.dart';

class AddSkillPage extends StatefulWidget {
  final List<String> predefinedSkills;

  const AddSkillPage({
    Key? key,
    this.predefinedSkills = const ['Flutter', 'Dart', 'Firebase', 'REST API'],
  }) : super(key: key);

  @override
  State<AddSkillPage> createState() => _AddSkillPageState();
}

class _AddSkillPageState extends State<AddSkillPage> {
  final TextEditingController _skillController = TextEditingController();
  double _currentExpertise = 3.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Skill'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(

          child: Column(
            children: [
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<String>.empty();
                  } else {
                    return widget.predefinedSkills.where((String option) {
                      return option
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase());
                    });
                  }
                },
                onSelected: (String selection) {
                  _skillController.text = selection;
                },
                fieldViewBuilder: (BuildContext context,
                    TextEditingController fieldTextEditingController,
                    FocusNode fieldFocusNode,
                    VoidCallback onFieldSubmitted) {
                  return TextField(
                    controller: fieldTextEditingController,
                    focusNode: fieldFocusNode,
                    decoration: InputDecoration(
                      labelText: 'Skill Name',
                      border: OutlineInputBorder(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Text('Job Expertise Percentage:', style: TextStyle(fontSize: 18)),
              FlScoreBar.editable(
                maxScore: 7,
                score: _currentExpertise,
                onChanged: (value) {
                  setState(() {
                    _currentExpertise = value;
                  });
                },
                averageScoreColor: Colors.amber,
                highScoreColor: Colors.green,
                lowScoreColor: Colors.red,
                textStyle: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add logic to save the skill and its expertise level
                  print(
                      'Skill: ${_skillController.text}, Expertise: $_currentExpertise');
                },
                child: Text('Add Skill'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
