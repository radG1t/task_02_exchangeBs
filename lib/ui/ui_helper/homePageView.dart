import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  var controller;

  HomePageView({super.key, required this.controller});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  var images = [
    'assets/images/i0.png',
    'assets/images/i1.png',
    'assets/images/i2.png',
    'assets/images/i3.png',
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      allowImplicitScrolling: true,
      controller: widget.controller,
      children: [
        myPages(images[0]),
        myPages(images[1]),
        myPages(images[2]),
        myPages(images[3]),
      ],
    );
  }

  Widget myPages(String image) {
    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ));
  }
}
