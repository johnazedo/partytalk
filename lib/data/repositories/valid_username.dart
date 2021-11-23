import 'package:talk/data/services/user.dart';
import 'package:talk/domain/repositories/valid_username.dart';

class IsValidUsernameRepositoryImpl implements IsValidUsernameRepository {
  final UserService service;

  IsValidUsernameRepositoryImpl({ required this.service });

  @override
  Future<bool> call(String username) async {
    var querySnapshot = await service.searchUserByUsername(username);
    return querySnapshot.docs.isEmpty;
  }
}