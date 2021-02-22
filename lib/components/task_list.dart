import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/task_tile.dart';
import 'package:todoey/models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) => TaskTile(
            task: taskData.tasks[index],
            callback: (value) {
              taskData.updateTask(taskData.tasks[index]);
            },
            longPressCallback: () {
              taskData.deleteTask(taskData.tasks[index]);
            },
          ),
          itemCount: taskData.taskCount,
        );
      }
    );
  }
}
