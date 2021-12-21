import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:talk/domain/repositories/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? account = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication authentication = await account!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: authentication.accessToken,
        idToken: authentication.idToken
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}