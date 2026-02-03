import 'dart:async' show Timer;
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:for_prof/common/ui/theme/theme_with_notifier.dart';
import 'package:for_prof/feature/home_screen.dart';
import 'package:for_prof/main.dart';

// ignore: library_private_types_in_public_api
final GlobalKey<_MyAppState> myAppKey = GlobalKey<_MyAppState>();

class MyApp extends StatefulWidget {
  MyApp({Key? key, required this.themeWithNotifier}) : super(key: myAppKey);

  ThemeWithNotifier themeWithNotifier;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Timer? timer;

  void rebuild(){
    setState(() {
      
    });
  }

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 3), (_) => check());
    super.initState();

    widget.themeWithNotifier.addListener(() => setState(() {}));
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
      theme: ThemeData(brightness: widget.themeWithNotifier.getCurrentTheme),
      scrollBehavior: MyScrollBehavior(),
      debugShowCheckedModeBanner: false,

      home: HomeScreen(themeWithNotifier: widget.themeWithNotifier),
    );
  }
}

class MyScrollBehavior extends MaterialScrollBehavior {
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.mouse,
    PointerDeviceKind.touch,
  };
}
