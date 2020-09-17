import 'package:beehive/components/difficulty.dart'; // For Difficulty
import 'package:flutter/material.dart'; // Main Flutter
import 'package:beehive/screens/splash_screen.dart'; // Splash Screen
import 'package:beehive/screens/home_screen.dart'; // Home Screen
import 'package:beehive/screens/puzzle_screen.dart'; // Puzzle Screen
import 'package:beehive/components/Themes.dart'; // For Themes
import 'package:page_transition/page_transition.dart'; // For Transition
import 'package:beehive/components/puzzle_maker.dart'; // Main Grid Filler
import 'package:provider/provider.dart'; // Provider

void main() {
  runApp(
    MyApp(), // Main App
  );
}

ThemeManage themeManage = ThemeManage(); // To be converted into Provider

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Return Providers above the Main App
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DifficultyManage>(
          create: (BuildContext context) => DifficultyManage(),
        ),
        ListenableProxyProvider<DifficultyManage, Puzzle>(
          update: (BuildContext context, difficultyManage, puzzle) =>
              Puzzle(difficultyManage), // Puzzle depends on Difficulty
          create: (BuildContext context) => Puzzle.x(), // Bogus
        ),
        ListenableProxyProvider<Puzzle, EntryList>(
          update: (BuildContext context, puzzle, entryList) =>
              EntryList(puzzle), // EntryList Depends on Puzzle
          create: (BuildContext context) => EntryList.x(), // Bogus
        ),
      ],
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: themeManage.returnTheme(),
        darkTheme: ThemeData.dark(),
        initialRoute: HomeScreen.id, // Initial Screen
        onGenerateRoute: (settings) {
          // Id id for route String
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
