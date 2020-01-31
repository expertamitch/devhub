import 'dart:io';

import 'package:dev_hub/blocs/apply_job_bloc.dart';
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
  final TextEditingController _controller = new TextEditingController();

  ApplyJobBloc bloc;

  @override
  void initState() {
    bloc = ApplyJobBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<List<dynamic>>(
          stream: bloc.applyJobStream,
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            return ListView(
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
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
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
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
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
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
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
                getQuestions(snapshot.data),
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
                _filePath == null || _filePath == ""
                    ? Container()
                    : Text(_filePath),
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
            );
          }),
    );
  }

  getQuestions(List<dynamic> data) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: data.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Container(
                child: data[index]["type"] == "TEXT"
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            data[index]["question"],
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                          TextField(
                            textAlign: TextAlign.justify,
                            decoration: InputDecoration(),
                          ),
                        ],
                      )
                    : data[index]["type"] == "SINGLE_CHOICE"
                        ? Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  data[index]["question"],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 40,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            (data[index]["answer"] as List)
                                                .length,
                                        itemBuilder: (context, ind) {
                                          return Row(
                                            children: <Widget>[
                                              Radio(
                                                  value: ind,
                                                  groupValue: data[index]
                                                      ["choice"] as int,
                                                  onChanged: (v) {
                                                    setState(() {
                                                      data[index]["choice"] = v;
                                                    });
                                                  }),
                                              Text(
                                                data[index]["answer"][ind],
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ],
                                          );
                                        }),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(
                            child: Row(
                              children: <Widget>[
                                Text(
                                  data[index]["question"],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 40,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            (data[index]["answer"] as List)
                                                .length,
                                        itemBuilder: (context, ind) {
                                          return Row(
                                            children: <Widget>[
                                              Checkbox(
                                                value: data[index]["answer"]
                                                            [ind]["checked"] ==
                                                        null
                                                    ? false
                                                    : data[index]["answer"][ind]
                                                        ["checked"],
                                                onChanged: (check) {
                                                  setState(() {
                                                    data[index]["answer"][ind]
                                                        ["checked"] = check;
                                                  });
                                                },
                                              ),
                                              Text(
                                                data[index]["answer"][ind]
                                                    ["name"],
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ],
                                          );
                                        }),
                                  ),
                                )
                              ],
                            ),
                          ),
              ),
              SizedBox(
                height: 8,
              )
            ],
          );
        });
  }

  Future uploadCV() async {
    File file = await FilePicker.getFile();
    print("file .... ${file.path}");
    setState(() {
      _filePath = file.path.toString();
    });
    return file;
  }
}
