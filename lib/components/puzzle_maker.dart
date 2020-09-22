// Main Puzzle Handling File
import 'package:beehive/components/difficulty.dart'; // For Difficulty
import 'package:beehive/components/puzzles.dart'; // For Puzzle DB
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//todo each way

class EntryList extends ChangeNotifier {
  Puzzle _puzzle; // From Provider
  int pointer = -1; // Pointer of EntryList
  List<List<int>> _grid; // Instantaneous Grid
  //List<List<int>> _gridTemp;
  int length; // Length of array
  List<int> diff = [19, 37, 61]; // No. of Elements in a certain difficulty
  List<List<int>> entryList;
  List<int> blocks;

  EntryList.x();

  EntryList(this._puzzle) {
    length = diff[_puzzle.retDifficulty()];
    _grid = _puzzle.retList();
    makeList(_grid, diff[_puzzle.retDifficulty()]);
    incrementPointer();
  } // Setting list of entries

  void makeList(List<List<int>> x, int y) {
    entryList = List.generate(y, (i) => List(3));
    for (int i = 0; i < x.length; ++i) {
      for (int j = 0; j < x.length; ++j) {
        if (x[i][j] != null) {
          if (x[i][j] != 0) {
            if (x[i][j] > 0) {
              entryList[x[i][j] - 1] = [1, i, j];
            } else
              entryList[-1 * x[i][j] - 1] = [-1, i, j];
          } else {
            blocks.add(i);
            blocks.add(j);
          }
        }
      }
    }
  }

//1 in the list
  String retNum(int x, int y) {
    //return _grid[x][y].toString();
    if(_grid[x][y]<0)
    return (_grid[x][y]*-1).toString();
    else return " ";
  }

  bool isValue(int x, int y, int ptr){
    bool res = true;
    if(entryList[ptr][0]<1){
      if(entryList[ptr][1]==x){
        if((entryList[ptr][2]-y).abs()!=1)res=false;
      }
      else if(entryList[ptr][1]==x-1){
        if(!(entryList[ptr][2]==y||entryList[ptr][2]==y+1))res=false;
      }
      else if(entryList[ptr][1]==x+1){
        if(!(entryList[ptr][2]==y||entryList[ptr][2]==y-1))res=false;
      }
      else res =false;
    }
    return res;
  }

  bool isValid(int x, int y, int ptr){
    bool res=true;
    if(!(isValue(x, y, ptr+1)))res=false;
    if(!(isValue(x, y, ptr-1)))res=false;
    return res;
  }

  void update(int x, int y) {
    if (entryList[_grid[x][y].abs() - 1][0] >= 0) {
      if (pointer != -1) {
        if (_grid[x][y] > 0 && isValid(x,y,pointer)) {
          _grid[x][y] = (pointer + 1) * -1;
          entryList[_grid[x][y].abs() - 1] = [0, x, y];
          incrementPointer();
        } else if (_grid[x][y] < 0) {
          if (entryList[_grid[x][y].abs() - 1][0] == 0) {
            _grid[x][y] = _grid[x][y].abs();
            entryList[_grid[x][y].abs() - 1] = [1, x, y];
          }
        }
      }
      else {
        if (entryList[_grid[x][y].abs() - 1][0] == 0) {
          _grid[x][y] = _grid[x][y].abs();
          entryList[_grid[x][y].abs() - 1] = [1, x, y];
          incrementPointer();
        }
      }
    }
    notifyListeners();
  }

  void incrementPointer() {
    if (pointer < entryList.length - 1) {
      int temp = pointer;
      int ctr = 1;
      while (entryList[pointer + ctr][0] <= 0) {
        if(pointer==-1 && ctr ==entryList.length)return;
        if (pointer + ctr == temp) {
          pointer = -1;
          return;
        }
        ctr++;
        if (pointer + ctr > entryList.length - 1) {
          pointer = 0;
          ctr = 1;
        }
      }
      pointer = pointer + ctr;
    }
    notifyListeners();
  }

  void decrementPointer() {
    if (pointer > 0) {
      int temp = pointer;
      int ctr = 1;
      while (entryList[pointer - ctr][0] <= 0) {
        if (pointer - ctr == temp) {
          pointer = -1;
          return;
        }
        ctr++;
        if (pointer - ctr < 0) {
          pointer = entryList.length - 1;
          ctr = 1;
        }
      }
      pointer = pointer - ctr;
    }
    notifyListeners();
  }

  String retVal() {
    if(pointer!=-1)
    return (pointer + 1).toString();
    else
      return " ";
  }
}

// Main Puzzle from DB into Matrix
class Puzzle extends ChangeNotifier {
  DifficultyManage _difficultyManage; // Will be inherited from provider
  int difficulty = 0;
  List _input; // Array from DB
  List<List<int>> _output; // Puzzle Matrix

  Puzzle.x(); // Bogus constructor

  Puzzle(this._difficultyManage) {
    difficulty = _difficultyManage.getCurrentDiff() - 1;
    _input = Collection().retPuzzle(_difficultyManage.getCurrentDiff() - 1,
        _difficultyManage.getCurrentLevel() - 1);
    _output = makeList();
  } // Getting input array by values from provider and setting output

  List<List<int>> makeList() {
    int a = 0;
    switch (_input.length) {
      case 19:
        a = 5;
        break;
      case 37:
        a = 7;
        break;
      case 61:
        a = 9;
        break;
      default:
        break;
    }
    double m = (a - 3) / 2;
    List<List<int>> x = List.generate(a, (i) => List(a));
    // Creates a x a matrix
    for (int i = 0, ctr = 0; i < a; ++i)
      for (int j = 0; j < a; ++j) {
        // check if its in allowed area
        if (i + j > m && i + j < (4 + (3 * m))) {
          x[i][j] = _input[ctr];
          ctr++; // Counter of array
        }
      }
    return x;
  } // Function for making matrix

  List<List<int>> retList() {
    return _output;
  }

  int retDifficulty() {
    return difficulty;
  }
}

class HexPuzzle extends StatelessWidget {
  final int i;
  final int j;
  HexPuzzle(this.i, this.j);

  @override
  Widget build(BuildContext context) {
    return Consumer<EntryList>(
      builder: (BuildContext context, entryList, child) {
        return MaterialButton(
          onPressed: () {
            entryList.update(i, j);
          },
          color: Colors.black12,
          minWidth: 0,
          height: 0,
          padding: EdgeInsets.zero,
          child: Text(
            Provider.of<EntryList>(context).retNum(i, j),
            style: TextStyle(fontSize: 25),
          ),
        );
      },
    );
  }
}
