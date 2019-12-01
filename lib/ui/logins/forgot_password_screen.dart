import 'package:dev_hub/blocs/forgot_password_bloc.dart';
import 'package:dev_hub/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordState();
  }

}

class _ForgotPasswordState extends State<ForgotPassword>{
 ForgotPasswordBloc _bloc =ForgotPasswordBloc();
 @override
 void dispose() {
   _bloc?.dispose();
   super.dispose();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Text(
                "Forgot Password?",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                textAlign:TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Please enter your registered email address",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<String>(
                stream: _bloc.emailStream,
                builder: (context, snapshot) => TextFormField(
                  onChanged: (String email) => _bloc.validateEmail(email),
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
              SizedBox(
                width: double.infinity,
                height: 40,
                child: StreamBuilder<bool>(
//                    stream: _loginBloc.submitCheck,
                  builder: (context, snapshot) =>
                      RaisedButton(
                          shape: StadiumBorder(),
                          color: Constants.buttonColor,
                          child: Text("Submit"),
                          textColor: Colors.white,
                          onPressed: snapshot.hasError ? null : submit),
                ),
              ),
              FlatButton(
                child: Text(
                  "Back to Login",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                      color: Constants.flatButtonTextColor, fontSize: 16,),
                ),
                shape: StadiumBorder(),
                onPressed: toLogin,
              )
            ],
          ),
        ),
      ),

    );
  }
 submit() {
   Navigator.of(context).pop();
 }
 toLogin() {
   Navigator.of(context).pop();
 }
}