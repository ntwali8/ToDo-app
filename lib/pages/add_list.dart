import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/main.dart';

class AddList extends StatelessWidget {
  AddList({Key? key}) : super(key: key);

  var listname = '';

  @override
  Widget build(BuildContext context) {
    CollectionReference list =
        FirebaseFirestore.instance.collection('App-Data');
    return Center(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width - 50,
          color: const Color.fromRGBO(225, 225, 225, 0),
          child: Card(
            color: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Add List",
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                    ),
                    maxLines: 1,
                    onChanged: (value) {
                      listname = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty || value == Null) {
                        return "Please enter some text";
                      }
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    list
                        .add({'Task': listname})
                        .then((value) => print("User added"))
                        .catchError((error) => print('Failed to add: $error'));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
