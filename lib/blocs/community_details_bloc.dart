import 'package:dev_hub/blocs/base_bloc.dart';
import 'package:dev_hub/util/data.dart';
import 'package:rxdart/rxdart.dart';

class CommunityDetailsBloc implements BaseBloc{
  final _communityController = BehaviorSubject<dynamic>();

  Stream<dynamic> get communityDetailsStream => _communityController.stream;


  CommunityDetailsBloc(){
    _communityController.add(communities[0]);
  }

  @override
  void dispose() {
    _communityController.close();
  }

}