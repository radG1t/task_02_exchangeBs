import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_02/ui/ui_helper/ThemeSwitcher.dart';
import 'package:task_02/ui/ui_helper/homePageView.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final PageController _pageViewController = PageController(
    initialPage: 0,
  );
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
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 5, right: 5),
                  child: SizedBox(
                    height: 160,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        HomePageView(controller: _pageViewController),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: SmoothPageIndicator(
                              controller: _pageViewController,
                              count: 4,
                              effect: const ExpandingDotsEffect(
                                  dotWidth: 10, dotHeight: 10),
                              onDotClicked: (index) =>
                                  _pageViewController.animateToPage(index,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
