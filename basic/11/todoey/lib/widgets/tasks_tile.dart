import 'package:flutter/material.dart';

class TasksTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final Function toggleCheckboxState;

  const TasksTile({
    super.key, required this.taskTitle,
    required this.isChecked,
    required this.toggleCheckboxState,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
      activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (bool? isToggle) {
          toggleCheckboxState(isToggle ?? false);
        },
      ),
    );
  }
}