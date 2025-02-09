import 'package:flutter/material.dart';

class MediaItemList<Widget> extends StatefulWidget {
  const MediaItemList({
    super.key,
    required this.mediaItems,
    this.controller
  });

  final List<Widget> mediaItems;

  final MediaItemListController? controller;

  @override
  State<StatefulWidget> createState() => _MediaItemListState();
}

class MediaItemListController {
  _MediaItemListState? _state;

  void _attach(_MediaItemListState state) {
    _state = state;
  }

  void addItem(Widget item) {
    _state?.addMediaItem(item);
  }

  void removeItem(int index) {
    _state?.removeMediaItem(index);
  }
}

class _MediaItemListState extends State<MediaItemList> {
  late List<Widget> _mediaItems;

  @override
  void initState() {
    super.initState();
    _mediaItems = List.from(widget.mediaItems);
    widget.controller?._attach(this);
  }

  void addMediaItem(Widget item) {
    setState(() {
      _mediaItems.add(item);
    });
  }

  void removeMediaItem(int index) {
    setState(() {
      _mediaItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < _mediaItems.length; i++)
          _mediaItems[i],
      ],
    );
  }
}

class MediaItem extends StatelessWidget {
  const MediaItem({super.key,
  required this.itemData});
  
  final MediaItemData itemData;
  
  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.sizeOf(context).height;

    double itemMargin = containerHeight * 0.01;
    double itemPadding = containerHeight * 0.01;
    double imageSizeConstraint = containerHeight * 0.09;
    return Container(
      margin: EdgeInsets.fromLTRB(itemMargin, 0, itemMargin, itemMargin),
      padding: EdgeInsets.all(itemPadding),
      constraints: BoxConstraints(
        maxHeight: containerHeight * 0.12
      ),
      decoration: const BoxDecoration(
        color: Colors.blue
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                constraints: BoxConstraints(
                  maxHeight: imageSizeConstraint,
                  maxWidth: imageSizeConstraint
                ),
                margin: EdgeInsets.fromLTRB(0, 0, containerHeight * 0.05, 0),
                child: Image.network(itemData.imageUrl)
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(itemData.title),
                  Text(itemData.details),
                ],
              )
            ],
          ),
          IconButton(onPressed: () => {}, icon: const Icon(Icons.more_vert))
        ]
      ),
    );
  }
}

class MediaItemData {
  const MediaItemData ({
    required this.title,
    required this.details,
    required this.imageUrl,
  });

  final String title;
  final String details;
  final String imageUrl;
}