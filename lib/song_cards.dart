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
  List<SongCard> cards = [];
  final double maxElevation = 10.0; // The greatest elevation value

  final double boxWidth = 600;
  final double boxHeight = 700;
  final double overlapOffset = 20; // Vertical spacing for the stack
  final int displayListMax = 5;

  void addCard() {
    setState(() {
      cards.add(SongCard(
          songName: "Song ${cards.length + 1}",
          artistName: "Artist ${cards.length + 1}",
          trackArt: Image.network('assets/trackArtPlaceholder.png'),
      ));
    });
  }

  void removeCard(int index) {
    setState(() {
      cards.removeAt(index);
    });
  }

  double computeElevation(int index) {
    return maxElevation - index.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;

    const double aspectRatio = 2 / 3;

    final maxHeight = screenHeight;
    final maxWidth = maxHeight * aspectRatio;

    final containerWidth = maxWidth > screenWidth ? screenWidth : maxWidth;
    final containerHeight = containerWidth / aspectRatio;

    final displayCards = widget.songCards.take(displayListMax).toList();

    return SizedBox(
      width: containerWidth * 0.5,
      height: containerHeight * 0.4,
      child: Stack(
        children: [
          for (int i = displayCards.length - 1; i >= 0; i--)
            Positioned(
              bottom: i * overlapOffset,
              left: 0,
              right: 0,
              child: Card(
                margin: const EdgeInsets.all(8),
                elevation: computeElevation(i),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    displayCards[displayCards.length - 1 - i].trackArt,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            displayCards[displayCards.length - 1 - i].songName,
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            displayCards[displayCards.length - 1 - i]
                                .artistName,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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

class SongCard {
  const SongCard({
    required this.songName,
    required this.trackArt,
    required this.artistName,
  });

  final String songName;
  final String artistName;
  final Image trackArt;
}
