import 'package:talk/domain/entities/user.dart';

abstract class UserRepository {
  Future<bool> isValidUsername(String username);
  Future<bool> createUser(User user);
  Future<bool> userAlreadyAdded(User user);
}