import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talk/domain/entities/chat.dart';

abstract class UseCase {
  Stream<List<DocumentReference>> call(String userEmail);
}

abstract class Repository {
  Stream<List<DocumentReference>> getChats(String userEmail);
}

class UseCaseImpl implements UseCase {
  final Repository repository;
  UseCaseImpl({required this.repository});

  @override
  Stream<List<DocumentReference>> call(String userEmail) {
    return repository.getChats(userEmail);
  }

}