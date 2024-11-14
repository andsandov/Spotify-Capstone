import 'package:flutter/material.dart';
import 'package:spotify_polls/voting_page.dart';

class VotelistsPage extends StatefulWidget {
  const VotelistsPage({super.key, this.title = "Votelists Page"});

  final String title;

  @override
  State<VotelistsPage> createState() => _VotelistsPageState();
}

class _VotelistsPageState extends State<VotelistsPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
    );
  }
}