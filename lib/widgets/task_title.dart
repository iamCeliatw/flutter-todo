import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final String description;
  final bool isDone;
  final void Function(bool?)? onChanged;

  const TaskTile({
    Key? key,
    required this.title,
    required this.description,
    required this.isDone,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description),
      leading: Checkbox(
        value: isDone,
        onChanged: onChanged,
      ),
    );
  }
}
//create a function when you click the checkbox, it will change the value of isDone to true or false
