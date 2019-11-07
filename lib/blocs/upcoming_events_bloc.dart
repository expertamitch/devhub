import 'dart:async';

import 'package:dev_hub/util/data.dart';

import 'base_bloc.dart';

class UpcomingEventsBloc extends BaseBloc {
  final _upcomingEventsController = StreamController<List<dynamic>>();

  Stream<List<dynamic>> get stream => _upcomingEventsController.stream;

  UpcomingEventsBloc() {
    _upcomingEventsController.add(events);
  }

  @override
  void dispose() {
    _upcomingEventsController.close();
  }
}
