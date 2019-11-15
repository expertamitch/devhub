import 'package:dev_hub/ui/logins/sign_up_screen.dart';
import 'package:dev_hub/ui/splash_screen.dart';
import 'package:dev_hub/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'logins/signup.dart';

void main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isDark ? Constants.darkPrimary : Constants.lightPrimary,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.appName,
        theme: isDark ? Constants.darkTheme : Constants.lightTheme,
        home: Splash(),
        routes: <String, WidgetBuilder>{
          '/SignUp': (BuildContext context) => new SignUp()
        });
  }
}
