import 'dart:developer';
import 'dart:ui';

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

  void addNewButton() {
    setState(() {
      buttons.add(
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const VotingPage()));
            },
            child: const Text("New Playlist"),
          ),
        ),
      );
    });
  }

  // eric-votelist-dialog
  bool _isBlurred = false;

  void _toggleBlur() {
    setState(() {
      _isBlurred = !_isBlurred;
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

    showDialog(context: context, builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Create Popup", style: TextStyle(fontSize: 18)),
                inputField(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    displayInputFieldValueButton(),
                    ElevatedButton(
                      onPressed: () {
                        myController.dispose();
                        Navigator.of(context).pop();
                      },
                      child: const Text("Close"),
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
                const Text("Register popup", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    log("Register popup button pressed!");
                  },
                  child: const Text("Do another thing"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Close"),
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
    // Get screen size and FAB dimensions
    const double fabHeight = 56.0; // Default FAB height
    final double bottomPadding = MediaQuery.of(context).viewPadding.bottom;
    final double rightPadding = MediaQuery.of(context).viewPadding.right;

    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
              onTap: () {
                log("cancel new votelist");
                _toggleBlur();
              },
              child: Stack(
                children: [
                  Container(padding: const EdgeInsets.all(10), child: const BackButton()),
                  const Center(
                    child: Text(
                      "Main Page Content",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  if (_isBlurred)
                    BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          color: Colors.transparent,
                        )),
                  if (_isBlurred) ...[
                    Positioned(
                        bottom: fabHeight + bottomPadding + 32.0,
                        right: rightPadding + 16.0,
                        child: GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    _showCreatePopup(context);
                                    log("Create Votelist pressed");
                                  },
                                  child: const Text("Create Votelist")),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                  onPressed: () {
                                    _showRegisterPopup(context);
                                    log("Register Votelist pressed");
                                  },
                                  child: const Text("Register Votelist")),
                            ],
                          ),
                        )),
                  ],
                ],
              )),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _toggleBlur,
        child: Text(
          _isBlurred ? "Close" : "Open Menu",
          textAlign: TextAlign.center,
        ),
      ),

      // // Vincent-voteList-updated
      // body : Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         Text(
      //           widget.title,
      //           style: const TextStyle(fontSize: 30),
      //         ),
      //         const SizedBox(height: 20, width: 50,),
      //         Column(
      //           children: buttons,
      //         ),
      //         ElevatedButton(
      //             onPressed: () {
      //               Navigator.pop(
      //                   context
      //               );
      //             },
      //             child: const Text("go back")
      //         ),
      //       ],
      //     )
      //   ),
      // floatingActionButton : FloatingActionButton(
      //   onPressed: addNewButton,
      //   child : const Text("+"),
      //
      //   // eric-votelist-dialog
      // body: Stack(
      //   children: [
      //     GestureDetector(
      //       onTap: () {
      //         if (showCreationButtons) {
      //           setState(() {
      //             showCreationButtons = false;
      //           });
      //         }
      //       },
      //       child: Container(
      //         color: Colors.transparent,
      //       ),
      //     ),
      //     Center(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: <Widget>[
      //           Text(
      //             widget.title,
      //             style: const TextStyle(fontSize: 30),
      //           ),
      //           ElevatedButton(
      //               onPressed: () { Navigator.pop(context); },
      //               child: const Text("go back")
      //           ),
      //           ElevatedButton(
      //               onPressed: toggleShowButtons,
      //               child: Text(showCreationButtons ? "hide buttons" : "show buttons")
      //           ),
      //           if (showCreationButtons) ...[
      //             GestureDetector(
      //               onTap: (){},
      //               child: Column(
      //                 children: [
      //                   const SizedBox(height: 10),  // Adds some space between buttons
      //                   ElevatedButton(
      //                     onPressed: () => _showRegisterPopup(context),
      //                     child: const Text('Register Button'),
      //                   ),
      //                   const SizedBox(height: 10),
      //                   ElevatedButton(
      //                     onPressed: () => _showCreatePopup(context),
      //                     child: const Text('Create Button'),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ],
      //       ),
      //     ),
      //   ],
    );
  }
}
