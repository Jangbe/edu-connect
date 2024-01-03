// ignore_for_file: must_be_immutable

import 'package:basreng/database.dart';
import 'package:basreng/ui/dashboard.dart';
import 'package:basreng/ui/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Database.initialize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Login();
          }

          return Dashboard();
        },
      ),
    );
  }
}
