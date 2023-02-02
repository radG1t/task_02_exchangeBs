import 'package:flutter/material.dart';

class WatchListPage extends StatelessWidget {
  const WatchListPage({super.key});

  @override
  Widget build(BuildContext context) {
    int timeleft = 5;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(timeleft.toString()),
          ],
        ),
      ),
    );
  }
}
//timer stopwatch or wtf