import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MediaItemList extends StatefulWidget {
  const MediaItemList({super.key});
  
  @override
  State<StatefulWidget> createState() => _MediaItemListState();
}

class _MediaItemListState extends State<MediaItemList> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class MediaItem extends StatelessWidget {
  const MediaItem({super.key,
  required this.data});
  
  final MediaItemData data;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class MediaItemData {
  const MediaItemData ({
    required this.title,
    required this.details,
    required this.image,
  });

  final String title;
  final String details;
  final Image image;
}