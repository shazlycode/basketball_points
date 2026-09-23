import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int teamAScore = 0;
  int teamBScore = 0;

  void addPoints(int? toBeAddedPoints, String team) {
    if (team == "teamA") {
      setState(() {
        teamAScore = teamAScore + toBeAddedPoints!;
      });
    } else {
      setState(() {
        teamBScore = teamBScore + toBeAddedPoints!;
      });
    }
  }

  void reset() {
    setState(() {
      teamAScore = 0;
      teamBScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basketball Points"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Team A",
                    style: TextTheme.of(context).headlineLarge,
                  ),
                  Text("$teamAScore",
                      style: TextTheme.of(context).headlineLarge),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          addPoints(1, "teamA");
                        },
                        child: Text("Add 1 Point")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          addPoints(2, "teamA");
                        },
                        child: Text("Add 2 Point")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () => addPoints(3, "teamA"),
                        child: Text("Add 3 Point")),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(50),
                child: Container(
                  height: 400,
                  width: 4,
                  color: const Color.fromARGB(255, 80, 78, 78),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Team B",
                    style: TextTheme.of(context).headlineLarge,
                  ),
                  Text(
                    "$teamBScore",
                    style: TextTheme.of(context).headlineLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () => addPoints(1, "teamB"),
                        child: Text("Add 1 Point")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: WidgetStateProperty.all(5),
                        ),
                        onPressed: () => addPoints(2, "teamB"),
                        child: Text("Add 2 Point")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () => addPoints(3, "teamB"),
                        child: Text("Add 3 Point")),
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(onPressed: () => reset(), child: Text("Reset"))
        ],
      ),
    );
  }
}
