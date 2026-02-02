import 'package:flutter/material.dart';
import 'package:for_prof/common/ui/color/colors.dart';
import 'package:for_prof/common/ui/components/button.dart';
import 'package:for_prof/common/ui/text/text.dart';
import 'package:for_prof/feature/auth/data/service.dart';
import 'package:for_prof/feature/auth/widget/register_page.dart';
import 'package:for_prof/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passord = TextEditingController();
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorSS.deepPurple,
        toolbarHeight: size.height * 0.1,
        centerTitle: true,
        title: Text('login', style: TextSS.header),
      ),
      body: Column(
        children: [
          SizedBox(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.04),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                  child: Image.asset(
                    'assets/login.png',
                    width: 105,
                    height: 82,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: size.width * 0.2,
                  ),
                  child: Text(
                    'For free, join now and start learning',
                    style: TextSS.header,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.1),

          //TEXTFORMFIELD
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email Address', style: TextSS.body),
                SizedBox(height: 8),
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(8, 14, 30, 0.05),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 16,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //TEXTFORMFIELD
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('password', style: TextSS.body),
                SizedBox(height: 8),
                TextFormField(
                  controller: _passord,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromRGBO(8, 14, 30, 0.05),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 16,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              AuthService().signInWithPassword(
                email: _email.text,
                password: _passord.text,
              );
            },
            child: Button(size: size, buttonText: 'Login'),
          ),
          Row(
            children: [
              Text(''),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text('register'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
