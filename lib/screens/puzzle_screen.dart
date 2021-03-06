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
                  Consumer<DifficultyManage>(
                    builder: (context,difficultyManage,child) {
                      return IconButton(
                        icon: Icon(Icons.refresh),
                        onPressed: () {
                          difficultyManage.update();
                        },
                        iconSize: 30,
                      );
                    }
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Text(
                  Provider.of<DifficultyManage>(context).getCurrentLevel().toString(),
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Text(
                  Provider.of<DifficultyManage>(context).getDiffName(),
                  style: Theme.of(context).textTheme.headline4,
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
                      Provider.of<EntryList>(context).retVal(),
                      style: Theme.of(context).textTheme.headline4,
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
                    child: Text(" Solution ",
              style: Theme.of(context).textTheme.headline4,),
                    onPressed: () {
                      Provider.of<EntryList>(context,listen: false).setShow();
                    },
                  ),
                  MaterialButton(
                    child: Text("Next Level",
                      style: Theme.of(context).textTheme.headline4,),
                    onPressed: () {
                      Provider.of<DifficultyManage>(context,listen: false).incrementLevel();
                    },
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
