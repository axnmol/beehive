import 'package:beehive/screens/puzzle_screen.dart'; // For Navigation
import 'package:flutter/material.dart'; // Main Flutter
import 'package:flutter/widgets.dart'; // Main widgets
import 'package:beehive/components/my_flutter_app_icons.dart'; // Icons
import 'package:beehive/components/difficulty.dart'; // For Difficulty
import 'package:provider/provider.dart';

// On pressed actions to be added

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(height: 30),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Icon(MyFlutterApp.music),
                        iconSize: 30.0,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(MyFlutterApp.speaker),
                        iconSize: 30.0,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(MyFlutterApp.remove_ads),
                    iconSize: 30.0,
                  ),
                ],
              ),*/
              IconButton(
                onPressed: () {},
                icon: Icon(MyFlutterApp.Hidato),
                iconSize: 300.0,
              ),
              Text('BEEHIVE',
                style: Theme.of(context).textTheme.headline5,),
              SizedBox(
                height: 10.0,
                width: 150.0,
                child: Divider(
                  thickness: 2.0,
                  color: Colors.black54,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 80.0),
                    child: Consumer<DifficultyManage>(
                      builder: (BuildContext context, difficultyManage, child) {
                        return IconButton(
                          onPressed: () {
                            difficultyManage.prevDiff();
                          },
                          icon: Icon(Icons.arrow_left),
                          iconSize: 50.0,
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        Provider.of<DifficultyManage>(context).getDiffName(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 80.0),
                    child: Consumer<DifficultyManage>(
                      builder: (context, difficultyManage, child) {
                        return IconButton(
                          onPressed: () {
                            difficultyManage.nextDiff();
                          },
                          icon: Icon(Icons.arrow_right),
                          iconSize: 50.0,
                        );
                      },
                    ),
                  ),
                ],
              ),
              OutlineButton(
                onPressed: () {
                  Provider.of<DifficultyManage>(context,listen: false).update();
                  Navigator.pushNamed(
                    context,
                    PuzzleScreen.id,
                  );
                },
                child: Text('New Game'),
                shape: StadiumBorder(),
                borderSide: BorderSide(color: Colors.black54,width: 3),
              ),
              Consumer<DifficultyManage>(
                builder: (context, difficultyManage, child) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Colors.black54,
                           style: BorderStyle.solid, width: 3),
                    ),
                    child: DropdownButton<int>(
                      value: difficultyManage.getCurrentLevel(),
                      onChanged: (int newValue) {
                        difficultyManage.setCurrentLevel(newValue);
                      },
                      items: <int>[1, 2, 3, 4]
                          .map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
              /*OutlineButton(
                onPressed: () {},
                child: Text('Resume'),
                shape: StadiumBorder(),
                borderSide: BorderSide(width: 3),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(MyFlutterApp.paint),
                  iconSize: 40.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <IconButton>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(MyFlutterApp.gear),
                    iconSize: 30.0,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(MyFlutterApp.information),
                    iconSize: 30.0,
                  ),
                ],
              ),*/
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
