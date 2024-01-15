import 'package:flutter/material.dart';

class TaskDetailScreen extends StatelessWidget {
  final String taskId;

  const TaskDetailScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    // Fetch the task details based on taskId and display them
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
      ),
      body: Text('Task Details for $taskId'),
    );
  }
}
