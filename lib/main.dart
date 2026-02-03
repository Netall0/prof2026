import 'dart:async';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:for_prof/common/localization/l10n.dart';
import 'package:for_prof/common/ui/theme/theme_with_notifier.dart';
import 'package:for_prof/feature/home_screen.dart';
import 'package:for_prof/my_app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//global
void main(List<String> args) {
  runZonedGuarded(() {
    L.load();
    WidgetsFlutterBinding.ensureInitialized();
    try {
      Supabase.initialize(
        anonKey:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhqZ3pjbHVyeWhoeHdvbWVsdXJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk5Mjg3NTAsImV4cCI6MjA4NTUwNDc1MH0.LORSKbAX1W_NF5bAXy_dqgd8adzGRu43VnDcgDcqIvk',
        url: 'https://xjgzcluryhhxwomelurd.supabase.co',
      );
      final ThemeWithNotifier themeWithNotifier = ThemeWithNotifier();

      runApp(MyApp(themeWithNotifier: themeWithNotifier,));
    } on Object catch (e) {}
  }, (error, st) {});
}



//learn this point

class NoInternet extends StatefulWidget {
  const NoInternet({super.key});

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('no')));
  }
}
