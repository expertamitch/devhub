import 'package:dev_hub/blocs/profile_professional_details_bloc.dart';
import 'package:dev_hub/ui/profile/edit_profile_contact_details.dart';
import 'package:dev_hub/util/constants.dart';
import 'package:flutter/material.dart';

class EditProfileProfessionalDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditProfileProfessionalDetailsState();
  }
}

class EditProfileProfessionalDetailsState
    extends State<EditProfileProfessionalDetails> {

  ProfileProfessionDetailsBloc _bloc;
  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    _bloc=ProfileProfessionDetailsBloc();
    return Scaffold(
        appBar: AppBar(title: Text("Professional Details"), centerTitle: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: StreamBuilder<String>(
                            stream: _bloc.jobTitleStream,
                            builder: (context, snapshot) {
                              return TextField(
                                onChanged: (String text) =>
                                    _bloc.validateJobTitle(text),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                   errorText:
                                  snapshot.hasError ? snapshot.error : null,
                                    border: OutlineInputBorder(),
                                    hintText: "Job Title",
                                    labelText: "Job Title"),
                              );
                            }
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: StreamBuilder<String>(
                            stream: _bloc.companyStream,
                            builder: (context, snapshot) {
                              return TextField(
                                onChanged: (String text) =>
                                    _bloc.validateCompany(text),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                   errorText:
                                  snapshot.hasError ? snapshot.error : null,
                                    border: OutlineInputBorder(),
                                    hintText: "Company",
                                    labelText: "Company"),
                              );
                            }
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: StreamBuilder<String>(
                            stream: _bloc.educationStream,
                            builder: (context, snapshot) {
                              return TextField(
                                onChanged: (String text) =>
                                    _bloc.validateEducation(text),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                   errorText:
                                  snapshot.hasError ? snapshot.error : null,
                                    border: OutlineInputBorder(),
                                    hintText: "Education",
                                    labelText: "Education"),
                              );
                            }
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: StreamBuilder<String>(
                            stream: _bloc.collegeStream,
                            builder: (context, snapshot) {
                              return TextField(
                                onChanged: (String text) =>
                                    _bloc.validateCollege(text),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                   errorText:
                                  snapshot.hasError ? snapshot.error : null,
                                    border: OutlineInputBorder(),
                                    hintText: "College",
                                    labelText: "College"),
                              );
                            }
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    StreamBuilder<String>(
                      stream: null,
                      builder: (context, snapshot) {
                        return TextField(
                          onChanged: (String text) =>
                              _bloc.validateAbout(text),
                          minLines: 5,
                          maxLines: 10,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                             errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              border: OutlineInputBorder(),
                              hintText: "About you",
                              labelText: "About you"),
                        );
                      }
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Technologies",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: FloatingActionButton(
                              child: Text("+",style: TextStyle(fontSize: 16,color: Colors.white),),
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(15.0))),
                        ),
                      ],
                    ),

                    RaisedButton(
                        child: Text("e.g. Java"),
                        onPressed: null,
                        textColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))),

//                    Chip()
//                    ,
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
          return EditProfileContactDetails();
        },
      ),
    );
  }
}
