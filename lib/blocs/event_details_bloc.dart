import 'package:dev_hub/blocs/base_bloc.dart';
import 'package:dev_hub/util/data.dart';
import 'package:rxdart/rxdart.dart';

class EventDetailsBloc implements BaseBloc {
  final _eventController = BehaviorSubject<dynamic>();

  Stream<dynamic> get eventDetailsStream => _eventController.stream;

  EventDetailsBloc() {
    var data = events[0];
//    data['applied'] = false;
    _eventController.add(data);
  }

  @override
  void dispose() {
    _eventController.close();
  }
}
