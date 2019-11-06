import 'dart:io';

import 'package:dev_hub/blocs/profile_basic_details_bloc.dart';
import 'package:dev_hub/util/constants.dart';
import 'package:dev_hub/util/disabled_focus.dart';
import 'package:flutter/material.dart';

import 'edit_profile_professional_details.dart';

class EditProfileBasicDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditProfileBasicDetailsState();
  }
}

class EditProfileBasicDetailsState extends State<EditProfileBasicDetails> {
  int _gender = 0;
  var _country = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  ProfileBasicDetailsBloc _bloc;
  Future<File> profilePic;

  DateTime selectedDate = DateTime.now();
  var selectedDob = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _bloc = ProfileBasicDetailsBloc();

    Future<Null> _selectDate() async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(1920, 1),
          lastDate: DateTime.now());

      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
          selectedDob.text =
              "${selectedDate.toLocal().day}-${selectedDate.toLocal().month}-${selectedDate.toLocal().year}";
        });
    }

    return Scaffold(
        appBar: AppBar(title: Text("Profile Setup"), centerTitle: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Stack(children: [
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey,
                        child: Image.asset(
                          "assets/images/user_placeholder.jpg",
                          height: 100,
                          width: 100,
                        ),
                      ),
                      Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      "https://i.imgur.com/BoN9kdC.png")))),
                    ]),
                    FlatButton(
                      onPressed: null,
                      child: Text(
                        "Upload Profile photo",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    StreamBuilder<String>(
                        stream: _bloc.firstNameStream,
                        builder: (context, snapshot) {
                          return TextField(
                            onChanged: (String fName) =>
                                _bloc.validateFirstName(fName),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                errorText:
                                    snapshot.hasError ? snapshot.error : null,
                                border: OutlineInputBorder(),
                                hintText: "First Name",
                                labelText: "First Name"),
                          );
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    StreamBuilder<String>(
                        stream: _bloc.lastNameStream,
                        builder: (context, snapshot) {
                          return TextField(
                            onChanged: (String lName) =>
                                _bloc.validateLastName(lName),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                errorText:
                                    snapshot.hasError ? snapshot.error : null,
                                border: OutlineInputBorder(),
                                hintText: "Last Name",
                                labelText: "Last Name"),
                          );
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    StreamBuilder<String>(
                        stream: _bloc.profileTitleStream,
                        builder: (context, snapshot) {
                          return TextField(
                            onChanged: (String title) =>
                                _bloc.validateProfileTitle(title),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                errorText:
                                    snapshot.hasError ? snapshot.error : null,
                                border: OutlineInputBorder(),
                                hintText: "Profile Title",
                                labelText: "Profile Title"),
                          );
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    StreamBuilder<String>(
                        stream: _bloc.dobStream,
                        builder: (context, snapshot) {
                          return TextField(
                            onTap: _selectDate,
                            onChanged: (String dob) => _bloc.validateDob(dob),
                            focusNode: AlwaysDisabledFocusNode(),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            controller: selectedDob,
                            decoration: InputDecoration(
                              errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              border: OutlineInputBorder(),
                              hintText: "Date of Birth",
                              labelText: "Date of Birth",
                            ),
                          );
                        }),
                    Row(
                      children: <Widget>[
                        Text(
                          "Gender :",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Radio(
                            value: 0,
                            groupValue: _gender,
                            onChanged: _handleGender),
                        Text(
                          "Male",
                          style: TextStyle(fontSize: 14),
                        ),
                        Radio(
                            value: 1,
                            groupValue: _gender,
                            onChanged: _handleGender),
                        Text(
                          "Female",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Country :",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        /*  StreamBuilder<List<DropdownMenuItem<String>>>(
                            stream: _bloc.countryListStream,
                            builder: (context,
                                AsyncSnapshot<List<DropdownMenuItem<String>>>
                                    snapshot) {
                              return DropdownButton(
                                  value: _country,
                                  items:
                                      snapshot.hasError ? null : snapshot.data,
                                  onChanged: changedDropDownItem);
                            })*/
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    StreamBuilder<String>(
                        stream: _bloc.liveInStream,
                        builder: (context, snapshot) {
                          return TextField(
                            onChanged: (String liveIn) =>
                                _bloc.validateLiveIn(liveIn),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                errorText:
                                    snapshot.hasError ? snapshot.error : null,
                                border: OutlineInputBorder(),
                                hintText: "Live in",
                                labelText: "Live in"),
                          );
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: RaisedButton(
                          shape: StadiumBorder(),
                          color: Constants.buttonColor,
                          onPressed: cancel,
                          textColor: Colors.white,
                          child: Text(
                            "Cancel",
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
                      ],
                    )
                  ]),
            ),
          ),
        ));
  }

  void _handleGender(int value) {
    setState(() {
      _gender = value;
    });
  }

  void changedDropDownItem(String selectedCountry) {
    setState(() {
      _country = selectedCountry;
    });
  }

  void cancel() {}

  void next() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return EditProfileProfessionalDetails();
        },
      ),
    );
  }
}
