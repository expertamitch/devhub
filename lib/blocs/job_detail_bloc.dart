import 'package:dev_hub/util/data.dart';
import 'package:rxdart/rxdart.dart';

import 'base_bloc.dart';

class JobDetailBloc extends BaseBloc {
  final _jobController = BehaviorSubject<dynamic>();

  Stream<dynamic> get stream => _jobController.stream;

  JobDetailBloc() {
    _jobController.add(jobsDetails[0]);
  }

  @override
  void dispose() {
    _jobController.close();
  }
}
