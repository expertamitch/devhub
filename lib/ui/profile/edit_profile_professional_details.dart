import 'package:dev_hub/blocs/profile_professional_details_bloc.dart';
import 'package:dev_hub/models/technology_model.dart';
import 'package:dev_hub/ui/profile/edit_profile_contact_details.dart';
import 'package:dev_hub/util/common_utils.dart';
import 'package:dev_hub/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';

class EditProfileProfessionalDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditProfileProfessionalDetailsState();
  }
}

class EditProfileProfessionalDetailsState
    extends State<EditProfileProfessionalDetails> {
  ProfileProfessionDetailsBloc _bloc = ProfileProfessionDetailsBloc();

  final FocusNode _jobTitleFocus = FocusNode();
  final FocusNode _companyFocus = FocusNode();
  final FocusNode _educationFocus = FocusNode();
  final FocusNode _collegeFocus = FocusNode();
  final FocusNode _aboutFocus = FocusNode();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Professional Details"), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.only(left:20.0,right: 20,top: 20),
          child:
              ListView(physics: ScrollPhysics(), children: <
                  Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: StreamBuilder<String>(
                      stream: _bloc.jobTitleStream,
                      builder: (context, snapshot) {
                        return TextFormField(
                          onChanged: (String text) =>
                              _bloc.validateJobTitle(text),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          focusNode: _jobTitleFocus,
                          onFieldSubmitted: (term) {
                            CommonUtils.fieldFocusChange(
                                context, _jobTitleFocus, _companyFocus);
                          },
                          decoration: InputDecoration(
                              errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              border: OutlineInputBorder(),
                              hintText: "Job Title",
                              labelText: "Job Title"),
                        );
                      }),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: StreamBuilder<String>(
                      stream: _bloc.companyStream,
                      builder: (context, snapshot) {
                        return TextFormField(
                          onChanged: (String text) =>
                              _bloc.validateCompany(text),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          focusNode: _companyFocus,
                          onFieldSubmitted: (term) {
                            CommonUtils.fieldFocusChange(
                                context, _companyFocus, _educationFocus);
                          },
                          decoration: InputDecoration(
                              errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              border: OutlineInputBorder(),
                              hintText: "Company",
                              labelText: "Company"),
                        );
                      }),
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
                        return TextFormField(
                          onChanged: (String text) =>
                              _bloc.validateEducation(text),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          focusNode: _educationFocus,
                          onFieldSubmitted: (term) {
                            CommonUtils.fieldFocusChange(
                                context, _educationFocus, _collegeFocus);
                          },
                          decoration: InputDecoration(
                              errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              border: OutlineInputBorder(),
                              hintText: "Education",
                              labelText: "Education"),
                        );
                      }),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: StreamBuilder<String>(
                      stream: _bloc.collegeStream,
                      builder: (context, snapshot) {
                        return TextFormField(
                          onChanged: (String text) =>
                              _bloc.validateCollege(text),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          focusNode: _collegeFocus,
                          onFieldSubmitted: (term) {
                            CommonUtils.fieldFocusChange(
                                context, _collegeFocus, _aboutFocus);
                          },
                          decoration: InputDecoration(
                              errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              border: OutlineInputBorder(),
                              hintText: "College",
                              labelText: "College"),
                        );
                      }),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            StreamBuilder<String>(
                stream: null,
                builder: (context, snapshot) {
                  return TextFormField(
                    onChanged: (String text) => _bloc.validateAbout(text),
                    minLines: 5,
                    maxLines: 10,
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.done,
                    focusNode: _aboutFocus,
                    onFieldSubmitted: (term) {
                      _aboutFocus.unfocus();
                    },
                    decoration: InputDecoration(
                        errorText: snapshot.hasError ? snapshot.error : null,
                        border: OutlineInputBorder(),
                        hintText: "About you",
                        labelText: "About you"),
                  );
                }),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Text(
                  "Technologies",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 30,
                  height: 30,
                  child: FloatingActionButton(
                      child: Text(
                        "+",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0))),
                ),
              ],
            ),
            StreamBuilder<List<Technology>>(
                stream: _bloc.technologyListStream,
                builder: (context, AsyncSnapshot<List<Technology>> snapshot) {
                  return ChipsInput(
                    decoration: InputDecoration(
                      labelText: "e.g. Java",
                    ),
                    maxChips: 5,
                    findSuggestions: (String query) {
                      if (query.length != 0) {
                        var lowercaseQuery = query.toLowerCase();
                        return snapshot.data.where((technology) {
                          return technology.name
                              .toLowerCase()
                              .contains(query.toLowerCase());
                        }).toList(growable: false)
                          ..sort((a, b) => a.name
                              .toLowerCase()
                              .indexOf(lowercaseQuery)
                              .compareTo(b.name
                                  .toLowerCase()
                                  .indexOf(lowercaseQuery)));
                      } else {
                        return const <String>[];
                      }
                    },
                    onChanged: (data) {
                      print(data);
                    },
                    chipBuilder: (context, state, technology) {
                      return InputChip(
                        key: ObjectKey(technology),
                        label: Text(
                          technology.name,
                          style: TextStyle(color: Colors.black),
                        ),
                        onDeleted: () => state.deleteChip(technology),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      );
                    },
                    suggestionBuilder: (context, state, technology) {
                      return ListTile(
                        key: ObjectKey(technology),
                        title: Text(technology.name),
                        onTap: () => state.selectSuggestion(technology),
                      );
                    },
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
        ));
  }

  void cancel() {
    Navigator.of(context).pop();
  }

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
