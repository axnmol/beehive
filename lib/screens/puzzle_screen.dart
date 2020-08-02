import 'package:beehive/components/difficulty.dart';
import 'package:beehive/components/puzzle_maker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:beehive/components/sizes.dart';
import 'package:beehive/components/hex_grid.dart';
import 'package:provider/provider.dart';

class PuzzleScreen extends StatelessWidget {
  static const String id = 'puzzle_screen';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context, PuzzleScreen.id);
                    },
                    iconSize: 30,
                  ),
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {},
                    iconSize: 30,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Text(
                  Provider.of<DifficultyManage>(context).getCurrentLevel().toString(),
                      textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Text(
                  Provider.of<DifficultyManage>(context).getQuestionText(),
                      textAlign: TextAlign.center,
                ),
              ),
            ),
             HexGrid(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Consumer<EntryList>(
                    builder: (context,entryList,child){
                      return IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {entryList.decrementPointer();},
                      );
                    },
                  ),
                  Container(
                    child: Text(
                      Provider.of<EntryList>(context).retVal().toString(),
                    ),
                  ),
                  Consumer<EntryList>(
                    builder: (context,entryList,child){
                      return IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {entryList.incrementPointer();},
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                    child: Text("Solution"),
                    onPressed: () {},
                  ),
                  MaterialButton(
                    child: Text("Next Level"),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
