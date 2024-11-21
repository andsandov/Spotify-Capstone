import 'package:flutter/material.dart';

class LiveLoginPage extends StatefulWidget {
  const LiveLoginPage({super.key, this.title = "Live Page"});

  final String title;

  @override
  State<LiveLoginPage> createState() => _LiveLoginPageState();
}

class _LiveLoginPageState extends State<LiveLoginPage> {
  String password = "password";

  final myController = TextEditingController();

  inputField() {
    return TextField(
      controller: myController,
      decoration: const InputDecoration(
        hintText: "Room Code",
      ),
    );
  }

  displayInputFieldValueSubmit() {
    return FloatingActionButton(
      heroTag: null,
      onPressed: () {
        if (myController.text == password) {
          myController.dispose();

          // TODO change this to go the liveRoom page
          Navigator.pop(context);
        }

      },
      child: const Text("Submit"),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.title,
              style: const TextStyle(fontSize: 30),
            ),
            inputField(),
            displayInputFieldValueSubmit(),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('back button'))
          ],
        ),
      ),
    );
  }
}
