import 'package:dev_hub/blocs/sign_up_bloc.dart';
import 'package:dev_hub/ui/logins/login_screen.dart';
import 'package:dev_hub/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../profile/edit_profile_basic_details.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  @override
  void dispose() {
    _signUpBloc?.dispose();
    super.dispose();
  }

  SignUpBloc _signUpBloc;

  @override
  Widget build(BuildContext context) {
    _signUpBloc = SignUpBloc();

    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            FlatButton(
              child: new Text(
                "Log In",
                style: TextStyle(
                    color: Constants.flatButtonTextColor, fontSize: 16),
              ),
              onPressed: toLogin,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              Text(
                "Let's Join Our Community",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 40,
              ),
              StreamBuilder<String>(
                stream: _signUpBloc.emailStream,
                builder: (context, snapshot) =>
                    TextFormField(
                      onChanged: (String email) =>
                          _signUpBloc.validateEmail(email),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          errorText: snapshot.hasError ? snapshot.error : null,
                          border: const OutlineInputBorder(),
                          hintText: "Email",
                          labelText: "Email"),
                    ),
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<String>(
                  stream: _signUpBloc.phoneStream,
                  builder: (context, snapshot) =>
                      TextFormField(
                        onChanged: (String phone) =>
                            _signUpBloc.validatePhone(phone),
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "Phone",
                            labelText: "Phone"),
                      )
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<String>(
                stream: _signUpBloc.passwordStream,
                builder: (context, snapshot) =>
                    TextFormField(
                      onChanged: (String password) =>
                          _signUpBloc.validatePassword(password),
//                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,

                      decoration: InputDecoration(
                          errorText: snapshot.hasError ? snapshot.error : null,
                          border: const OutlineInputBorder(),
                          hintText: "Password",
                          labelText: "Password",
                          suffixIcon: GestureDetector(
                            child: Icon(Icons.remove_red_eye),
                            onTap: _toggle,
                          )),
                      obscureText: eye,
                    ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: StreamBuilder<bool>(
//                    stream: signUpBloc.submitCheck,
                  builder: (context, snapshot) =>
                      RaisedButton(
                          shape: StadiumBorder(),
                          color: Constants.buttonColor,
                          child: Text("Get Started"),
                          textColor: Colors.white,
                          onPressed: snapshot.hasError ? null : submit),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Or",
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Continue using social media",
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: OutlineButton(
                      shape: StadiumBorder(),
                      onPressed: submit,
                      child: Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(FontAwesomeIcons.google),
                              SizedBox(width: 5),
                              Text("Google")
                            ]),
                      ),
                      highlightedBorderColor: Colors.black,
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                      child: OutlineButton(
                        shape: StadiumBorder(),
                        onPressed: submit,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(FontAwesomeIcons.facebookF),
                              SizedBox(width: 5),
                              Text("Facebook")
                            ],
                          ),
                        ),
                        highlightedBorderColor: Colors.black,
                        borderSide: BorderSide(color: Colors.grey),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: OutlineButton(
                      shape: StadiumBorder(),
                      onPressed: submit,
                      child: Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(FontAwesomeIcons.github),
                              SizedBox(width: 5),
                              Text("Github")
                            ]),
                      ),
                      highlightedBorderColor: Colors.black,
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                      child: OutlineButton(
                        shape: StadiumBorder(),
                        onPressed: submit,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(FontAwesomeIcons.stackOverflow),
                              SizedBox(width: 5),
                              Text("StackOverFlow")
                            ],
                          ),
                        ),
                        highlightedBorderColor: Colors.black,
                        borderSide: BorderSide(color: Colors.grey),
                      )),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    OutlineButton(
                      shape: StadiumBorder(),
                      onPressed: submit,
                      child: Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(FontAwesomeIcons.linkedin),
                              SizedBox(width: 5),
                              Text("LinkedIn")
                            ]),
                      ),
                      highlightedBorderColor: Colors.black,
                      borderSide: BorderSide(color: Colors.grey),
                    )
                  ]),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("By continuing you agree to our "),
                  GestureDetector(
                      child: Text("Terms of Use",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          )),
                      onTap: () {})
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("and "),
                  GestureDetector(
                      child: Text("Privacy Policy",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          )),
                      onTap: () {}),
                ],
              ),
            ],
          ),
        ));
  }

  bool eye = true;

  void _toggle() {
    setState(() {
      eye = !eye;
    });
  }

  toLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Login();
        },
      ),
    );
  }

  submit() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return EditProfileBasicDetails();
        },
      ),
    );
  }
}
