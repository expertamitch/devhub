import 'dart:async';

import 'package:dev_hub/util/data.dart';
import 'package:rxdart/rxdart.dart';

import 'base_bloc.dart';

class JobsBloc extends BaseBloc {
  final _recommendedJobsController = BehaviorSubject<List<dynamic>>();

  Stream<List<dynamic>> get stream => _recommendedJobsController.stream;

  JobsBloc() {
    _recommendedJobsController.add(jobsDetails);
  }

  @override
  void dispose() {
    _recommendedJobsController.close();
  }
}
