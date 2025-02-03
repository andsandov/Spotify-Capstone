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
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    
    return Container(
      margin: EdgeInsets.all(screenHeight * 0.01),
      padding: EdgeInsets.all(screenHeight * 0.02),
      constraints: BoxConstraints(
        maxHeight: screenHeight * 0.16
      ),
      decoration: const BoxDecoration(
        color: Colors.blue
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxHeight: screenHeight * 0.15,
                  maxWidth: screenHeight * 0.15
                ),
                margin: EdgeInsets.fromLTRB(0, 0, screenHeight * 0.05, 0),
                child: data.image
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.title),
                  Text(data.details),
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
    required this.image,
  });

  final String title;
  final String details;
  final Image image;
}