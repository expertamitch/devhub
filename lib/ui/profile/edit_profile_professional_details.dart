import 'package:dev_hub/blocs/profile_basic_details_bloc.dart';
import 'package:dev_hub/blocs/profile_professional_details_bloc.dart';
import 'package:dev_hub/models/technology_model.dart';
import 'package:dev_hub/ui/profile/edit_profile_contact_details.dart';
import 'package:dev_hub/util/common_utils.dart';
import 'package:dev_hub/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';

import 'edit_profile_education_details.dart';

class EditProfileProfessionalDetails extends StatefulWidget {
  ProfileBasicDetailsBloc _bloc;

  EditProfileProfessionalDetails(ProfileBasicDetailsBloc bloc) {
    this._bloc = bloc;
  }

  @override
  State<StatefulWidget> createState() {
    return EditProfileProfessionalDetailsState(_bloc);
  }
}

class EditProfileProfessionalDetailsState
    extends State<EditProfileProfessionalDetails> {
  ProfileProfessionDetailsBloc _bloc = ProfileProfessionDetailsBloc();
//  ProfileBasicDetailsBloc _bloc;

  final FocusNode _jobTitleFocus = FocusNode();
  final FocusNode _companyFocus = FocusNode();
  final FocusNode _educationFocus = FocusNode();
  final FocusNode _collegeFocus = FocusNode();
  final FocusNode _aboutFocus = FocusNode();

  EditProfileProfessionalDetailsState(ProfileBasicDetailsBloc bloc) {
//    this._bloc = bloc;
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  final List<String> _jobList = <String>[""];
  final List<String> _technologiesList = <String>[""];

  _addItemJob() {
    setState(() {
      _jobList.add("hello");
    });
  }

  _removeItemJob(int index) {
    setState(() {
      _jobList.removeAt(index);
    });
  }

  _buildRowJob(int index) {
    return Column(
      children: <Widget>[
        index>0?Divider(
          height: 30,
          color: Colors.grey.shade200,
          thickness: 1,
        ):Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Job Title",
                        labelText: "Job Title"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Company",
                        labelText: "Company"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Start Date",
                              labelText: "Start Date"),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "End Date",
                              labelText: "End Date"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
                icon: Icon(Icons.close,color: Colors.grey,size: 18,),
                onPressed: () {
                  _removeItemJob(index);
                })
          ],
        ),

      ],
    );
  }



  _addItemTechnology() {
    setState(() {
      _technologiesList.add("hello");
    });
  }

  _removeItemTechnology(int index) {
    setState(() {
      _technologiesList.removeAt(index);
    });
  }



  _buildRowTechnology(int index) {
    return Column(
      children: <Widget>[
        index>0?Divider(
          height: 30,
          color: Colors.grey.shade200,
          thickness: 1,
        ):Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Technology",
                        ),
                  ),
                ],
              ),
            ),
            IconButton(
                icon: Icon(Icons.close,color: Colors.grey,size: 18,),
                onPressed: () {
                  _removeItemTechnology(index);
                })
          ],
        ),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Professional Details"), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
          child: ListView(physics: ScrollPhysics(), children: <Widget>[
            ListView.builder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: this._jobList.length,
                itemBuilder: (context, index) => this._buildRowJob(index)),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Spacer(),
                RaisedButton(
                  child: Text("Add another"),
                  onPressed: _addItemJob,
                  color: Constants.buttonColor,
                  textColor: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Technologies",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: this._technologiesList.length,
                itemBuilder: (context, index) => this._buildRowTechnology(index)),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Spacer(),
                RaisedButton(
                  child: Text("Add another"),
                  onPressed: _addItemTechnology,
                  color: Constants.buttonColor,
                  textColor: Colors.white,
                ),
              ],
            ),

         /*   StreamBuilder<List<Technology>>(
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
                          ..sort((a, b) =>
                              a.name
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
                }),*/
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
              ],
            )
          ]),
        ));
  }

  void cancel() {
    Navigator.of(context).deactivate();
  }

  void next() {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (BuildContext context) {
          return EditProfileEducationDetails();
        },
      ),
    );
  }
}
