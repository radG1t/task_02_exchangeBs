import 'package:flutter/material.dart';
import 'package:task_02/ui/ui_helper/ThemeSwitcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          backgroundColor: primaryColor,
          actions: const [
            ThemeSwitcher(),
          ],
          title: const Text('just a Title as String'),
          centerTitle: true,
          titleTextStyle: textTheme.titleLarge,
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [],
            ),
          ),
        ));
  }
}
