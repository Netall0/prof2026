import 'package:flutter/material.dart';
import 'package:for_prof/common/ui/color/colors.dart';
import 'package:for_prof/common/ui/components/button.dart';
import 'package:for_prof/common/ui/text/text.dart';
import 'package:for_prof/feature/auth/data/service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordConrtoller = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscureText = false;

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
                  controller: _emailController,
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
                  controller: _passwordConrtoller,
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

          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('confirm password', style: TextSS.body),
                SizedBox(height: 8),
                TextFormField(
                  obscureText: _obscureText,

                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: _obscureText
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                    ),
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
              AuthService().signUpWith(
                password: _passwordConrtoller.text,
                email: _emailController.text,
              );
            },
            child: Button(size: size, buttonText: 'LogUp'),
          ),
        ],
      ),
    );
  }
}
