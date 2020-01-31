import 'package:dev_hub/blocs/base_bloc.dart';
import 'package:dev_hub/util/data.dart';
import 'package:rxdart/rxdart.dart';

class NotificationsBloc extends BaseBloc {
  final _notificationsController = BehaviorSubject<List<dynamic>>();
  Stream<dynamic> get notificationsStream => _notificationsController.stream;

  NotificationsBloc() {
    _notificationsController.add(notifications);
  }
  @override
  void dispose() {
    _notificationsController.close();
  }
}
