import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerMarketWidget extends StatelessWidget {
  const ShimmerMarketWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Shimmer.fromColors(
          baseColor: Colors.black,
          highlightColor: Colors.green,
          child: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              Container(
                height: 50,
                child: const Center(child: Text('Entry A')),
              ),
              Container(
                height: 50,
                child: const Center(child: Text('Entry B')),
              ),
              Container(
                height: 50,
                child: const Center(child: Text('Entry C')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
