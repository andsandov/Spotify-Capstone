import 'package:flutter/material.dart';
import 'package:spotify_polls/song_cards.dart';

class LiveRoomPage extends StatefulWidget {
  const LiveRoomPage({super.key, this.title = "Live Room Page"});

  final String title;

  @override
  State<LiveRoomPage> createState() => _LiveRoomPageState();
}

class _LiveRoomPageState extends State<LiveRoomPage> {
  bool playState = false;

  final List<SongCardData> _songCards = [];

  void _addSong() {
    setState(() {
      _songCards.insert(
          0,
          SongCardData(
            songName: "Song ${_songCards.length + 1}",
            artistName: "Artist ${_songCards.length + 1}",
            trackArt: Image.network(
                'assets/trackArtPlaceholder.png'), // Placeholder art
          ));
    });
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

    void togglePlayState() {
      setState(() {
        playState = !playState;
      });
    }

    ButtonStyle playerButtonStyle = ElevatedButton.styleFrom(
        padding: EdgeInsets.all(containerHeight * 0.01),
        minimumSize: const Size.square(1));

    ButtonStyle queueButtonStyle = ElevatedButton.styleFrom(
        padding: EdgeInsets.all(containerHeight * 0.01),
        minimumSize: const Size.square(1),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DragTarget<int>(
                builder: (context, candidateData, rejectedData) {
                  return Container(
                    width: 200,
                    height: 200,
                    color: candidateData.isNotEmpty ? Colors.green : Colors.red,
                    child: Center(
                      child: Text(
                        candidateData.isNotEmpty
                            ? 'Hovering: ${candidateData.first}' // Access the first item in the list
                            : 'Drag an item here!',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
                onWillAcceptWithDetails: (data) {
                  print('Will accept: $data');
                  return true; // Indicate whether to accept the draggable item
                },
                onAcceptWithDetails: (data) {
                  print('Accepted: $data');
                },
              ),
              SongCardList(songCards: _songCards, onAdd: _addSong),
              DragTarget<int>(
                builder: (context, candidateData, rejectedData) {
                  return Container(
                    width: 200,
                    height: 200,
                    color: candidateData.isNotEmpty ? Colors.green : Colors.red,
                    child: Center(
                      child: Text(
                        candidateData.isNotEmpty
                            ? 'Hovering: ${candidateData.first}' // Access the first item in the list
                            : 'Drag an item here!',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
                onWillAcceptWithDetails: (data) {
                  print('Will accept: $data');
                  return true; // Indicate whether to accept the draggable item
                },
                onAcceptWithDetails: (data) {
                  print('Accepted: $data');
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // Temporary Card container
                padding: EdgeInsets.symmetric(vertical: containerHeight * 0.01),
                margin: EdgeInsets.fromLTRB(
                    (screenWidth * 0.5) - ((containerWidth * 0.7) / 2),
                    containerHeight * 0.01,
                    0,
                    containerHeight * 0.01),
                width: containerWidth * 0.7,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  // Control bar
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: playerButtonStyle,
                        onPressed: () {},
                        child: Icon(Icons.skip_previous,
                            size: containerHeight * 0.06)),
                    ElevatedButton(
                      style: playerButtonStyle,
                      onPressed: togglePlayState,
                      child: Icon(playState ? Icons.pause : Icons.play_arrow,
                          size: containerHeight * 0.06),
                    ),
                    ElevatedButton(
                        style: playerButtonStyle,
                        onPressed: () {},
                        child: Icon(Icons.skip_next,
                            size: containerHeight * 0.06)),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                    style: queueButtonStyle,
                    onPressed: () {},
                    child:
                        Icon(Icons.queue_music, size: containerHeight * 0.06)),
              )
            ],
          )
        ],
      ),
    );
  }
}
