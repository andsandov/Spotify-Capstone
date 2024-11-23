import 'package:flutter/material.dart';
import 'package:spotify_polls/votelists_page.dart';

class LiveRoomPage extends StatefulWidget {
  const LiveRoomPage({super.key, this.title = "Live Room Page"});

  final String title;

  @override
  State<LiveRoomPage> createState() => _LiveRoomPageState();
}

class _LiveRoomPageState extends State<LiveRoomPage> {
  final List<String> strings = [
    'Box 1',
    'Box 2',
    'Box 3',
    'Box 4',
    'Box 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            for (int i = 0; i < strings.length; i++)
              Positioned(
                top: i * 20.0, // Adjust the offset for layering
                child: Container(
                  width: 200,
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.lerp(Colors.blue[900], Colors.blue[300], i / (strings.length - 1))!,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    strings[i],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
