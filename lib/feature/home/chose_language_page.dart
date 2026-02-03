import 'package:flutter/material.dart';
import 'package:for_prof/common/localization/l10n.dart';
import 'package:for_prof/main.dart';
import 'package:for_prof/my_app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChoseLanguagePage extends StatefulWidget {
  const ChoseLanguagePage({super.key});

  @override
  State<ChoseLanguagePage> createState() => _ChoseLanguagePageState();
}

class _ChoseLanguagePageState extends State<ChoseLanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              L.change('ru');
              MyApp
            },
            title: Text('Russia'),
          ),
          ListTile(
            onTap: () {
              L.change('en');
            },
            title: Text('English  '),
          ),
        ],
      ),
    );
  }
}
