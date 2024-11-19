import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:spotify_polls/voting_page.dart';

class VotelistsPage extends StatefulWidget {
  const VotelistsPage({super.key, this.title = "Votelists Page"});

  final String title;

  @override
  State<VotelistsPage> createState() => _VotelistsPageState();
}

class _VotelistsPageState extends State<VotelistsPage> {
  // Vincent-voteList-updated
  List<Widget> buttons = [];

  void addNewButton(){
    setState(() {
      buttons.add(
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VotingPage())
              );
            },
            child: const Text("New Playlist"),
          ),),
      );
    });
  }
  
  // eric-votelist-dialog
  bool showCreationButtons = false;

  void toggleShowButtons() {
    setState(() {
      showCreationButtons = !showCreationButtons;
    });
  }

  // TODO give this popup an text input and submit button and have a form that
  //  retrieves the value in the text input.





  void _showCreatePopup(BuildContext context) {
    final myController = TextEditingController();

    inputField() {
      return TextField(
        controller: myController,
      );
    }

    displayInputFieldValueButton() {
      return FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text that the user has entered by using the
                // TextEditingController.
                content: Text(myController.text),
              );
            },
          );
        },
        child: const Text("Submit"),
      );
    }

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
                inputField(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    displayInputFieldValueButton(),
                    ElevatedButton(
                      onPressed: () {
                        myController.dispose();
                        Navigator.of(context).pop();
                      },
                      child: Text("Close"),
                    ),
                  ],
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
      // Vincent-voteList-updated
      body : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 20, width: 50,),
              Column(
                children: buttons,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                        context
                    );
                  },
                  child: const Text("go back")
              ),
            ],
          )
        ),
      floatingActionButton : FloatingActionButton(
        onPressed: addNewButton,
        child : const Text("+"),
        
        // eric-votelist-dialog
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              if (showCreationButtons) {
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