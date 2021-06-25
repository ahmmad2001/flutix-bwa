part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignupResult> signUp(String email, String password,
      String name, List<String> selectedGenres, String selectedLanguage) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      Users user = result.user.convertToUser(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

      await UserServices.updateUser(user);
      return SignInSignupResult(user: user);
    } catch (e) {
      return SignInSignupResult(message: e.toString().split(',')[1]);
    }
  }

  static Future<SignInSignupResult> signIn(
      String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      Users user = await result.user.fromFireStore();

      return SignInSignupResult(user: user);
    } catch (e) {
      return SignInSignupResult(message: e.toString().split(',')[1]);
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Stream<FirebaseUser> get userStream => _auth.onAuthStateChanged;
}

class SignInSignupResult {
  Users user;
  final String message;

  SignInSignupResult({this.user, this.message});
}
