import 'dart:io';

import 'package:dev_hub/util/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ApplyJob extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ApplyJobState();
  }
}

class ApplyJobState extends State<ApplyJob> {
  bool linkedInEditable = false;
  bool gitHubEditable = false;
  bool stackEditable = false;
  String _filePath;
  int _choice = 0;
  bool check1, check2;
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                "assets/images/user_placeholder.jpg",
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Name",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Text(
                  "LinkedIn URL",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextField(
                  textAlign: TextAlign.justify,
                  enabled: linkedInEditable,
                  decoration: InputDecoration(
                    hintText: 'Url',
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Visibility(
                visible: !this.linkedInEditable,
                child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    size: 18.0,
                  ),
                  onPressed: () {
                    this.setState(() {
                      this.linkedInEditable = !this.linkedInEditable;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Text(
                  "GitHub URL",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextField(
                  textAlign: TextAlign.justify,
                  enabled: gitHubEditable,
                  decoration: InputDecoration(
                      hintText: 'Url', disabledBorder: InputBorder.none),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Visibility(
                visible: !this.gitHubEditable,
                child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    size: 18.0,
                  ),
                  onPressed: () {
                    this.setState(() {
                      this.gitHubEditable = !this.gitHubEditable;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                child: Text(
                  "Stack Overflow URL",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextField(
                  textAlign: TextAlign.justify,
                  enabled: stackEditable,
                  decoration: InputDecoration(
                      hintText: 'Url', disabledBorder: InputBorder.none),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Visibility(
                visible: !this.stackEditable,
                child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    size: 18.0,
                  ),
                  onPressed: () {
                    this.setState(() {
                      this.stackEditable = !this.stackEditable;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Question 1",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          TextField(
            textAlign: TextAlign.justify,
            decoration: InputDecoration(),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Question 2",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          TextField(
            textAlign: TextAlign.justify,
            decoration: InputDecoration(),
          ),
          Row(
            children: <Widget>[
              Text(
                "Qusstion 3",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Radio(value: 0, groupValue: _choice, onChanged: _handleChoice),
              Text(
                "Yes",
                style: TextStyle(fontSize: 14),
              ),
              Radio(value: 1, groupValue: _choice, onChanged: _handleChoice),
              Text(
                "No",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                "Qusstion 4",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Checkbox(
                value: check1 == null ? false : check1,
                onChanged: (check) {
                  setState(() {
                    check1 = check;
                  });
                },
              ),
              Text(
                "Option 1",
                style: TextStyle(fontSize: 14),
              ),
              Checkbox(
                value: check2 == null ? false : check2,
                onChanged: (check) {
                  setState(() {
                    check2 = check;
                  });
                },
              ),
              Text(
                "Option 2",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              RaisedButton(
                shape: StadiumBorder(),
                textColor: Colors.white,
                color: Constants.buttonColor,
                onPressed: () {
                  uploadCV();
                },
                child: Text("Upload CV"),
              ),
              Expanded(child: Container())
            ],
          ),
          _filePath == null || _filePath == "" ? Container() : Text(_filePath),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                shape: StadiumBorder(),
                textColor: Colors.white,
                color: Constants.buttonColor,
                onPressed: () {},
                child: Text("Cancel"),
              ),
              RaisedButton(
                shape: StadiumBorder(),
                textColor: Colors.white,
                color: Constants.buttonColor,
                onPressed: () {},
                child: Text("Submit"),
              )
            ],
          )
        ],
      ),
    );
  }

  Future uploadCV() async {
    File file = await FilePicker.getFile();
    print("file .... ${file.path}");
    setState(() {
      _filePath = file.path.toString();
    });
    return file;
  }

  _handleChoice(int value) {
    setState(() {
      _choice = value;
    });
  }
}
