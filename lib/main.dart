import 'package:airecruit/providers/userprovider.dart';
import 'package:airecruit/screens/main_screen.dart';
import 'package:airecruit/screens/Auth/signup_screen.dart';
import 'package:airecruit/services/Auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// Future to hold the initial route
Future<String?> getTokenfromPrefs() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // Check if token exists and is not empty
  final String? token = prefs.getString('token');
  //print(token);
  return token; // Route to SignupScreen
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.getUserData(context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(
            Theme.of(context).textTheme,
          ),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
          ),
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FutureBuilder<String?>(
          future: getTokenfromPrefs(),
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            // Check if the future is complete and has data
            if (snapshot.connectionState == ConnectionState.done) {
              // If we have a token, go to MainScreen, else go to SignupScreen
              if (snapshot.data != '') {
                authService.getUserData(context);
                return const MainScreen(); // Assuming user is logged in
              } else {
                return const SignupScreen(); // No token found, user is not logged in
              }
            } else {
              // While waiting for the future to complete, show a loading indicator
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
