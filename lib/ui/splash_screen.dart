import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dev_hub/util/constants.dart';


class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashState();
  }
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: new Center(
        child: new Image.asset(
          'assets/images/logo.jpeg',
          height: 200,
          width: 200,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var _duration = new Duration(seconds: Constants.splash_time);
    return new Timer(_duration, toSignUp);
  }

  void toSignUp() {
    Navigator.of(context).pushReplacementNamed("/SignUp");
  }
}
