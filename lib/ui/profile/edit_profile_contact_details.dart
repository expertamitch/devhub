import 'package:dev_hub/blocs/profile_contact_details_bloc.dart';
import 'package:dev_hub/ui/main_screen.dart';
import 'package:dev_hub/util/common_utils.dart';
import 'package:dev_hub/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class EditProfileContactDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditProfileContactDetailsState();
  }
}

class EditProfileContactDetailsState extends State<EditProfileContactDetails> {
  ProfileContactDetailsBloc _bloc = ProfileContactDetailsBloc();
  final FocusNode _linkedInFocus = FocusNode();
  final FocusNode _gitHubFocus = FocusNode();
  final FocusNode _stackFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _contactFocus = FocusNode();
  final FocusNode _nicNumFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Contact Details"), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
          child: Form(
            key: _formKey,
            child: ListView(physics: ScrollPhysics(), children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.next,
                focusNode: _linkedInFocus,
                onFieldSubmitted: (term) {
                  CommonUtils.fieldFocusChange(
                      context, _linkedInFocus, _gitHubFocus);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "LinkedIn Profile Url",
                    labelText: "LinkedIn Profile"),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.next,
                focusNode: _gitHubFocus,
                onFieldSubmitted: (term) {
                  CommonUtils.fieldFocusChange(
                      context, _gitHubFocus, _stackFocus);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "GitHub Profile Url",
                    labelText: "GitHub Profile"),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.next,
                focusNode: _stackFocus,
                onFieldSubmitted: (term) {
                  CommonUtils.fieldFocusChange(
                      context, _stackFocus, _emailFocus);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "StackOverFlow Profile Url",
                    labelText: "StackOverFlow Profile"),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return 'Should not be empty';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                focusNode: _emailFocus,
                onFieldSubmitted: (term) {
                  CommonUtils.fieldFocusChange(
                      context, _emailFocus, _contactFocus);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email address",
                    labelText: "Email address"),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return 'Should not be empty';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                focusNode: _contactFocus,
                onFieldSubmitted: (term) {
                  CommonUtils.fieldFocusChange(
                      context, _contactFocus, _nicNumFocus);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Contact Number",
                    labelText: "Contact Number"),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return 'Should not be empty';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                focusNode: _nicNumFocus,
                onFieldSubmitted: (term) {
                  _nicNumFocus.unfocus();
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Add your NIC or Passport number",
                    labelText: "NIC/Passport number"),
              ),
              SizedBox(
                height: 20,
              ),
              Row(children: <Widget>[
                Expanded(
                    child: RaisedButton(
                  shape: StadiumBorder(),
                  color: Constants.buttonColor,
                  onPressed: cancel,
                  textColor: Colors.white,
                  child: Text(
                    "Previous",
                  ),
                )),
                SizedBox(width: 20),
                Expanded(
                    child: RaisedButton(
                  shape: StadiumBorder(),
                  color: Constants.buttonColor,
                  onPressed: next,
                  textColor: Colors.white,
                  child: Text(
                    "Next",
                  ),
                )),
              ]),
            ]),
          ),
        ));
  }

  void cancel() {
    Navigator.of(context).pop();
  }

  void next() {
    if (!_formKey.currentState.validate())
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (BuildContext context) {
            return MainScreen();
          },
        ),
      );
  }
}
