import 'package:flutter/cupertino.dart';

class SongCards extends StatefulWidget {
  final String playlistName;

  const SongCards({
    super.key,
    required this.playlistName,
  });

  @override
  State<StatefulWidget> createState() => _SongCardsState();
}

class _SongCardsState extends State<SongCards> {
  String name = "";

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text("Box"),
      );
}
