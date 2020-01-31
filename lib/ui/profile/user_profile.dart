import 'package:dev_hub/blocs/user_profile_bloc.dart';
import 'package:dev_hub/ui/profile/edit_profile_basic_details.dart';
import 'package:dev_hub/util/constants.dart';
import 'package:dev_hub/widgets/description_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class UserProfilePage extends StatefulWidget {
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  bool _seeMore = false;
  bool _seeMoreExperienceExpanded = false;
  bool _seeMoreEducationExpanded = false;

  UserProfileBloc bloc;

  @override
  void initState() {
    bloc = UserProfileBloc();
  }

  Widget build(BuildContext cx) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<List<dynamic>>(
          stream: bloc.workExperienceStream,
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            return new ListView(
              children: <Widget>[
                StreamBuilder<Map<dynamic, dynamic>>(
                    stream: bloc.contactInfoStream,
                    builder: (context,
                        AsyncSnapshot<Map<dynamic, dynamic>> profileInfo) {
                      return new Column(
                        children: <Widget>[
                          Container(
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 75),
                                  child: Image.asset(
                                    "assets/images/cover_photo.jpeg",
                                    height: 200,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Container(
                                    height: 150,
                                    width: 150,
                                    decoration: ShapeDecoration(
                                        shape: CircleBorder(),
                                        color: Colors.white),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(75.0),
                                        child: Image.asset(
                                          "assets/images/profile_photo.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20.0, right: 10.0),
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  profileInfo.data["name"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.0),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.blueAccent,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 24.0,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Column(
                              children: <Widget>[
                                getWork(profileInfo),
                                getStudy(profileInfo),
                                Visibility(
                                  visible: _seeMore,
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.home),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            'Lives in',
                                            style: TextStyle(fontSize: 18.0),
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            profileInfo.data["address"]
                                                ["state_and_city"],
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(Icons.location_on),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            'From',
                                            style: TextStyle(fontSize: 18.0),
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            profileInfo.data["address"]
                                                ["location"],
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        seeMore();
                                      },
                                      child: Text(
                                        _seeMore ? 'See Less' : 'See more..',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Constants.lightPrimary),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    RaisedButton.icon(
                                        color: Colors.white70,
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            CupertinoPageRoute(
                                              builder: (BuildContext context) {
                                                return EditProfileBasicDetails();
                                              },
                                            ),
                                          );
                                        },
                                        icon: Icon(Icons.edit,
                                            color: Colors.black),
                                        label: Text('Edit Profile',
                                            style: TextStyle(
                                                color: Colors.black))),
                                  ],
                                ),
                                Divider(
                                  height: 20,
                                  color: Colors.grey.shade200,
                                  thickness: 5,
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'About me',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.start,
                                      ),
                                      SizedBox(height: 5.0),
                                      DescriptionTextWidget(
                                          text: profileInfo.data["desc"]),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey.shade200,
                                  thickness: 5,
                                ),
                                Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Technologies',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(height: 10.0),
                                Container(
                                    child: Wrap(
                                  children: List<Widget>.generate(
                                    snapshot.data.length,
                                    (int index) {
                                      Map place = snapshot.data.reversed
                                          .toList()[index];

                                      return Container(
                                        margin: const EdgeInsets.only(left: 4),
                                        child: Chip(
                                          backgroundColor: Colors.blue,
                                          labelPadding:
                                              const EdgeInsets.fromLTRB(
                                                  8, 4, 8, 4),
                                          label: Text(
                                            place['technologies'][index],
                                            style: Theme.of(context)
                                                .textTheme
                                                .body2
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                      );
                                    },
                                  ).toList(),
                                )),
                                Divider(
                                  height: 40,
                                  color: Colors.grey.shade200,
                                  thickness: 5,
                                ),
                                Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Work Experience',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                getWorkExperience(snapshot),
                                Divider(
                                  height: 40,
                                  color: Colors.grey.shade200,
                                  thickness: 5,
                                ),
                                Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Educational Details',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                getEducationalDetails(snapshot),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Contacts',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () {
                                          launch('https://flutter.dev');
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 4, 8, 4),
                                          child: Container(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                SvgPicture.asset(
                                                  "assets/svg/github.svg",
                                                  height: 14,
                                                  width: 14,
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text('Github'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          launch('https://flutter.dev');
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 4, 8, 4),
                                          child: Container(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                SvgPicture.asset(
                                                  "assets/svg/linked_in.svg",
                                                  height: 14,
                                                  width: 14,
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text('LinkedIn'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          launch('https://flutter.dev');
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 4, 8, 4),
                                          child: Container(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                SvgPicture.asset(
                                                  "assets/svg/stack_overflow.svg",
                                                  height: 14,
                                                  width: 14,
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text('Stackoverflow'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          launch('https://flutter.dev');
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 4, 8, 4),
                                          child: Container(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                SvgPicture.asset(
                                                  "assets/svg/email.svg",
                                                  height: 14,
                                                  width: 14,
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text('Email'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 20.0,
                                  child: Divider(
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                              ],
                            ),
                          )
                        ],
                      );
                    })
              ],
            );
          }),
    );
  }

  getWorkExperience(AsyncSnapshot<List<dynamic>> snapshot) {
    var length = snapshot.data.length > 4
        ? _seeMoreExperienceExpanded ? snapshot.data.length : 4
        : snapshot.data.length;
    return Container(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          primary: false,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: length,
          itemBuilder: (BuildContext context, int index) {
            Map place = snapshot.data.reversed.toList()[index];
            return InkWell(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: ShapeDecoration(
                            shape: CircleBorder(), color: Colors.grey[50]),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(90.0),
                            child: Image.asset(
                              "${place["img"]}",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
//                    ClipRRect(
//                      borderRadius: BorderRadius.circular(10),
//                      child: Image.asset(
//                        "${place["img"]}",
//                        height: 80,
//                        width: 120,
//                        fit: BoxFit.contain,
//                      ),
//                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${place["name"]}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Apr 2017 - Nov 2019",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.blueGrey[300],
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                length - 1 != index
                    ? Container(
                        margin: const EdgeInsets.only(left: 40),
                        alignment: Alignment.centerLeft,
                        height: 40,
                        width: 1,
                        color: Colors.grey[500],
                      )
                    : Container(
                        margin: const EdgeInsets.only(left: 8, bottom: 8),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _seeMoreExperienceExpanded =
                                  !_seeMoreExperienceExpanded;
                            });
                          },
                          child: Text(
                            snapshot.data.length > 4
                                ? _seeMoreExperienceExpanded
                                    ? "See less"
                                    : "See more"
                                : "",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
              ],
            ));
          },
        ));
  }

  getEducationalDetails(AsyncSnapshot<List<dynamic>> snapshot) {
    var length = snapshot.data.length > 4
        ? _seeMoreEducationExpanded ? snapshot.data.length : 4
        : snapshot.data.length;
    return Container(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          primary: false,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: length,
          itemBuilder: (BuildContext context, int index) {
            Map place = snapshot.data.reversed.toList()[index];
            return InkWell(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: ShapeDecoration(
                            shape: CircleBorder(), color: Colors.grey[50]),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(90.0),
                            child: Image.asset(
                              "${place["img"]}",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
//                    ClipRRect(
//                      borderRadius: BorderRadius.circular(10),
//                      child: Image.asset(
//                        "${place["img"]}",
//                        height: 80,
//                        width: 120,
//                        fit: BoxFit.contain,
//                      ),
//                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${place["education"]}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            "Apr 2017 - Nov 2019",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.blueGrey[300],
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                length - 1 != index
                    ? Container(
                        margin: const EdgeInsets.only(left: 40),
                        alignment: Alignment.centerLeft,
                        height: 40,
                        width: 1,
                        color: Colors.grey[500],
                      )
                    : Container(
                        margin: const EdgeInsets.only(left: 8, bottom: 8),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _seeMoreEducationExpanded =
                                  !_seeMoreEducationExpanded;
                            });
                          },
                          child: Text(
                            snapshot.data.length > 4
                                ? _seeMoreEducationExpanded
                                    ? "See less"
                                    : "See more"
                                : "",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
              ],
            ));
          },
        ));
  }

  getStudy(AsyncSnapshot<Map<dynamic, dynamic>> snapshot) {
    List study = snapshot.data["study"] as List;
    return ListView.builder(
        scrollDirection: Axis.vertical,
        primary: false,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: study.length,
        itemBuilder: (BuildContext context, index) {
          return Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.school),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "${study[index]["name"]} at ",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    study[index]["location"],
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              )
            ],
          );
        });
  }

  getWork(AsyncSnapshot<Map<dynamic, dynamic>> snapshot) {
    List jobs = snapshot.data["job"] as List;
    return ListView.builder(
        scrollDirection: Axis.vertical,
        primary: false,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: jobs.length,
        itemBuilder: (BuildContext context, index) {
          return Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.work),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "${jobs[index]["name"]} at ",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "${jobs[index]["location"]}",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              )
            ],
          );
        });
  }

  seeMore() {
    setState(() {
      _seeMore = !_seeMore;
    });
  }
}
