import 'package:flutter/material.dart';

class SongCardList extends StatefulWidget {
  const SongCardList({
    super.key,
    required this.songCards,
    required this.onAdd,
  });

  final List<SongCard> songCards;
  final VoidCallback onAdd;

  @override
  State<StatefulWidget> createState() => _SongCardListState();
}

class _SongCardListState extends State<SongCardList> {
  @override
  Widget build(BuildContext context) {
    const double boxWidth = 600;
    const double boxHeight = 700;
    const double overlapOffset = 20; // Vertical spacing for the stack
    const int displayListMax = 5;

    final displayCards = widget.songCards.take(displayListMax).toList();

    return SizedBox(
      width: boxWidth,
      height: boxHeight,
      child: Stack(
        children: [
          for (int i = displayCards.length - 1; i >= 0; i--)
            Positioned(
              bottom: i * overlapOffset,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color:
                      Colors.black.withOpacity(i * 0.2), // Darken progressively
                  // borderRadius: BorderRadius.circular(8),
                ),
                child: displayCards[displayCards.length - 1 - i],
              ),
            ),
          Positioned(
            bottom: 10,
            right: 10,
            child: ElevatedButton(
              onPressed: widget.onAdd,
              child: const Text("Add Song"),
            ),
          ),
        ],
      ),
    );
  }
}

class SongCard extends StatefulWidget {
  const SongCard({
    super.key,
    required this.songName,
    required this.trackArt,
    required this.artistName,
  });

  final String songName;
  final String artistName;
  final Image trackArt;

  @override
  State<StatefulWidget> createState() => _SongCardState();
}

class _SongCardState extends State<SongCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.trackArt,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.songName, style: const TextStyle(fontSize: 16)),
                Text(widget.artistName, style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
