import 'package:dev_hub/blocs/base_bloc.dart';
import 'package:dev_hub/util/data.dart';
import 'package:rxdart/rxdart.dart';

class ApplyJobBloc extends BaseBloc {
  final _applyJobController = BehaviorSubject<List<dynamic>>();

  Stream<List<dynamic>> get applyJobStream => _applyJobController.stream;

  ApplyJobBloc() {
    _applyJobController.add(applyJobQuestions);
  }

  @override
  void dispose() {
    _applyJobController.close();
  }
}
