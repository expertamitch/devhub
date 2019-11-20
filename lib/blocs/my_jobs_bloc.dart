import 'package:dev_hub/blocs/base_bloc.dart';
import 'package:dev_hub/util/data.dart';
import 'package:rxdart/rxdart.dart';

class MyJobsBloc implements BaseBloc{
  final _appliedJobsController = BehaviorSubject<List<dynamic>>();
  final _savedJobsController = BehaviorSubject<List<dynamic>>();

  Stream<dynamic> get appliedJobsStream => _appliedJobsController.stream;
  Stream<dynamic> get savedJobsStream => _savedJobsController.stream;


  MyJobsBloc(){
    _savedJobsController.add(jobsDetails);
    _appliedJobsController.add(jobsDetails);
  }

  @override
  void dispose() {
    _savedJobsController.close();
    _appliedJobsController.close();
  }


}