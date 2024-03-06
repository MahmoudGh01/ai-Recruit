import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fl_score_bar/fl_score_bar.dart';
import 'package:provider/provider.dart';

import '../../../providers/userprovider.dart';
import '../../../utils/constants.dart';

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
  List<String> skills = [];
  void addRequirement(user) {
    if (_skillController.text.isNotEmpty) {
      setState(() {
        skills.add(_skillController.text);
        _skillController.clear();
      });
    }
  }



  void addSkillToBackend(userId) async {

    var url = Uri.parse('${Constants.uri}/edit-user/$userId');
    var response = await http.put(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"skills": skills}));

    if (response.statusCode == 200) {
      print('Skill added successfully');
      // Update your UI or notify the user
    } else {
      print('Failed to add skill');
      // Handle error
    }
  }

  void removeRequirement(int index) {
    setState(() {
      skills.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    skills = user.skills;
    return Padding(
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
                  controller: _skillController,
                  decoration: InputDecoration(
                    labelText: "Add Requirement",
                    suffixIcon: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        user.skills = skills;
                        addRequirement(user);
                      },
                    ),
                  ),
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: skills.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(skills[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () => removeRequirement(index),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic to save the skill to backend
                addSkillToBackend(user.id);
                print('Skill: ${_skillController.text}');
              },
              child: Text('Add Skill'),
            ),
          ],
        ),
      ),
    );
  }
}
