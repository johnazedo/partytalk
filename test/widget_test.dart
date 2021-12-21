import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talk/data/repositories/chat_repo.dart';
import 'package:talk/data/services/chat_service.dart';
import 'package:integration_test/integration_test_driver.dart';

Future<void> driver() => integrationDriver();

void main() {
  //
  // setUpAll(() async {
  //   await Firebase.initializeApp();
  // });

  testWidgets("Get Chats", (WidgetTester tester) async {
    await Firebase.initializeApp();
    var chatRepository = ChatRepositoryImpl(chatService: ChatServiceImpl());
    await chatRepository.fetchChats();
  });
}
