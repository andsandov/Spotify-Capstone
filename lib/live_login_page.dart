import 'package:flutter/material.dart';
import 'package:spotify_polls/votelists_page.dart';

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
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VotelistsPage()));
                },
                child: const Text('go to votelists page'))
          ],
        ),
      ),
    );
  }
}
