import 'package:dev_hub/blocs/base_bloc.dart';
import 'package:dev_hub/util/data.dart';
import 'package:rxdart/rxdart.dart';

class CommunityHomeBloc implements BaseBloc {
  final _yourCommunitiesController = BehaviorSubject<List<dynamic>>();
  final _popularCommunitiesController = BehaviorSubject<List<dynamic>>();

  Stream<List<dynamic>> get yourCommunitiesStream =>
      _yourCommunitiesController.stream;

  Stream<List<dynamic>> get popularCommunitiesStream =>
      _popularCommunitiesController.stream;

  CommunityHomeBloc() {
    List<dynamic> communitiesList = communities;

    _yourCommunitiesController.add(communitiesList);
    _popularCommunitiesController.add(communitiesList);
  }

  @override
  void dispose() {
    _yourCommunitiesController.close();
    _popularCommunitiesController.close();
  }
}
