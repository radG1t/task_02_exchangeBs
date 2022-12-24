import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_02/providers/cryptoDataProvider.dart';
import 'package:task_02/ui/ui_helper/ThemeSwitcher.dart';
import 'package:task_02/ui/ui_helper/homePageView.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageViewController = PageController(
    initialPage: 0,
  );

  var defaultChoiseIndex = 0;

  final List<String> _choiceList = [
    'Top MarketCaps',
    'Top Gainers',
    'Top Losers'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final cryptoProvider =
        Provider.of<CryptoDataProvider>(context, listen: false);
    cryptoProvider.getTopMarketCapData();
  }

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
                /*     SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: Marquee(
                    text: '** this is a place for news in application ** ',
                    style: textTheme.bodySmall,
                  ),
                  // TextTheme textTheme = Theme.of(context).textTheme;
                ),  */
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(17),
                            backgroundColor: Colors.red.shade700,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                          child: const Text('Buy'),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(17),
                            backgroundColor: Colors.green.shade700,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text('Sell'),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 5,
                    right: 5,
                  ),
                  child: Wrap(
                      spacing: 8,
                      children: List.generate(
                        _choiceList.length,
                        (index) {
                          return ChoiceChip(
                            label: Text(
                              _choiceList[index],
                              style: textTheme.titleSmall,
                            ),
                            selected: defaultChoiseIndex == index,
                            selectedColor: Colors.blue,
                            onSelected: (value) {
                              setState(
                                () {
                                  defaultChoiseIndex =
                                      value ? index : defaultChoiseIndex;
                                },
                              );
                            },
                          );
                        },
                      )),
                ),
                Consumer<CryptoDataProvider>(
                  builder: (context, cryptoDataProvider, child) {
                    switch (cryptoDataProvider.state.status) {
                      case Status.LOADING:
                        return Text(cryptoDataProvider.state.message);
                      case Status.COMPLETED:
                        return Text('done');
                      case Status.ERRPR:
                        return Text(cryptoDataProvider.state.message);
                      default:
                        return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
