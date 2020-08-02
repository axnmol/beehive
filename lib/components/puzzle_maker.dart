import 'package:beehive/components/difficulty.dart';
import 'package:beehive/components/puzzles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Entries {
  int occupied;
  int x;
  int y;
  Entries(this.occupied, this.x, this.y);

  int retOccupied(){
    return occupied;
  }

  List<int> retCoordinates(){
    return [x,y];
  }
}

class EntryList extends ChangeNotifier{
  Puzzle _puzzle;
  int pointer = 0;
  List<List<int>> _grid;
  List<Entries> _entryList;
  List diff = [19, 37, 61];

  EntryList(this._puzzle){
    _entryList = List<Entries>(diff[_puzzle.retDifficulty()]);
    makeEntryList(_puzzle.retList());
  }

  void makeEntryList(List<List<int>> x) {
    _grid =
        List.generate(x.length, (i) => List.generate(x.length, (i) => null));
    for (int i = 0; i < x.length; ++i)
      for (int j = 0; j < x.length; ++j) {
        if (x[i][j] != null) {
          if (x[i][j] > 0)
            _entryList[x[i][j] - 1] = Entries(-1, i, j);
          else {
            _entryList[(-1 * x[i][j]) - 1] = Entries(1, i, j);
            _grid[i][j] = x[i][j] * -1;
          }
        }
      }
  }

  int retNum(int x, int y) {
    if (_grid[x][y] != null)
      return _grid[x][y];
    else
      return -1;
  }

  void update(int x, int y) {
    if (_grid[x][y] != null) _grid[x][y] = pointer+1;
  }

  void incrementPointer(){
    pointer++;
    notifyListeners();
  }

  void decrementPointer(){
    pointer--;
    notifyListeners();
  }

  int retVal(){
    return pointer+1;
  }

}

class Puzzle extends ChangeNotifier{
  DifficultyManage _difficultyManage;
  int difficulty = 0;
  List _input;
  List<List<int>> _output;

  Puzzle(this._difficultyManage){
    difficulty = _difficultyManage.getCurrentDiff()-1;
    _input = Collection().retPuzzle(_difficultyManage.getCurrentDiff()-1,_difficultyManage.getCurrentLevel()-1);
    _output = makeList();
  }

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
    for (int i = 0, ctr = 0; i < a; ++i)
      for (int j = 0; j < a; ++j) {
        if (i + j > m && i + j < (4 + (3 * m))) {
          x[i][j] = _input[ctr];
          ctr++;
        }
      }
    return x;
  }

  List<List<int>> retList() {
    return _output;
  }

  int retDifficulty(){
    return difficulty;
  }
}

class HexPuzzle extends StatefulWidget {
  final int i;
  final int j;
  HexPuzzle(this.i, this.j);

  @override
  _HexPuzzleState createState() => _HexPuzzleState();
}

class _HexPuzzleState extends State<HexPuzzle> {
  int value=0;

  void setValue(int x){
    value= x;
  }
  void updated(EntryList e) {
    setState(() {
      e.update(widget.i, widget.j);
    });
  }

  @override
  Widget build(BuildContext context) {
    setValue(Provider.of<EntryList>(context).retNum(widget.i, widget.j));
    return Consumer<EntryList>(
      builder: (context,entryList,child){
        return MaterialButton(
          onPressed: () {
            updated(entryList);
          },
          color: Colors.black12,
          minWidth: 0,
          height: 0,
          padding: EdgeInsets.zero,
          child: Text(
            value.toString(),
            style: TextStyle(fontSize: 25),
          ),
        );
      },
    );
  }
}