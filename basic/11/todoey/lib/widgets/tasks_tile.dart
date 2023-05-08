import 'package:flutter/material.dart';

class TasksTile extends StatelessWidget {
  const TasksTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('This is a task.'),
      trailing: Checkbox(
        value: false,
        onChanged: (bool? value) {  },
      ),
    );
  }
}