import 'dart:async';

import 'base_bloc.dart';
import 'package:dev_hub/util/data.dart';

class UserProfileBloc extends BaseBloc {
  final _workExperienceController = StreamController<List<dynamic>>();

  Stream<List<dynamic>> get workExperienceStream =>
      _workExperienceController.stream;

  final _contactInfoController = StreamController<Map<dynamic, dynamic>>();

  Stream<Map<dynamic, dynamic>> get contactInfoStream =>
      _contactInfoController.stream;

  UserProfileBloc() {
    _workExperienceController.add(jobsDetails);
    _contactInfoController.add(contactInfo);
  }

  @override
  void dispose() {
    _workExperienceController.close();
    _contactInfoController.close();
  }
}
