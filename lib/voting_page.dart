import 'package:flutter/material.dart';
import 'package:spotify_polls/songQue.dart';

class VotingPage extends StatefulWidget {
  const VotingPage({super.key, this.title = "Voting Page"});
  final String title;

  @override
  State<VotingPage> createState() => _VotingPageState();
}

class _VotingPageState extends State<VotingPage> {

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
              Container(
                padding: const EdgeInsets.all(200),
                color : Colors.blue,
                child : const Text(
                  "Song",
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text("X")
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text("Y")
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: const BackButton(),
              ),
            ],
          )
      ),
      floatingActionButton : FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Songque())
        );},
        child : const Text("+"),
      ),
    );
  }
}
