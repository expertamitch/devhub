import 'package:dev_hub/blocs/base_bloc.dart';
import 'package:dev_hub/util/data.dart';
import 'package:rxdart/rxdart.dart';

class EventDetailsBloc implements BaseBloc{
  final _eventController = BehaviorSubject<dynamic>();

  Stream<dynamic> get eventDetailsStream => _eventController.stream;


  EventDetailsBloc(){
    _eventController.add(events[0]);
  }

  @override
  void dispose() {
    _eventController.close();
  }


}