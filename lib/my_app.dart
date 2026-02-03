import 'dart:async' show Timer;
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:for_prof/feature/home_screen.dart';
import 'package:for_prof/main.dart';

// ignore: library_private_types_in_public_api
GlobalKey<_MyAppState> appKey = GlobalKey<_MyAppState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: appKey);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 3), (_) => check());
    super.initState();

    themeWithNotifier.addListener(() => setState(() {}));
  }

  void check() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isEmpty) throw 'no in';
    } on Object catch (e) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return NoInternet();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: themeWithNotifier.getCurrentTheme),
      scrollBehavior: MyScrollBehavior(),
      debugShowCheckedModeBanner: false,

      home: HomeScreen(),
    );
  }

  static void rebuild(BuildContext context) {
    context.findAncestorStateOfType<_MyAppState>()?.setState(() {});
  }
}

class MyScrollBehavior extends MaterialScrollBehavior {
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.mouse,
    PointerDeviceKind.touch,
  };
}
