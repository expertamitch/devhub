import 'package:dev_hub/blocs/base_bloc.dart';
import 'package:dev_hub/util/data.dart';
import 'package:rxdart/rxdart.dart';

class ApplyEventBloc extends BaseBloc {
  final _applyEventController = BehaviorSubject<List<dynamic>>();

  Stream<dynamic> get applyEventStream => _applyEventController.stream;

  ApplyEventBloc() {
    _applyEventController.add(applyEventQuestions);
  }

  @override
  void dispose() {
    _applyEventController.close();
  }
}
