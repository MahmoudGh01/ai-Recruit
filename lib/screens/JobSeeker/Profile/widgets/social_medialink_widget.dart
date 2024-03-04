import 'package:airecruit/utils/globalColors.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class SocialMediaLinksWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Map<String, dynamic>> socialLinks;
  final Color? textColor;

  const SocialMediaLinksWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.socialLinks,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = GlobalColors.secondaryColor; // Replace with your GlobalColors if needed
    var backgroundColor = isDark ? Colors.black : Colors.white;
    var itemTextColor = GlobalColors.secondaryColor; // Replace with your GlobalColors if needed

    return ExpansionTileCard(
      baseColor: backgroundColor,
      expandedColor: backgroundColor,
      elevation: 2,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      trailing: IconButton(
        icon: Icon(Icons.add_link),
        onPressed: _addSocialMediaLink,
      ),
      title: Row(
        children: [
          Icon(icon, color: iconColor),
          SizedBox(width: 10),
          Text(title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor ?? itemTextColor)),
        ],
      ),
      children: <Widget>[
        Divider(color: iconColor.withOpacity(0.4)),
        ...socialLinks.map((link) => ListTile(
          leading: Icon(link['icon'], color: iconColor),
          title: Text(link['name']),
          subtitle: Text(link['url']),
          trailing: IconButton(
            icon: Icon(Icons.copy, color: iconColor),
            onPressed: () {
              // Implement copy to clipboard functionality
            },
          ),
          onTap: () {
            // Implement opening the link functionality
          },
        )).toList(),
      ],
    );
  }

  Future<void> _addSocialMediaLink() async {
    // Show a dialog or perform other UI updates before adding a social media link
    // showDialog or other UI code...
  }
}
