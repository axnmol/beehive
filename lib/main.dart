import 'package:beehive/components/difficulty.dart';
import 'package:flutter/material.dart';
import 'package:beehive/screens/splash_screen.dart';
import 'package:beehive/screens/home_screen.dart';
import 'package:beehive/screens/puzzle_screen.dart';
import 'package:beehive/components/Themes.dart';
import 'package:page_transition/page_transition.dart';
import 'package:beehive/components/puzzle_maker.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

ThemeManage themeManage = ThemeManage();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider<DifficultyManage>(
      create: (context) => DifficultyManage(),
      ),
        ProxyProvider<DifficultyManage,Puzzle>(
          update: (context,difficultyManage,puzzle) => Puzzle(difficultyManage),
        ),
        ProxyProvider<Puzzle,EntryList>(
          update: (context,puzzle,entryList) => EntryList(puzzle),
        ),
      ],
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: themeManage.returnTheme(),
        darkTheme: ThemeData.dark(),
        initialRoute: HomeScreen.id,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case HomeScreen.id:
              return PageTransition(
                  child: HomeScreen(),
                  type: PageTransitionType.fade,
                  duration: Duration(milliseconds: 400));
              break;
            case PuzzleScreen.id:
              return PageTransition(
                  child: PuzzleScreen(),
                  type: PageTransitionType.fade,
                  duration: Duration(milliseconds: 400));
              break;
            case '/splash':
              return PageTransition(
                  child: SplashScreen(),
                  type: PageTransitionType.fade,
                  duration: Duration(milliseconds: 400));
              break;
            default:
              return null;
          }
        },
      ),
    );
  }
}
