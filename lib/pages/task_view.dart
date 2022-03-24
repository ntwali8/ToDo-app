import 'package:flutter/material.dart';
import 'package:todo/pages/edit_task.dart';

//View Task class
class TaskView extends StatefulWidget {
  const TaskView({Key? key}) : super(key: key);

  @override
  State<TaskView> createState() => _TaskViewState();
}

//State for viewing Task class
class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    List taskName = ["Go to the canteen", "Workout in gym", "Visit uncle"];
    bool isCompleted = false;
    return ListView.builder(
      itemCount: taskName.length,
      itemBuilder: (BuildContext context, index) {
        return ListTile(
          onLongPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EditTask(),
              ),
            );
          },
          leading: Checkbox(
            value: isCompleted,
            onChanged: (bool? value) {
              setState(() {
                isCompleted = value!;
              });
            },
          ),
          title: Text(taskName[index]),
        );
      },
    );
  }
}
