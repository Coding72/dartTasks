//import 'package:p12/p12.dart' as p12;
abstract class DB {
  String username ="";
  String password = "";
  int port = 3306; // mysql
  String dbname = "";
  String location = ""; // sqlite
}

class ChatMessage{}


abstract class DatabaseRepository extends DB {
  void sendMessage(String message);
  void updateMessage(int id, String message);
  void deleteMessage(int id);
  List<ChatMessage> getMessages();
}

class MockDatabaseRepository implements DatabaseRepository {
  String username ="";
  String password = "";
  int port = 3306; // mysql
  String dbname = "";
  String location = ""; // sqlite

  List<String> messages = [];
  List<ChatMessage> messageList = [];

  @override
  void sendMessage(String m) {
    messages.add(m);
  }

  @override
  void updateMessage(int id, String message){}

  @override
  void deleteMessage(int id){}

  @override
  List<ChatMessage> getMessages() {
    return messageList;
  }
}


void main(List<String> arguments) {

}
