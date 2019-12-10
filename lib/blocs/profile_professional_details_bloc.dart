import 'dart:async';

import 'package:dev_hub/blocs/base_bloc.dart';
import 'package:dev_hub/models/technology_model.dart';
import 'package:dev_hub/util/data.dart';
import 'package:rxdart/rxdart.dart';

class ProfileProfessionDetailsBloc implements BaseBloc {
  final _jobTitleController = StreamController<String>();
  final _companyController = StreamController<String>();
  final _educationController = StreamController<String>();
  final _collegeController = StreamController<String>();

  final _technologyListController =BehaviorSubject<List<Technology>>();

  Stream<String> get jobTitleStream => _jobTitleController.stream;

  Stream<String> get companyStream => _companyController.stream;

  Stream<String> get educationStream => _educationController.stream;

  Stream<String> get collegeStream => _collegeController.stream;


  Stream<List<Technology>> get technologyListStream =>
      _technologyListController.stream;

  StreamSink<String> get jobTitleSink => _jobTitleController.sink;

  StreamSink<String> get companySink => _companyController.sink;

  StreamSink<String> get educationSink => _educationController.sink;

  StreamSink<String> get collegeSink => _collegeController.sink;

  StreamSink<List<Technology>> get technologyListSink =>
      _technologyListController.sink;


  ProfileProfessionDetailsBloc(){
    _technologyListController.add(technologyList);
  }

  void validateJobTitle(String jobTitle) {
    if (jobTitle.isNotEmpty) {
      jobTitleSink.add(jobTitle);
    } else {
      jobTitleSink.addError("Enter job title");
    }
  }

  void validateCompany(String company) {
    if (company.isNotEmpty) {
      companySink.add(company);
    } else {
      companySink.addError("Enter company name");
    }
  }

  void validateEducation(String education) {
    if (education.isNotEmpty) {
      educationSink.add(education);
    } else {
      educationSink.addError("Enter education");
    }
  }



  void validateCollege(String college) {
    if (college.isNotEmpty) {
      collegeSink.add(college);
    } else {
      collegeSink.addError("Enter college name");
    }
  }

  @override
  void dispose() {
    _jobTitleController.close();
    _collegeController.close();
    _companyController.close();
    _educationController.close();
    _technologyListController.close();
  }
}
