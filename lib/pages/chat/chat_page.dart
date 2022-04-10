import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:uuid/uuid.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final FirebaseFirestore fire = FirebaseFirestore.instance;

  List<types.Message> _messages = [];
  final _user = const types.User(id: 'Jov089AdBjVugMSvmT0VbPs07sB');

  void _addMessage(types.Message message) async {
    var uuid = Uuid();
    String random = uuid.v1();
    await fire
        .collection('сhatall')
        .doc(random)
        .set({"params": message.toJson()}); 
    _loadMessages();
  }

  void _loadMessages() async {
    QuerySnapshot querySnapshot = await fire.collection('сhatall').get();
    var allChatDate = querySnapshot.docs.map((doc) {
      var trr = doc.data();
      print("DOC" + doc["params"].toString());
      print("DOC" + doc.toString());
      return types.Message.fromJson(
          doc["params"]); 
    }).toList();

    setState(() {
      _messages = allChatDate;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void _handleSendPressed(types.PartialText message) {
    var uuid = Uuid();
    String random = uuid.v1();
    final textMessage = types.TextMessage(
      id: random,
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      text: message.text,
    );

    _addMessage(textMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Чат"),
        backgroundColor: Colors.purple,
      ),
      body: SafeArea(
        bottom: false,
        child: Chat(
          theme: const DefaultChatTheme(
              inputBackgroundColor: Colors.green,
              receivedMessageDocumentIconColor: Colors.red,
              secondaryColor: Colors.indigo,
              primaryColor: Colors.purple),
          messages: _messages,
          onSendPressed: _handleSendPressed,
          user: _user,
        ),
      ),
    );
  }
}
