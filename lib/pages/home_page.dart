import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<int> myTiles = [
    1,
    2,
    3,
    4
  ];

  void updateMyTile(int oldIndex, int newIndex){
    setState(() {
      //an adjustment is needed when moving the tile down list
      if(oldIndex < newIndex){
        newIndex--;
      }

      //get the tile we are moving
      final tile = myTiles.removeAt(oldIndex);

      //place tile in new position
      myTiles.insert(newIndex, tile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drag and Drop'),
      ),
      body: ReorderableListView(
        children: [
          for(final tile in myTiles)
            ListTile(
              key: ValueKey(tile),
              title: Text('${tile}'),)
        ],
        onReorder: (oldIndex, newIdex)=> updateMyTile(oldIndex, newIdex),
      ),
    );
  }
}
