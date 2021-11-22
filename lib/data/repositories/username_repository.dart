import 'package:talk/data/services/username_service.dart';

abstract class UsernameRepository {
  Future<bool> usernameIsValid(String username);
}

class UsernameRepositoryImpl implements UsernameRepository {
  final UsernameService service;

  UsernameRepositoryImpl({ required this.service });

  @override
  Future<bool> usernameIsValid(String username) async {
    var querySnapshot = await service.searchUserByUsername(username);
    return querySnapshot.docs.isEmpty;
  }
}