import 'dart:developer';

import 'package:flutter/material.dart';

class VotelistsPage extends StatefulWidget {
  const VotelistsPage({super.key, this.title = "Votelists Page"});

  final String title;

  @override
  State<VotelistsPage> createState() => _VotelistsPageState();
}

class _VotelistsPageState extends State<VotelistsPage> {
  bool showCreationButtons = false;

  void toggleShowButtons() {
    setState(() {
      showCreationButtons = !showCreationButtons;
    });
  }

  void _showCreatePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Create Popup", style: TextStyle(fontSize: 18)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    log("Create popup button pressed!");
                  },
                  child: Text("Do something"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Close"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showRegisterPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Register popup", style: TextStyle(fontSize: 18)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    log("Register popup button pressed!");
                  },
                  child: Text("Do another thing"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Close"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              if (showCreationButtons) {
                log("state set to false");
                setState(() {
                  showCreationButtons = false;
                });
              }
            },
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 30),
                ),
                ElevatedButton(
                    onPressed: () { Navigator.pop(context); },
                    child: const Text("go back")
                ),
                ElevatedButton(
                    onPressed: toggleShowButtons,
                    child: Text(showCreationButtons ? "hide buttons" : "show buttons")
                ),
                if (showCreationButtons) ...[
                  GestureDetector(
                    onTap: (){},
                    child: Column(
                      children: [
                        const SizedBox(height: 10),  // Adds some space between buttons
                        ElevatedButton(
                          onPressed: () => _showRegisterPopup(context),
                          child: const Text('Register Button'),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () => _showCreatePopup(context),
                          child: const Text('Create Button'),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}