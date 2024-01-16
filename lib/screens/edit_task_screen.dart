import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

class EditTaskScreen extends StatelessWidget {
  final Task task;
  final TextEditingController _taskController;

  EditTaskScreen({super.key, required this.task})
      : _taskController = TextEditingController(text: task.title);

  void _editTask(BuildContext context) {
    final taskText = _taskController.text;
    if (taskText.isNotEmpty) {
      Provider.of<TaskProvider>(context, listen: false).updateTask(
        task.id,
        Task(
            id: task.id,
            title: taskText,
            description: task.description,
            isDone: task.isDone),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _taskController,
              decoration: const InputDecoration(labelText: 'Task'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _editTask(context),
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
