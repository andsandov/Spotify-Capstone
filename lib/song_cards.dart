import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SongCards extends StatefulWidget {
  const SongCards({
    super.key,
    required this.songs,
  });

  final List<String> songs;

  @override
  State<StatefulWidget> createState() => _SongCardsState();
}

class _SongCardsState extends State<SongCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 550,
      height: 650,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue[300],
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Text(
        "box 1",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
