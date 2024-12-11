import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mob3_login_107_halil/firebase_options.dart';
import 'package:mob3_login_107_halil/ui/login.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
runApp( MyApp());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
    );
  }
}