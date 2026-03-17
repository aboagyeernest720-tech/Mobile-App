import 'package:flutter/material.dart';
import 'task_list_screen.dart'; // Import to allow navigation
import 'task_list_screen.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Profile")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Requirement: CircleAvatar with student's initial
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Text("K", style: TextStyle(fontSize: 40, color: Colors.white)),
            ),
            const SizedBox(height: 20),

            // Requirement: Card widget with student details
            const Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Kwaku Frimpong"),
                      subtitle: Text("ID: 10928374"),
                    ),
                    ListTile(
                      leading: Icon(Icons.book),
                      title: Text("Computer Science"),
                      subtitle: Text("Level: 300"),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Requirement: Edit Profile button (No logic needed)
            ElevatedButton(
              onPressed: () {}, 
              child: const Text("Edit Profile"),
            ),

            const Spacer(),

            // Requirement: Navigation to TaskListScreen
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => const TaskListScreen())
                  );
                },
                child: const Text("View Tasks"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}