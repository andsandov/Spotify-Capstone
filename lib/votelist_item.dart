import 'package:flutter/material.dart';
import 'package:spotify_polls/media_items.dart';
import 'package:spotify_polls/voting_page.dart';

class VotelistItem extends StatefulWidget {
  const VotelistItem ({super.key,
  required this.itemData});

  final MediaItemData itemData;

  @override
  State<StatefulWidget> createState() => _VotelistItemState();
}

class _VotelistItemState extends State<VotelistItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const VotingPage()));
      },
      child: MediaItem(itemData: widget.itemData),
    );
  }
}