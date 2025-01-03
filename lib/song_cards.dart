import 'package:flutter/material.dart';

class SongCardList extends StatefulWidget {
  const SongCardList({
    super.key,
    required this.songCards,
    required this.onAdd,
  });

  final List<SongCardData> songCards;
  final VoidCallback onAdd;

  @override
  State<StatefulWidget> createState() => _SongCardListState();
}

class _SongCardListState extends State<SongCardList> {
  List<SongCardData> cards = [];
  final double maxElevation = 10.0; // The greatest elevation value

  final double boxWidth = 600;
  final double boxHeight = 700;
  final int displayListMax = 5;

  void addCard() {
    setState(() {
      cards.add(SongCardData(
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

    final double overlapOffset = containerHeight * 0.05;

    final displayCards = widget.songCards.take(displayListMax).toList();

    return SizedBox(
      width: containerWidth * 0.6,
      height: containerHeight * 0.6,
      child: Stack(
        children: [
          for (int i = displayCards.length - 1; i >= 0; i--)
            Positioned(
              bottom: i * overlapOffset - (i * i * containerHeight * 0.005),
              left: 0,
              right: 0,
              child: Card(
                margin: EdgeInsets.all(containerWidth * 0.01),
                elevation: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black
                        .withOpacity(0.15 * i), // Tint color with opacity
                    borderRadius: BorderRadius.circular(
                        11.0), // Match card's border radius
                  ),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.black
                          .withOpacity(0.15 * i), // Tint color for contents
                      BlendMode.srcATop, // Blend mode for tinting
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(containerWidth *
                              0.01), // Adjust the padding value as needed
                          child: displayCards[displayCards.length - 1 - i]
                              .trackArt,
                        ),
                        Padding(
                          padding: EdgeInsets.all(containerHeight * 0.01),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                displayCards[displayCards.length - 1 - i]
                                    .songName,
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
              ),
            ),
          Positioned(
            bottom: containerHeight * 0.01,
            right: containerWidth * 0.2,
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
  const SongCard({required this.cardData});
  final SongCardData cardData;

  @override
  State<StatefulWidget> createState() => _SongCardState();
}

class _SongCardState extends State<SongCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(containerWidth * 0.01),
      elevation: 0.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black
              .withOpacity(0.15 * i), // Tint color with opacity
          borderRadius: BorderRadius.circular(
              11.0), // Match card's border radius
        ),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.black
                .withOpacity(0.15 * i), // Tint color for contents
            BlendMode.srcATop, // Blend mode for tinting
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(containerWidth *
                    0.01), // Adjust the padding value as needed
                child: widget.cardData.trackArt,
              ),
              Padding(
                padding: EdgeInsets.all(containerHeight * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.cardData.songName,
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      widget.cardData.artistName,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class SongCardData {
  const SongCardData({
    required this.songName,
    required this.trackArt,
    required this.artistName,
  });

  final String songName;
  final String artistName;
  final Image trackArt;
}
