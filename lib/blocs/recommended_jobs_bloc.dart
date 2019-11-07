import 'dart:async';

import 'package:dev_hub/util/data.dart';

import 'base_bloc.dart';

class RecommendedJobsBloc extends BaseBloc {
  final _recommendedJobsController = StreamController<List<dynamic>>();

  Stream<List<dynamic>> get stream => _recommendedJobsController.stream;

  RecommendedJobsBloc() {
    _recommendedJobsController.add(jobsDetails);
  }

  @override
  void dispose() {
    _recommendedJobsController.close();
  }
}
