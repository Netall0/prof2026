import 'package:flutter/material.dart';
import 'package:for_prof/common/localization/l10n.dart';
import 'package:for_prof/feature/home/chose_language_page.dart';
import 'package:for_prof/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: InkWell(
          onTap: () {
            themeWithNotifier.setTheme();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('алах')));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChoseLanguagePage()),
            );
          },
          child: Column(
            children: [
              Text(L.tr('hello')),
              Container(
                height: 20,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
