import 'package:flutter/material.dart';
import 'package:todo/main.dart';

//Edit task class
class EditTask extends StatefulWidget {
  const EditTask({Key? key}) : super(key: key);

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        ),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.delete, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(hintText: "Edit Task"),
              maxLines: 1,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    selectDate(context);
                  },
                  icon: const Icon(
                    Icons.date_range,
                    color: Colors.blue,
                  ),
                ),
                const Text(
                  "Edit Date",
                  // "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //function for setting date and time.
  selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2023),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
  }
}
