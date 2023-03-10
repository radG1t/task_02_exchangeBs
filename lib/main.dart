import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:task_02/providers/ThemeProvider.dart';
import 'package:task_02/providers/cryptoDataProvider.dart';
import 'package:task_02/ui/signUpScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => CryptoDataProvider(),
      ),
      // ChangeNotifierProvider(
      //   create: (context) => UserDataProvider(),
      // ),
    ],
    child: const MyMaterialApp(),
  ));
}

class MyMaterialApp extends StatefulWidget {
  const MyMaterialApp({super.key});

  @override
  State<MyMaterialApp> createState() => _MyMaterialAppState();
}

class _MyMaterialAppState extends State<MyMaterialApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        themeMode: themeProvider.themeMode,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        debugShowCheckedModeBanner: false,
        home: Directionality(
          textDirection: TextDirection.ltr,
          child: SignUpScreen(),
        ),
      );
    });
  }
}
