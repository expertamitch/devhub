import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dev_hub/blocs/profile_basic_details_bloc.dart';
import 'package:dev_hub/util/common_utils.dart';
import 'package:dev_hub/util/constants.dart';
import 'package:dev_hub/util/disabled_focus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'edit_profile_professional_details.dart';

class EditProfileBasicDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EditProfileBasicDetailsState();
  }
}

class EditProfileBasicDetailsState extends State<EditProfileBasicDetails> {
  int _gender = 0;

  Country _country;

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  ProfileBasicDetailsBloc _bloc = ProfileBasicDetailsBloc();

  DateTime selectedDate = DateTime.now();
  var selectedDob = TextEditingController();
  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();
  final FocusNode _profileTitleFocus = FocusNode();
  final FocusNode _liveInFocus = FocusNode();
  final FocusNode _aboutFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  File _image;

  Future _getViaGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future _getViaCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  void _showImagePickOptionDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select via"),
          actions: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: FlatButton(
                  child: new Text(
                    "Cancel",
                    textAlign: TextAlign.start,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ),
            // usually buttons at the bottom of the dialog
            FlatButton(
                child: new Text("Camera"),
                onPressed: () {
                  Navigator.of(context).pop();
                  _getViaCamera();
                }),
            FlatButton(
                child: new Text("Gallery"),
                onPressed: () {
                  Navigator.of(context).pop();
                  _getViaGallery();
                }),
          ],
        );
      },
    );
  }

  Future<Null> _selectDate() async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1920, 1),
        lastDate: DateTime.now());

    if (picked != null)
      setState(() {
        selectedDate = picked;
        selectedDob.text =
            "${selectedDate.toLocal().day}-${selectedDate.toLocal().month}-${selectedDate.toLocal().year}";
      });
  }

  @override
  void initState() {
    _country = Country(
        asset: "assets/flags/lk_flag.png",
        currency: "Sri Lankan rupee",
        currencyISO: "LKR",
        dialingCode: "94",
        isoCode: "LK",
        name: "Sri Lanka");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Profile Setup"), centerTitle: true),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(children: <Widget>[
              Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: _image == null
                        ? Image.asset(
                            "assets/images/user_placeholder.jpg",
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            _image,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          )),
              ),
              FlatButton(
                onPressed: _showImagePickOptionDialog,
                child: Text(
                  "Upload Profile photo",
                  style: TextStyle(fontSize: 16),
                ),
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
                focusNode: _firstNameFocus,
                onFieldSubmitted: (term) {
                  CommonUtils.fieldFocusChange(
                      context, _firstNameFocus, _lastNameFocus);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "First Name",
                    labelText: "First Name"),
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
                focusNode: _lastNameFocus,
                onFieldSubmitted: (term) {
                  CommonUtils.fieldFocusChange(
                      context, _lastNameFocus, _profileTitleFocus);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Last Name",
                    labelText: "Last Name"),
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
                focusNode: _profileTitleFocus,
                onFieldSubmitted: (term) {
                  _profileTitleFocus.unfocus();
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Profile Title",
                    labelText: "Profile Title"),
              ),
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
                        errorText: snapshot.hasError ? snapshot.error : null,
                        border: OutlineInputBorder(),
                        hintText: "Date of Birth",
                        labelText: "Date of Birth",
                      ),
                    );
                  }),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Gender :",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Radio(
                      value: 0, groupValue: _gender, onChanged: _handleGender),
                  Text(
                    "Male",
                    style: TextStyle(fontSize: 14),
                  ),
                  Radio(
                      value: 1, groupValue: _gender, onChanged: _handleGender),
                  Text(
                    "Female",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Country :",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CountryPicker(
                    dense: false,
                    showFlag: true,
                    //displays flag, true by default
                    showDialingCode: false,
                    //displays dialing code, false by default
                    showName: true,
                    //displays country name, true by default
                    showCurrency: false,
                    //eg. 'British pound'
                    showCurrencyISO: false,
                    //eg. '
                    // GBP'
                    onChanged: (Country country) {
                      setState(() {
//                      assets/flags/ag_flag.png
//                      Sri Lanka

                        print(country.asset);
                        print(country.name);
                        print(country.currencyISO);
                        print(country.dialingCode);
                        print(country.isoCode);
                        _country = country;
                      });
                    },
                    selectedCountry: _country,
                  ),

//                CountryCodePicker(
//                  onChanged: print,
//                  initialSelection: '+94',
//                  favorite: ['+94'],
//                  showOnlyCountryWhenClosed: true,
//                  alignLeft: false,
//                ),
                ],
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
                focusNode: _liveInFocus,
                onFieldSubmitted: (term) {
                  CommonUtils.fieldFocusChange(
                      context, _liveInFocus, _aboutFocus);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Live in",
                    labelText: "Live in"),
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<String>(
                  stream: _bloc.aboutStream,
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
              Container(
                width: 150,
                child: RaisedButton(
                  shape: StadiumBorder(),
                  color: Constants.buttonColor,
                  onPressed: next,
                  textColor: Colors.white,
                  child: Text(
                    "Next",
                  ),
                ),
              ),
            ]),
          ),
        ));
  }

  void _handleGender(int value) {
    setState(() {
      _gender = value;
    });
  }

//  void changedDropDownItem(String selectedCountry) {
//    setState(() {
//      _country = selectedCountry;
//    });
//  }

  void cancel() {}

  void next() {
    if (!(_formKey.currentState.validate() && _image != null))
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (BuildContext context) {
            return EditProfileProfessionalDetails(_bloc);
          },
        ),
      );
  }
}
