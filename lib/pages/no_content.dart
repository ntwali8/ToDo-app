import 'package:flutter/material.dart';

class NoContent extends StatelessWidget {
  const NoContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(width: double.infinity),
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/book.jpg"),
          radius: 100,
        ),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 75,
          width: 250,
          child: Text(
            "Let's help you organise your life, just add tasks!!",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
