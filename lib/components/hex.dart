import 'package:flutter/material.dart';
import 'package:beehive/components/difficulty.dart'; // For Difficulty
import 'package:beehive/components/sizes.dart'; // For Size Management
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:beehive/components/puzzle_maker.dart'; // Main Grid Filler

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 4);
    path.lineTo(0, 3 * size.height / 4);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 3 * size.height / 4);
    path.lineTo(size.width, size.height / 4);
    path.lineTo(size.width / 2, 0);
    path.lineTo(0, size.height / 4);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
} //Clipping Container into Hexagon.

// One Hexagonal Button
class HexButton extends StatelessWidget {
  final int i;
  final int j;
  HexButton(this.i, this.j);

  @override
  Widget build(BuildContext context) {
    int difficulty =
        (Provider.of<DifficultyManage>(context).getCurrentDiff() - 1);
    return ClipPath(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.5),
        height: (((2 * SizeConfig.screenWidth) - 90) -
                ((10 * sqrt(3)) * (difficulty + 2))) /
            ((3 * difficulty) + 8),
        width: (SizeConfig.screenWidth - ((10 * difficulty) + 65)) /
            ((2 * difficulty) + 5),
        child: HexPuzzle(i, j),
      ),
      clipper: CustomClipPath(),
    );
  } // Individual Hex from Puzzle after making hexagonal clips
} // With Positional factors passed through constructors
