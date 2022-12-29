import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_02/helpers/decimalRounder.dart';
import 'package:task_02/models/CryptoModel/AllCryptoModel.dart';
import 'package:task_02/models/CryptoModel/CryptoData.dart';
import 'package:task_02/network/responseModel.dart';
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
    var height = MediaQuery.of(context).size.height;
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
                SizedBox(
                  height: 500,
                  child: Consumer<CryptoDataProvider>(
                    builder: (context, cryptoDataProvider, child) {
                      switch (cryptoDataProvider.state.status) {
                        case Status.LOADING:
                          return Shimmer.fromColors(
                              child: ListView.builder(
                                  itemCount: 15,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      children: [
                                        const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(8, 8, 0, 8),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 30,
                                            child: Icon(Icons.add),
                                          ),
                                        ),
                                        Flexible(
                                          fit: FlexFit.tight,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 50,
                                                  height: 15,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: SizedBox(
                                                    width: 25,
                                                    height: 15,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          fit: FlexFit.tight,
                                          child: SizedBox(
                                            width: 70,
                                            height: 40,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          fit: FlexFit.tight,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                  width: 50,
                                                  height: 15,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: SizedBox(
                                                    width: 25,
                                                    height: 15,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                              baseColor: Colors.grey.shade400,
                              highlightColor: Colors.white);
                        case Status.COMPLETED:
                          List<CryptoData>? model = cryptoDataProvider
                              .datafuter.data!.cryptoCurrencyList;
                          print(model![0].symbol);
                          return ListView.separated(
                              itemBuilder: ((context, index) {
                                var number = index + 1;
                                var tokenId = model[index].id;
                                MaterialColor filterColor =
                                    DecimalRounder.setColorFilter(model[index]
                                        .quotes![0]
                                        .percentChange24h);
                                var finalPrice =
                                    DecimalRounder.removePriceDecimals(
                                        model[index].quotes![0].price);
                                var perecentChange =
                                    DecimalRounder.removePercentDecimals(
                                        model[index]
                                            .quotes![0]
                                            .percentChange24h);
                                var percentColor =
                                    DecimalRounder.setPercentChangesColor(
                                        model[index]
                                            .quotes![0]
                                            .percentChange24h);
                                var percentIcon =
                                    DecimalRounder.setPercentChangesIcon(
                                        model[index]
                                            .quotes![0]
                                            .percentChange24h);

                                DecimalRounder.setColorFilter(
                                    model[index].quotes![0].percentChange24h);
                                return SizedBox(
                                  height: height * 0.075,
                                  child: Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        number.toString(),
                                        style: textTheme.bodySmall,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                        10,
                                        0,
                                        15,
                                        0,
                                      ),
                                      child: CachedNetworkImage(
                                        fadeInDuration:
                                            const Duration(milliseconds: 500),
                                        width: 32,
                                        height: 32,
                                        imageUrl:
                                            "https://s2.coinmarketcap.com/static/img/coins/32x32/$tokenId.png",
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            model[index].name!,
                                            style: textTheme.bodySmall,
                                          ),
                                          Text(model[index].symbol!,
                                              style: textTheme.labelSmall)
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      child: ColorFiltered(
                                        colorFilter: ColorFilter.mode(
                                            filterColor, BlendMode.srcATop),
                                        child: SvgPicture.network(
                                            "https://s3.coinmarketcap.com/generated/sparklines/web/1d/2781/$tokenId.svg"),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text("$finalPrice",
                                                  style: textTheme.bodySmall),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  percentIcon,
                                                  Text(
                                                    perecentChange + '%',
                                                    style: GoogleFonts.ubuntu(
                                                      color: percentColor,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )),
                                    ),
                                  ]),
                                );
                              }),
                              separatorBuilder: (context, index) {
                                return const Divider();
                              },
                              itemCount: 15);
                        case Status.ERROR:
                          return Text(cryptoDataProvider.state.message);
                        default:
                          return Container();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
