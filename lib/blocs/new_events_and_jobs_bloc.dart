import 'dart:async';

import 'base_bloc.dart';
import 'package:dev_hub/util/data.dart';

class NewEventsAndJobsBloc extends BaseBloc {
  final _newEventsAndJobsController = StreamController<List<dynamic>>();

  Stream<List<dynamic>> get stream => _newEventsAndJobsController.stream;

  NewEventsAndJobsBloc() {
    _newEventsAndJobsController.add(imgList);
  }

  @override
  void dispose() {
    _newEventsAndJobsController.close();
  }
}
