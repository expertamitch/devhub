import 'package:dev_hub/blocs/profile_contact_details_bloc.dart';
import 'package:dev_hub/ui/main_screen.dart';
import 'package:dev_hub/util/constants.dart';
import 'package:flutter/material.dart';

class EditProfileContactDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditProfileContactDetailsState();
  }
}

class EditProfileContactDetailsState extends State<EditProfileContactDetails> {
  ProfileContactDetailsBloc _bloc;
  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = ProfileContactDetailsBloc();
    return Scaffold(
        appBar: AppBar(title: Text("Contact Details"), centerTitle: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "LinkedIn Profile Url",
                          labelText: "LinkedIn Profile"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "GitHub Profile Url",
                          labelText: "GitHub Profile"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "StackOverFlow Profile Url",
                          labelText: "StackOverFlow Profile"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Email address",
                          labelText: "Email address"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Contact Number",
                          labelText: "Contact Number"),
                    ),
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

  void cancel() {}

  void next() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return MainScreen();
        },
      ),
    );
  }
}
