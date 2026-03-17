import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart'; // Required for Firebase init
import 'providers/task_provider.dart';
import 'screens/login_screen.dart'; // App starts at Login per Part D

void main() async {
  // 1. Ensure Flutter framework is fully loaded before calling Firebase
  WidgetsFlutterBinding.ensureInitialized();
  
  // 2. Initialize Firebase (Requirement Part D-a)
  // Note: This requires firebase_core package in pubspec.yaml
  await Firebase.initializeApp(); 

  runApp(
    // 3. MultiProvider or Single Provider setup for State Management
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Task Manager',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      // 4. Set the LoginScreen as the starting page (Requirement Part D-b/c)
      home: const LoginScreen(), 
    );
  }
}