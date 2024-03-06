import 'package:airecruit/utils/globalColors.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

import '../add_skill_screen.dart';


class SkillsSectionWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<String> skills; // Updated to accept a list of Maps

  const SkillsSectionWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.skills, // Expecting a list of skills with percentage and name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionTileCard(
        baseColor: Colors.white,
        expandedColor: Colors.white,
        elevation: 2,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        title: Row(
          children: [
            Icon(icon, color: GlobalColors.secondaryColor),
            SizedBox(width: 10),
            Text(title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: GlobalColors.secondaryColor)),
          ],
        ),
        children: <Widget>[
          Divider(thickness: 1),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: skills.map((skill) => SkillCard(skill: skill)).toList(),
            ),
          ),
        ],
        trailing: IconButton(
          icon: Icon(Icons.add),
          onPressed: () => showAddSkillModal(context, ['Flutter', 'Dart', 'Firebase', 'REST API']),
        ),
      ),
    );
  }

  void showAddSkillModal(BuildContext context, List<String> predefinedSkills) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          padding: EdgeInsets.all(16),
          child: Wrap(
            children: <Widget>[
              AddSkillPage(predefinedSkills: predefinedSkills),
            ],
          ),
        );
      },
    );
  }

}

class SkillCard extends StatelessWidget {
  final String skill;

  const SkillCard({Key? key, required this.skill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: EdgeInsets.all(
          4), // Adjust the margin to ensure there's space around the card
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize
            .min, // Makes the column height just enough for its children
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            skill,
            textAlign: TextAlign
                .center, // Ensure text is centered if it wraps to a new line
            style: TextStyle(fontSize: 16 ,color: Colors.black),
          ),
        ],
      ),
    );
  }

  Color _getProgressColor(double percentage) {
    if (percentage >= 75) {
      return Colors.green;
    } else if (percentage >= 50) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}
