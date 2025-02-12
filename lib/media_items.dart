import 'package:flutter/material.dart';

class MediaItemList<Widget> extends StatefulWidget {
  const MediaItemList({
    super.key,
    required this.mediaItems,
  });

  final List<Widget> mediaItems;

  @override
  State<StatefulWidget> createState() => _MediaItemListState();
}

class _MediaItemListState extends State<MediaItemList> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < widget.mediaItems.length; i++)
          widget.mediaItems[i],
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