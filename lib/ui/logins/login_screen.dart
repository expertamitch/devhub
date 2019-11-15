import 'package:dev_hub/blocs/login_bloc.dart';
import 'package:dev_hub/ui/profile/edit_profile_basic_details.dart';
import 'package:dev_hub/ui/logins/sign_up_screen.dart';
import 'package:dev_hub/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  LoginBloc _loginBloc;
  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _loginBloc = LoginBloc();
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
              onPressed: toSignUp,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Let's Join Our Community",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  StreamBuilder<String>(
                    stream: _loginBloc.emailStream,
                    builder: (context, snapshot) => TextField(
                      onChanged: (String email) =>
                          _loginBloc.validateEmail(email),
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
                    stream: _loginBloc.passwordStream,
                    builder: (context, snapshot) => TextField(
                      onChanged: (String password) =>
                          _loginBloc.validatePassword(password),
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
                    height: 10,
                  ),
                  FlatButton(
                    onPressed: submit,
                    child: Text("Forgot Password?"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: StreamBuilder<bool>(
//                    stream: _loginBloc.submitCheck,
                      builder: (context, snapshot) => RaisedButton(
                          shape: StadiumBorder(),
                          color: Constants.buttonColor,
                          child: Text("Login"),
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
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Continue using social media",
                    style: TextStyle(fontSize: 14),
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
                      Text("By signing up you agree to our "),
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
                ]),
          ),
        ));
  }

  bool eye = true;

  void _toggle() {
    setState(() {
      eye = !eye;
    });
  }

  toSignUp() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return SignUp();
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
