import 'package:supabase_flutter/supabase_flutter.dart';

final class AuthService {
  final SupabaseClient _client = Supabase.instance.client;

  Future<void> signInWithPassword({
    required String email,
    required String password,
  }) {
    return _client.auth.signInWithPassword(password: password, email: email);
  }

  Future<void> signUpWith({required String password, required String email}) {
    return _client.auth.signUp(password: password, email: email);
  }

  Future<void> logOut() {
    return _client.auth.signOut();
  }
}
