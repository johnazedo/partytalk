import 'package:talk/data/services/user_service.dart';
import 'package:talk/domain/entities/user.dart';
import 'package:talk/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserService service;

  UserRepositoryImpl({ required this.service });

  @override
  Future<bool> createUser(User user) async {
    var documentReference = await service.createUser(user);
    return documentReference.id != null;
  }

  @override
  Future<bool> isValidUsername(String username) async {
    var querySnapshot = await service.searchUser('username', username);
    return querySnapshot.docs.isEmpty;
  }

  @override
  Future<bool> userAlreadyAdded(String email) async {
    var querySnapshot = await service.searchUser('email', email);
    return querySnapshot.docs.isNotEmpty;
  }
}