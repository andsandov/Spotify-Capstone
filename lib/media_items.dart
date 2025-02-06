import 'package:flutter/material.dart';

class MediaItemList extends StatefulWidget {
  const MediaItemList({
    super.key,
    required this.initDataList
  });

  final List<MediaItemData> initDataList;

  @override
  State<StatefulWidget> createState() => _MediaItemListState();
}

class _MediaItemListState extends State<MediaItemList> {
  late List<MediaItemData> _dataList;

  @override
  void initState() {
    super.initState();
    _dataList = List.from(widget.initDataList);
  }

  addMediaItem() {
    setState(() {
      _dataList.add(
          const MediaItemData(
              title: "bruh",
              details: "bruh2",
              imageUrl: 'https://th.bing.com/th/id/R.e78f8e7c326d3e7cdcf053d58f494542?rik=bXopo7rm0XIdFQ&riu=http%3a%2f%2fupload.wikimedia.org%2fwikipedia%2fcommons%2fc%2fc7%2fDomestic_shorthaired_cat_face.jpg&ehk=NByReFekRNa%2fCe0v9gNPEb0tpYmVhy4kI5uaC1l1AUI%3d&risl=1&pid=ImgRaw&r=0'
          )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < _dataList.length; i++)
          MediaItem(data: _dataList[i]),
        ElevatedButton(onPressed: addMediaItem, child: const Text('add media item'))
      ],
    );
  }
}

class MediaItem extends StatelessWidget {
  const MediaItem({super.key,
  required this.data});
  
  final MediaItemData data;
  
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
                child: Image.network(data.imageUrl)
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
    required this.imageUrl,
  });

  final String title;
  final String details;
  final String imageUrl;
}