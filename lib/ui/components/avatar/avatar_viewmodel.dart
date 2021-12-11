
import 'package:flutter/cupertino.dart';
import 'package:talk/domain/usecases/firebase_auth.dart';

class AvatarViewModel extends ChangeNotifier {
  final FirebaseAuthUseCase firebaseAuthUseCase;
  AvatarViewModel({ required this.firebaseAuthUseCase }){
    getPhotoUrl();
  }

  var photoURL = ValueNotifier<String>('');

  void getPhotoUrl(){
    var defaultImage = 'assets/images/avatar.jpg';
    var profileImage = firebaseAuthUseCase.getProfileImage();
    photoURL.value = profileImage ?? defaultImage;
    notifyListeners();
  }
}