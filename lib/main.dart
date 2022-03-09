import 'package:flutter/material.dart';
import 'package:todo/pages/no_content.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "toDO", home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //set custom height for the appbar
      appBar: AppBar(
        shape: const Border(
          bottom: BorderSide(
            width: 2,
            color: Colors.black12,
          ),
        ),
        title: const Text(
          "toDO",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("My list",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Carbo',
                    )),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ),
      ),
      body: const NoContent(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  context: context,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(40),
                    child: Wrap(
                      children: const [
                        Text(
                          "My List",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.menu),
              color: Colors.black45,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  context: context,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(30),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Delete completed tasks",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const Divider(
                            height: 10,
                            thickness: 1,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Delete all tasks",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const Divider(
                            height: 10,
                            thickness: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.more_vert),
              color: Colors.black45,
            ),
            label: "",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              context: context,
              builder: (context) => const ActionButton());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

//add Task class
class ActionButton extends StatelessWidget {
  const ActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(hintText: "Add Task"),
                maxLines: 1,
              ),
            ),
            TextButton(
              onPressed: () {},
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
    );
  }
}
