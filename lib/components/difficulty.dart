import 'package:flutter/material.dart';

// Manage the three Difficulties
class Difficulty {
  String name; // Easy, Medium, Hard
  int level; // Level can be 1/2/3
  Difficulty(this.name, this.level); // Copy Constructor
}

//Provider Class For Difficulty Management
class DifficultyManage extends ChangeNotifier {
  int _currentDiff = 0; // List Iterator
  int _currentLevel = 1; // Level of a certain Difficulty

  List<Difficulty> _difficulty = [
    Difficulty('Easy', 1),
    Difficulty('Medium', 2),
    Difficulty('Hard', 3),
  ]; // Array of Difficulty

  void nextDiff() {
    if (_currentDiff < _difficulty.length - 1) {
      _currentDiff++;
    }
    notifyListeners();
  } // Difficulty Increment

  void prevDiff() {
    if (_currentDiff > 0) {
      _currentDiff--;
    }
    notifyListeners();
  } // Difficulty

  void update() {
    notifyListeners();
  }

  String getDiffName() {
    return _difficulty[_currentDiff].name;
  }

  int getCurrentDiff() {
    return _difficulty[_currentDiff].level;
  }

  int getCurrentLevel() {
    return _currentLevel;
  }

  void setCurrentLevel(int x) {
    _currentLevel = x;
    notifyListeners();
  }

  void incrementLevel() {
    if (_currentLevel == 4)
      _currentLevel = 1;
    else
      _currentLevel += 1;
    notifyListeners();
  }

  void gameDialog(BuildContext context) {
    showDialog<AlertDialog>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
          title: Text('Completed Successfully', textAlign: TextAlign.center),
          content: Container(
            height: 150,
            child: Center(
              child: Icon(
                Icons.library_add_check_sharp,
                size: 200,
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'OK',
                style: TextStyle(color: Colors.black54),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
