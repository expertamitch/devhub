import 'package:dev_hub/util/data.dart';
import 'package:rxdart/rxdart.dart';

import 'base_bloc.dart';

class ChatsBloc extends BaseBloc {
  final _chatsController = BehaviorSubject<List<dynamic>>();
  final _groupsController = BehaviorSubject<List<dynamic>>();

  Stream<List<dynamic>> get chatsStream => _chatsController.stream;
  Stream<List<dynamic>> get groupsStream => _groupsController.stream;

  ChatsBloc() {
    _chatsController.add(chats);
    _groupsController.add(groups);
  }

  @override
  void dispose() {
    _chatsController.close();
    _groupsController.close();
  }
}
