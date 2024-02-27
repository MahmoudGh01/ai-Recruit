import 'package:airecruit/providers/userprovider.dart';
import 'package:airecruit/screens/main_screen.dart';
import 'package:airecruit/screens/Auth/signup_screen.dart';
import 'package:airecruit/services/Auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_)=>UserProvider())
      ],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
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
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Provider.of<UserProvider>(context).user.token.isEmpty ?   SignupScreen()
            : MainScreen()

    );
  }
}

