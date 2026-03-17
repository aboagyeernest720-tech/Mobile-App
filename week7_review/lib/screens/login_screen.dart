import 'package:flutter/material.dart';
import 'profile_screen.dart'; // Import to allow navigation

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers to grab the text from the fields
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Requirement D(b): Email field
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 16),
            
            // Requirement D(b): Password field
            TextField(
              controller: passwordController,
              obscureText: true, // Hides the password characters
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 24),

            // Requirement D(b): Sign In button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Requirement: Print credentials to the console
                  print("Login Attempt:");
                  print("Email: ${emailController.text}");
                  print("Password: ${passwordController.text}");
                },
                child: const Text("Sign In"),
              ),
            ),
            const SizedBox(height: 12),

            // Requirement D(c): Navigate to ProfileScreen button
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
              child: const Text("Go to Profile"),
            ),
          ],
        ),
      ),
    );
  }
}