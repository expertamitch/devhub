import 'package:dev_hub/util/data.dart';
import 'package:rxdart/rxdart.dart';

import 'base_bloc.dart';

class ConversationBloc extends BaseBloc {
  final _conversationController = BehaviorSubject<List<dynamic>>();

  Stream<List<dynamic>> get conversationStream =>
      _conversationController.stream;

  ConversationBloc() {
    _conversationController.add(conversation);
  }

  sendMessage(String text, bool isReply) {
    var data = {
      "username": "Group ${random.nextInt(20)}",
      "time": "${random.nextInt(50)} min ago",
      "type": 'text',
      "replyText": text,
      "text": text,
      "isMe": true,
      "isGroup": false,
      "image": "assets/cm${random.nextInt(10)}.jpeg",
      "isReply": isReply
    };

    List<dynamic> messages = _conversationController.value;
    messages.insert(0, data);
    _conversationController.add(messages);
  }

  @override
  void dispose() {
    _conversationController.close();
  }
}
