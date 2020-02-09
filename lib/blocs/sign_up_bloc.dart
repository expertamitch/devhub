import 'dart:async';

import 'package:dev_hub/blocs/base_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class SignUpBloc implements BaseBloc {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();
  final _phoneController = StreamController<String>();

  Stream<String> get emailStream => _emailController.stream;

  Stream<String> get passwordStream => _passwordController.stream;

  Stream<String> get phoneStream => _phoneController.stream;

  StreamSink<String> get emailSink => _emailController.sink;

  StreamSink<String> get passwordSink => _passwordController.sink;

  StreamSink<String> get phoneSink => _phoneController.sink;

  Stream<bool> get submitCheck => Observable.combineLatest2(
      emailStream.asBroadcastStream(),
      passwordStream.asBroadcastStream(),
      (e, p) => true);

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
    _phoneController.close();
  }

  void validateEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (email == null) {
      emailSink.addError("Invalid email.Please enter correct email");
    } else if (regex.hasMatch(email)) {
      emailSink.add(email);
    } else {
      emailSink.addError("Invalid email.Please enter correct email");
    }
  }

  bool isValidEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (regex.hasMatch(email)) {
      emailSink.add(email);
      return true;
    } else {
      emailSink.addError("Invalid email.Please enter correct email");

      return false;
    }
  }

  void validatePassword(String password) {
    if (password.length > 5) {
      passwordSink.add(password);
    } else {
      passwordSink.addError("Password length must be more than 6");
    }
  }

  bool isValidPassword(String password) {
    if (password.length > 5) {
      passwordSink.add(password);
      return true;
    } else {
      passwordSink.addError("Password length must be more than 6");
      return false;
    }
  }

  void validatePhone(String phone) {
    if (phone.length == 10) {
      phoneSink.add(phone);
    } else {
      phoneSink.addError("Invalid phone number");
    }
  }

  bool isValidPhone(String phone) {
    if (phone.length == 10) {
      phoneSink.add(phone);
      return true;
    } else {
      phoneSink.addError("Invalid phone number");
      return false;
    }
  }
}
