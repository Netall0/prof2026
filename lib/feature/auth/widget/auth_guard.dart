import 'package:flutter/material.dart';
import 'package:for_prof/feature/auth/widget/login_page.dart';
import 'package:for_prof/feature/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGuard extends StatelessWidget {
  const AuthGuard({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (BuildContext context, AsyncSnapshot<AuthState> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        final session = snapshot.hasData ? snapshot.data?.session : null;

        if (session != null) {
          return HomeScreen();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
