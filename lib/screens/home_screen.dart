
import 'package:airecruit/utils/globalColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/userprovider.dart';
import '../services/Auth.dart';
import 'JobSeeker/Profile/filelist_screen.dart';
import 'JobSeeker/Profile/profile_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void signOutUser(BuildContext context) async {
    final bool shouldSignOut = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Sign Out'),
            content: Text('Do you want to sign out?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;

    if (shouldSignOut) {
      AuthService().signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    // Customize these colors as needed
    Color primaryColor = GlobalColors.buttonColor; // Example primary color
    Color accentColor = GlobalColors.primaryColor; // Example accent color
    Color buttonColor = GlobalColors.buttonColor; // Example button color

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
              'Ai Recruit',
              style: TextStyle(
                  fontSize: 20, fontFamily: AutofillHints.creditCardNumber),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(user.name),
              accountEmail: Text(user.email),
              currentAccountPicture: CircleAvatar(
                backgroundColor: accentColor,
                backgroundImage: user.profilePicturePath.isNotEmpty
                    ? NetworkImage(user.profilePicturePath)
                    : AssetImage('assets/default_profile.png') as ImageProvider,
              ),
              decoration: BoxDecoration(
                color: primaryColor,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen1()));
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('My resumes'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FilesListScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sign Out'),
              onTap: () => signOutUser(context),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Username: ${user.name}",
                  style: Theme.of(context).textTheme.headline6),
              SizedBox(height: 20),
              Text("Email: ${user.email}",
                  style: Theme.of(context).textTheme.bodyText1),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () => signOutUser(context),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(buttonColor),
                  minimumSize:
                      MaterialStateProperty.all(Size(double.infinity, 50)),
                ),
                child: Text("Sign Out"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
