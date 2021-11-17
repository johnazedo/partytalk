import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends ChangeNotifier {

  var nameUser = ValueNotifier<String>("");

  void signIn() async {
    await _signInWithGoogle();
    User? user = await getCurrentUser();
    if(user != null) {
      nameUser.value = user.displayName ?? "No user";
    }
    notifyListeners();
  }

  Future<UserCredential> _signInWithGoogle() async {
    final GoogleSignInAccount? account = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication authentication = await account!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: authentication.accessToken,
        idToken: authentication.idToken
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<User?> getCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
  }
}