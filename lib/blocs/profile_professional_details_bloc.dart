import 'dart:async';

import 'package:dev_hub/blocs/base_bloc.dart';

class ProfileProfessionDetailsBloc implements BaseBloc {
  final _jobTitleController = StreamController<String>();
  final _companyController = StreamController<String>();
  final _educationController = StreamController<String>();
  final _collegeController = StreamController<String>();
  final _aboutController = StreamController<String>();
  final _technologyListController =
      StreamController<List<String>>();

  Stream<String> get jobTitleStream => _jobTitleController.stream;

  Stream<String> get companyStream => _companyController.stream;

  Stream<String> get educationStream => _educationController.stream;

  Stream<String> get collegeStream => _collegeController.stream;

  Stream<String> get aboutStream => _aboutController.stream;

  Stream<List<String>> get technologyListStream =>
      _technologyListController.stream;

  StreamSink<String> get jobTitleSink => _jobTitleController.sink;

  StreamSink<String> get companySink => _companyController.sink;

  StreamSink<String> get educationSink => _educationController.sink;

  StreamSink<String> get collegeSink => _collegeController.sink;

  StreamSink<String> get aboutSink => _aboutController.sink;

  StreamSink<List<String>> get technologyListSink =>
      _technologyListController.sink;


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


  void validateAbout(String about) {
    if (about.isNotEmpty) {
      aboutSink.add(about);
    } else {
      aboutSink.addError("Enter something about you");
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
    _aboutController.close();
    _collegeController.close();
    _companyController.close();
    _educationController.close();
    _technologyListController.close();
  }
}