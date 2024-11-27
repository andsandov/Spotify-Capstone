import 'package:flutter/material.dart';

class Songque extends StatefulWidget {
  const Songque({super.key, this.title = "Song Que"});
  final String title;

  @override
  State<Songque> createState() => _SongqueState();
}

class _SongqueState extends State<Songque> {
  var allItems = List.generate(50, (index) => 'item $index');
  var items = [];
  var searchHistory = [];
  final TextEditingController searchController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    searchController.addListener(queryListener);
  }

  @override
  void dispose() {
    searchController.removeListener(queryListener);
    searchController.dispose();
    super.dispose();
  }

  void queryListener() {
    search(searchController.text);
  }

  void search(String songName){
    if(songName.isEmpty){
      setState(() {
        items = allItems;
      });
    } else {
      setState(() {
        items = allItems.where((e) => e.toLowerCase().contains(songName.toLowerCase())).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              const SizedBox(height: 16,),
              SearchBar(
                controller: searchController,
                leading: IconButton(
                    onPressed: () {

                    },
                    icon: const Icon(Icons.search)),
                hintText: "Search Song...",
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: items.isEmpty ? allItems.length : items.length,
                    itemBuilder: (context, index) {
                      final item = items.isEmpty ? allItems[index] : items[index];
                      return Card(
                        child: Column(
                          children: [
                            Text('Song: $item'),
                            const SizedBox(height: 8.0,),
                            Text(item)
                          ],
                        ),
                      );
                    }
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                        context
                    );
                  },
                  child: const Text("Return")
              ),
            ]
          )
        )
      );
    }
}
//
// class SongOptions{
//   String songName;
//   String artist;
//   SongOptions({this.songName, this.artist})
// }
