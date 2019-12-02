import 'dart:async';

import 'package:dev_hub/blocs/base_bloc.dart';

class ForgotPasswordBloc implements BaseBloc{
  final _emailController = StreamController<String>();
  Stream<String> get emailStream => _emailController.stream;
  StreamSink<String> get emailSink => _emailController.sink;


  @override
  void dispose() {
    _emailController.close();
  }

  void validateEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (regex.hasMatch(email)) {
      emailSink.add(email);
    } else {
      emailSink.addError("Invalid email.Please enter correct email");
    }
  }
}
