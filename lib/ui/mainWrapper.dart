import 'package:flutter/material.dart';
import 'package:task_02/ui/homePage.dart';
import 'package:task_02/ui/marketViewPage.dart';
import 'package:task_02/ui/profilePage.dart';
import 'package:task_02/ui/ui_helper/bottomNav.dart';
import 'package:task_02/ui/watchListPage.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final PageController _myPage = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.compare_arrows_outlined),
      ),
      bottomNavigationBar: BottomNav(
        controller: _myPage,
      ),
      body: PageView(
        controller: _myPage,
        children: [
          HomePage(),
          MarketViewPage(),
          ProfilePage(),
          WatchListPage(),
        ],
      ),
    );
  }
}
//bottomNav done.
