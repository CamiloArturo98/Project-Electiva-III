import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_model.dart';
import '../providers/task_provider.dart';

class EditTaskScreen extends StatelessWidget {
  final int taskIndex;
  final Task task;

  const EditTaskScreen({Key? key, required this.taskIndex, required this.task})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController =
        TextEditingController(text: task.title);
    final TextEditingController descriptionController =
        TextEditingController(text: task.description);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task'),
        backgroundColor: const Color(0xFFC6E2E9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedTask = Task(
                  title: titleController.text,
                  description: descriptionController.text,
                );
                Provider.of<TaskProvider>(context, listen: false)
                    .updateTask(taskIndex, updatedTask);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA7C4BC),
              ),
              child: const Text('Update Task'),
            ),
          ],
        ),
      ),
    );
  }
}
