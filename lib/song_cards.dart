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
    const double boxWidth = 600;
    const double boxHeight = 700;
    const double overlapOffset = 20; // Vertical spacing for the stack
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: boxWidth,
            height: (5 * overlapOffset) + boxHeight,
            child: Stack(
              children: [
                for (int i = 0; i < widget.songs.length; i++)
                  Positioned(
                    bottom: (i * 20), // Controls vertical offset
                    child: Container(
                      width: boxWidth,
                      height: boxHeight,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.lerp(
                            Colors.blue[300],
                            Colors.blue[900],
                            i / widget.songs.length),
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
                    ),
                  )
              ],
            )),
      ],
    );
  }
}
