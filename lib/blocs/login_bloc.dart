import 'dart:async';

import 'package:dev_hub/blocs/base_bloc.dart';

class LoginBloc implements BaseBloc{
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  Stream<String> get emailStream => _emailController.stream;

  Stream<String> get passwordStream => _passwordController.stream;

  StreamSink<String> get emailSink => _emailController.sink;

  StreamSink<String> get passwordSink => _passwordController.sink;


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

  void validatePassword(String password) {
    if (password.length > 5) {
      passwordSink.add(password);
    } else {
      passwordSink.addError("Password length must be more than 6");
    }
  }

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
  }

}