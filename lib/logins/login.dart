import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'signup.dart';

class SecondRoute extends StatefulWidget {
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  bool eye = true;

  void _toggle() {
    setState(() {
      eye = !eye;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      appBar:  AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
           Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 20, 0),
            child:  FlatButton(
              child: Text(
                "Sign up",
                style:  TextStyle(color: Colors.grey, fontSize: 17),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              highlightColor: Colors.black,
              shape: StadiumBorder(),
            ),
          ),
        ],
      ),
      body:  SingleChildScrollView(
        child:  Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
               Text(
                "Log in",
                style:  TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
              ),
               SizedBox(
                height: 70,
              ),
               TextField(
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                decoration:  InputDecoration(
                  // hintText: "Email",
                  labelText: "Email",
                ),
              ),
               SizedBox(
                height: 30,
              ),
               TextField(
                keyboardType: TextInputType.text,
                autocorrect: false,
                decoration:  InputDecoration(
                  labelText: "Password",
                  suffixIcon:  GestureDetector(
                    child:  Icon(
                      Icons.remove_red_eye,
                    ),
                    onTap: _toggle,
                  ),
                ),
                obscureText: eye,
              ),
               SizedBox(
                height: 30,
              ),
               SizedBox(
                height: 50,
                child:  RaisedButton(
                  child:  Text("Log in",
                      style:  TextStyle(color: Colors.white)),
                  color: Colors.blue,
                  elevation: 15.0,
                  shape: StadiumBorder(),
                  splashColor: Colors.white54,
                  onPressed: () {},
                ),
              ),
               Container(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child:  Text(
                  "Or sign in with social account",
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    width: 165,
                    child:  OutlineButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.facebookF,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Facebook",
                              style: new TextStyle(color: Colors.black)),
                        ],
                      ),
                      shape: StadiumBorder(),
                      highlightedBorderColor: Colors.black,
                      borderSide: BorderSide(color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: 165,
                    child:  OutlineButton(
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.google,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Google",
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                      shape: StadiumBorder(),
                      highlightedBorderColor: Colors.black,
                      borderSide: BorderSide(color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    width: 165,
                    child:  OutlineButton(
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.github,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("GitHub",
                              style:  TextStyle(color: Colors.black)),
                        ],
                      ),
                      shape: StadiumBorder(),
                      highlightedBorderColor: Colors.black,
                      borderSide: BorderSide(color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: 165,
                    child:  OutlineButton(
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.stackOverflow,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("StackOverFlow",
                              style:  TextStyle(color: Colors.black)),
                        ],
                      ),
                      shape: StadiumBorder(),
                      highlightedBorderColor: Colors.black,
                      borderSide: BorderSide(color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    width: 165,
                    child:  OutlineButton(
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.linkedin,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("LinkedIn",
                              style:  TextStyle(color: Colors.black)),
                        ],
                      ),
                      shape: StadiumBorder(),
                      highlightedBorderColor: Colors.black,
                      borderSide: BorderSide(color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),

                ],
              ),
               SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}