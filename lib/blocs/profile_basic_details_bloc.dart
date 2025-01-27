import 'dart:async';

import 'package:dev_hub/blocs/base_bloc.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBasicDetailsBloc implements BaseBloc {
  final _firstNameController = BehaviorSubject<String>();
  final _lastNameController = StreamController<String>.broadcast();
  final _profileTitleController = StreamController<String>.broadcast();
  final _dobController = StreamController<String>.broadcast();
  final _liveInController = StreamController<String>.broadcast();
  final _countryListController =BehaviorSubject<List<dynamic>>();
  final _aboutController = StreamController<String>.broadcast();


  Stream<String> get firstNameStream => _firstNameController.stream;

  Stream<String> get lastNameStream => _lastNameController.stream;

  Stream<String> get profileTitleStream => _profileTitleController.stream;

  Stream<String> get dobStream => _dobController.stream;

  Stream<String> get liveInStream => _liveInController.stream;

  Stream<List<dynamic>> get countryListStream =>
      _countryListController.stream;

  Stream<String> get aboutStream => _aboutController.stream;

  StreamSink<String> get aboutSink => _aboutController.sink;


  StreamSink<String> get firstNameSink => _firstNameController.sink;

  StreamSink<String> get lastNameSink => _lastNameController.sink;

  StreamSink<String> get profileTitleSink => _profileTitleController.sink;

  StreamSink<String> get dobSink => _dobController.sink;

  StreamSink<String> get liveInSink => _liveInController.sink;

  StreamSink<List<DropdownMenuItem<String>>> get countryListSink =>
      _countryListController.sink;

  ProfileBasicDetailsBloc() {
    _countryListController.add(getAllCountries());
  }

  void validateFirstName(String fName) {
    print("first name $fName");
    if (fName.isNotEmpty) {
      firstNameSink.add(fName);
    } else {
      firstNameSink.addError("Enter first name");
    }
  }

  void validateLastName(String lName) {
    if (lName.isNotEmpty) {
      lastNameSink.add(lName);
    } else {
      lastNameSink.addError("Enter last name");
    }
  }

  void validateProfileTitle(String profileTitle) {
    if (profileTitle.isNotEmpty) {
      profileTitleSink.add(profileTitle);
    } else {
      profileTitleSink.addError("Enter profile title");
    }
  }


  void validateLiveIn(String liveIn) {
    if (liveIn.isNotEmpty) {
      liveInSink.add(liveIn);
    } else {
      liveInSink.addError("Enter live in");
    }
  }

  void validateDob(String dob) {
    if (dob.isNotEmpty) {
      dobSink.add(dob);
    } else {
      dobSink.addError("Select date of birth");
    }
  }

  void validateAbout(String about) {
    if (about.isNotEmpty) {
      aboutSink.add(about);
    } else {
      aboutSink.addError("Enter something about you");
    }
  }

  @override
  void dispose() {
    _firstNameController.close();
    _lastNameController.close();
    _profileTitleController.close();
    _dobController.close();
    _liveInController.close();
    _countryListController.close();
    _aboutController.close();
  }

  List<DropdownMenuItem<String>> getAllCountries() {
    List<DropdownMenuItem<String>> items = List();
    items.add(DropdownMenuItem(value: "India", child: Text("India")));
    items.add(DropdownMenuItem(value: "ShriLanka", child: Text("ShriLanka")));
    items.add(DropdownMenuItem(value: "USA", child: Text("USA")));

    return items;
  }
}
