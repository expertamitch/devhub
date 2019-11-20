import 'dart:async';
import 'package:dev_hub/util/data.dart';
import 'package:rxdart/rxdart.dart';

import 'base_bloc.dart';

class EventHomeBloc implements BaseBloc {
  final _upcomingEventsController = BehaviorSubject<List<dynamic>>();
  final _suggestedEventsController = BehaviorSubject<List<dynamic>>();
  final _newEventsController = StreamController<List<dynamic>>();

  Stream<List<dynamic>> get newEventsStream => _newEventsController.stream;
  Stream<List<dynamic>> get upcomingEventStream=>_upcomingEventsController.stream;
  Stream<List<dynamic>> get suggestedEventStream=>_suggestedEventsController.stream;


  EventHomeBloc(){
    _newEventsController.add(imgList);
    _upcomingEventsController.add(events);
    _suggestedEventsController.add(events);

  }

  @override
  void dispose() {
    _newEventsController.close();
    _upcomingEventsController.close();
    _suggestedEventsController.close();
  }
}
