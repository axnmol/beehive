import 'package:flutter/material.dart';
import 'package:beehive/components/hex.dart'; // For one Hex
import 'package:beehive/components/sizes.dart'; // For Size Management
import 'package:beehive/components/difficulty.dart'; // For Difficulty
import 'package:provider/provider.dart'; //
import 'dart:math';

// Main Grid Blueprint
class HexGrid extends StatelessWidget {
  Widget build(BuildContext context) {
    double rowDistance = (3 *
                (((2 * SizeConfig.screenWidth) - 90) -
                    ((10 * sqrt(3)) *
                        ((Provider.of<DifficultyManage>(context)
                                    .getCurrentDiff() -
                                1) +
                            2))) /
                ((3 *
                        (Provider.of<DifficultyManage>(context)
                                .getCurrentDiff() -
                            1)) +
                    8) +
            (10 * sqrt(3))) /
        4;
    int difficulty =
        (Provider.of<DifficultyManage>(context).getCurrentDiff() - 1);
    switch (difficulty) {
      // Setting Grid for each Difficulty
      case 0:
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 22.5),
          height: SizeConfig.screenWidth,
          child: Stack(
            overflow: Overflow.clip,
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                bottom: 0,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      HexButton(0, 2),
                      HexButton(0, 3),
                      HexButton(0, 4),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: rowDistance,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    HexButton(1, 1),
                    HexButton(1, 2),
                    HexButton(1, 3),
                    HexButton(1, 4),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HexButton(2, 0),
                  HexButton(2, 1),
                  HexButton(2, 2),
                  HexButton(2, 3),
                  HexButton(2, 4),
                ],
              ),
              Positioned(
                top: rowDistance,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    HexButton(3, 0),
                    HexButton(3, 1),
                    HexButton(3, 2),
                    HexButton(3, 3),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    HexButton(4, 0),
                    HexButton(4, 1),
                    HexButton(4, 2),
                  ],
                ),
              ),
            ],
          ),
        );
        break;
      case 1:
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 22.5),
          height: SizeConfig.screenWidth,
          child: Stack(
            overflow: Overflow.clip,
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                bottom: 0,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      HexButton(0, 3),
                      HexButton(0, 4),
                      HexButton(0, 5),
                      HexButton(0, 6),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: rowDistance,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    HexButton(1, 2),
                    HexButton(1, 3),
                    HexButton(1, 4),
                    HexButton(1, 5),
                    HexButton(1, 6),
                  ],
                ),
              ),
              Positioned(
                bottom: rowDistance * 2,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    HexButton(2, 1),
                    HexButton(2, 2),
                    HexButton(2, 3),
                    HexButton(2, 4),
                    HexButton(2, 5),
                    HexButton(2, 6),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HexButton(3, 0),
                  HexButton(3, 1),
                  HexButton(3, 2),
                  HexButton(3, 3),
                  HexButton(3, 4),
                  HexButton(3, 5),
                  HexButton(3, 6),
                ],
              ),
              Positioned(
                top: rowDistance * 2,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    HexButton(4, 0),
                    HexButton(4, 1),
                    HexButton(4, 2),
                    HexButton(4, 3),
                    HexButton(4, 4),
                    HexButton(4, 5),
                  ],
                ),
              ),
              Positioned(
                top: rowDistance,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    HexButton(5, 0),
                    HexButton(5, 1),
                    HexButton(5, 2),
                    HexButton(5, 3),
                    HexButton(5, 4),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    HexButton(6, 0),
                    HexButton(6, 1),
                    HexButton(6, 2),
                    HexButton(6, 3),
                  ],
                ),
              ),
            ],
          ),
        );
        break;
      case 2:
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 22.5),
          height: SizeConfig.screenWidth,
          child: Stack(
            overflow: Overflow.clip,
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                bottom: 0,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      HexButton(0, 4),
                      HexButton(0, 5),
                      HexButton(0, 6),
                      HexButton(0, 7),
                      HexButton(0, 8),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: rowDistance,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    HexButton(1, 3),
                    HexButton(1, 4),
                    HexButton(1, 5),
                    HexButton(1, 6),
                    HexButton(1, 7),
                    HexButton(1, 8),
                  ],
                ),
              ),
              Positioned(
                bottom: rowDistance * 2,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    HexButton(2, 2),
                    HexButton(2, 3),
                    HexButton(2, 4),
                    HexButton(2, 5),
                    HexButton(2, 6),
                    HexButton(2, 7),
                    HexButton(2, 8),
                  ],
                ),
              ),
              Positioned(
                bottom: rowDistance * 3,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    HexButton(3, 1),
                    HexButton(3, 2),
                    HexButton(3, 3),
                    HexButton(3, 4),
                    HexButton(3, 5),
                    HexButton(3, 6),
                    HexButton(3, 7),
                    HexButton(3, 8),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HexButton(4, 0),
                  HexButton(4, 1),
                  HexButton(4, 2),
                  HexButton(4, 3),
                  HexButton(4, 4),
                  HexButton(4, 5),
                  HexButton(4, 6),
                  HexButton(4, 7),
                  HexButton(4, 8),
                ],
              ),
              Positioned(
                top: rowDistance * 3,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    HexButton(5, 0),
                    HexButton(5, 1),
                    HexButton(5, 2),
                    HexButton(5, 3),
                    HexButton(5, 4),
                    HexButton(5, 5),
                    HexButton(5, 6),
                    HexButton(5, 7),
                  ],
                ),
              ),
              Positioned(
                top: rowDistance * 2,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    HexButton(6, 0),
                    HexButton(6, 1),
                    HexButton(6, 2),
                    HexButton(6, 3),
                    HexButton(6, 4),
                    HexButton(6, 5),
                    HexButton(6, 6),
                  ],
                ),
              ),
              Positioned(
                top: rowDistance,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    HexButton(7, 0),
                    HexButton(7, 1),
                    HexButton(7, 2),
                    HexButton(7, 3),
                    HexButton(7, 4),
                    HexButton(7, 5),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    HexButton(8, 0),
                    HexButton(8, 1),
                    HexButton(8, 2),
                    HexButton(8, 3),
                    HexButton(8, 4),
                  ],
                ),
              ),
            ],
          ),
        );
        break;
      default:
        return null;
        break;
    } // Giving positional information through constructors
  }
}
