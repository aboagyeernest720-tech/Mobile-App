import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_provider.dart'; 

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TaskListScreen(),
      ),
    ),
  );
}

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // This print will help you verify the optimization in the Debug Console
    print("Entire Screen Building..."); 

    return Scaffold(
      appBar: AppBar(
        title: const Text("Optimistic Task List"),
        backgroundColor: const Color.fromARGB(255, 38, 216, 130),
      ),
      body: Column(
        children: [
          // Button to fetch mock API data
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: () => context.read<TaskProvider>().fetchTasksFromApi(),
              icon: const Icon(Icons.download),
              label: const Text("Fetch Data from API"),
            ),
          ),

          Expanded(
            // Selector: Only rebuilds when 'isLoading' changes
            child: Selector<TaskProvider, bool>(
              selector: (_, provider) => provider.isLoading,
              builder: (context, isLoading, child) {
                if (isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                // Consumer: Rebuilds the list when the task list changes
                return Consumer<TaskProvider>(
                  builder: (context, provider, _) {
                    return ListView.builder(
                      itemCount: provider.tasks.length,
                      itemBuilder: (context, index) {
                        final task = provider.tasks[index];

                        return ListTile(
                          // VALUEKEY: Essential for Part 6 (Optimistic Updates)
                          key: ValueKey(task), 
                          leading: const CircleAvatar(
                            child: Icon(Icons.assignment),
                          ),
                          title: Text(task),
                          subtitle: const Text("Tap the trash to delete"),
                          // THE DELETE BUTTON
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline, color: Colors.red),
                            onPressed: () {
                              // Calls the new Part 6 function in task_provider.dart
                              context.read<TaskProvider>().deleteOptimistically(index);
                            },
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<TaskProvider>().addTask("Manual Task ${DateTime.now().second}"),
        child: const Icon(Icons.add),
      ),
    );
  }
}