import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/widgets/tasks_tile.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;

  const TasksList({Key? key, required this.tasks}) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TasksTile(
          taskTitle: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          toggleCheckboxState: (bool isToggle) {
            setState(() {
              widget.tasks[index].isDone = isToggle;
            });
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}