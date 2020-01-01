import 'package:dev_hub/blocs/base_bloc.dart';
import 'package:dev_hub/util/data.dart';
import 'package:rxdart/rxdart.dart';

class MyEventBloc implements BaseBloc{
  final _eventGoingController = BehaviorSubject<List<dynamic>>();
  final _eventInvitationController = BehaviorSubject<List<dynamic>>();
  final _eventPendingController = BehaviorSubject<List<dynamic>>();




  Stream<dynamic> get eventGoingStream => _eventGoingController.stream;
  Stream<dynamic> get eventInvitationStream => _eventInvitationController.stream;
  Stream<dynamic> get eventPendingStream => _eventPendingController.stream;


  MyEventBloc(){
    _eventGoingController.add(events);
    _eventInvitationController.add(events);
    _eventPendingController.add(events);
  }

  @override
  void dispose() {
    _eventGoingController.close();
    _eventInvitationController.close();
    _eventPendingController.close();
  }


}