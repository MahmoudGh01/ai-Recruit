import 'package:flutter/material.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Profile", style: TextStyle(color: theme.primaryColorLight)),
        backgroundColor: theme.primaryColorDark,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // Implement avatar viewing or changing logic here
                },
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('Assets/profile_image.jpg'),
                  backgroundColor: Colors.white,
                  // Adding a border around the CircleAvatar
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: theme.primaryColorLight,
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "John Doe",
                style: theme.textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Software Developer",
                style: theme.textTheme.subtitle1?.copyWith(color: Colors.grey),
              ),
              SizedBox(height: 16),
              Divider(color: Colors.grey),
              SizedBox(height: 16),
              _buildProfileItem(context, Icons.email, "john.doe@example.com"),
              _buildProfileItem(context, Icons.phone, "+123 456 789"),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: theme.primaryColor,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: Text("Edit Profile"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem(BuildContext context, IconData icon, String text) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(text),
      onTap: () {
        // Implement onTap action, e.g., open email app
      },
    );
  }
}
