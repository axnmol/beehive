import 'package:flutter/material.dart';

class Difficulty {
  String name;
  int level;
  Difficulty(this.name, this.level);
}

class DifficultyManage extends ChangeNotifier{
  int _currentDiff = 0;
  int _currentLevel = 1;

  List<Difficulty> _difficulty = [
    Difficulty('Easy', 1),
    Difficulty('Medium', 2),
    Difficulty('Hard', 3),
  ];

  void nextDiff() {
    if (_currentDiff < _difficulty.length - 1) {
      _currentDiff++;
    }
    notifyListeners();
  }

  void prevDiff() {
    if (_currentDiff > 0) {
      _currentDiff--;
    }
    notifyListeners();
  }

  String getQuestionText() {
    return _difficulty[_currentDiff].name;
  }

  int getCurrentDiff() {
    return _difficulty[_currentDiff].level;
  }

  int getCurrentLevel() {
    return _currentLevel;
  }

  void setCurrentLevel(int x){
    _currentLevel = x;
    notifyListeners();
  }

}

