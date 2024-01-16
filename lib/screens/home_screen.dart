import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';
import '../widgets/task_title.dart';
import '../screens/edit_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context).tasks;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (ctx, index) {
          final task = tasks[index];
          return Dismissible(
            key: Key(task.id.toString()),
            onDismissed: (direction) {
              Provider.of<TaskProvider>(context, listen: false)
                  .deleteTask(task.id);
            },
            background: Container(color: Colors.red),
            child: GestureDetector(
              onTap: () {
                // 更新任務完成狀態
                Provider.of<TaskProvider>(context, listen: false).updateTask(
                  task.id,
                  Task(
                    id: task.id,
                    title: task.title,
                    description: task.description,
                    isDone: !task.isDone, // 反轉完成狀態
                  ),
                );
              },
              onLongPress: () {
                // 打開編輯任務的界面
                Navigator.of(context)
                    .push(
                  MaterialPageRoute(
                    builder: (context) => EditTaskScreen(task: task),
                  ),
                )
                    .then((updatedTask) {
                  if (updatedTask != null) {
                    Provider.of<TaskProvider>(context, listen: false)
                        .updateTask(task.id, updatedTask);
                  }
                });
              },
              child: TaskTile(
                title: task.title,
                description: task.description,
                isDone: task.isDone,
                onChanged: (value) {
                  // Implement task completion logic
                },
              ),
            ),
          );
        },
      ),
      // body: ListView.builder(
      //   itemCount: tasks.length,
      //   itemBuilder: (ctx, index) {
      //     final task = tasks[index];

      //     return TaskTile(
      //       title: task.title,
      //       isDone: task.isDone,
      //       onChanged: (value) {
      //         // Implement task completion logic
      //       },
      //     );
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add-task');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
