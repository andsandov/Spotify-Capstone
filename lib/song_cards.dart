import 'package:flutter/cupertino.dart';

class CardItem extends StatefulWidget {
  final String playlistName;

  const CardItem({
    super.key,
    required this.playlistName,
  });

  @override
  State<StatefulWidget> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  String name = "";

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text("Box"),
      );
}
