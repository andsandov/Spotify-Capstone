import 'package:flutter/cupertino.dart';

class SongCards extends StatefulWidget {
  const SongCards({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _SongCardsState();
}

class _SongCardsState extends State<SongCards> {

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text("Box"),
      );
}
