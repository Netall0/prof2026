import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:for_prof/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main(List<String> args) {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    try {
      Supabase.initialize(
        anonKey:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhqZ3pjbHVyeWhoeHdvbWVsdXJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk5Mjg3NTAsImV4cCI6MjA4NTUwNDc1MH0.LORSKbAX1W_NF5bAXy_dqgd8adzGRu43VnDcgDcqIvk',
        url: 'https://xjgzcluryhhxwomelurd.supabase.co',
      );
      runApp(App());
    } on Object catch (e) {}
  }, (error, st) {});
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyScrollBehavior(),
      debugShowCheckedModeBanner: false,

      home: SplashScreen(),
    );
  }
}

class MyScrollBehavior extends MaterialScrollBehavior {
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.mouse,
    PointerDeviceKind.touch,
  };
}

//learn this point
