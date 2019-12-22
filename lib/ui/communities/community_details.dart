import 'package:dev_hub/blocs/community_details_bloc.dart';
import 'package:dev_hub/util/common_utils.dart';
import 'package:dev_hub/util/constants.dart';
import 'package:dev_hub/util/data.dart';
import 'package:flutter/material.dart';

class CommunityDetails extends StatefulWidget {
  @override
  _CommunityDetailsState createState() => _CommunityDetailsState();
}

class _CommunityDetailsState extends State<CommunityDetails> {
  var _dropDownMenuItems;

  CommunityDetailsBloc _bloc = CommunityDetailsBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: StreamBuilder<dynamic>(
            stream: _bloc.communityDetailsStream,
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                primary: false,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Image.asset(
                          "${snapshot.data["img_cover"]}",
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: ShapeDecoration(
                              shape: CircleBorder(), color: Colors.grey),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                "${snapshot.data["img_logo"]}",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "${snapshot.data["name"]}",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      PopupMenuButton(
                        child: Card(
                          elevation: 3,
                          color: Constants.buttonColor,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 8, top: 8),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  "${snapshot.data["joining_status"]}" == "true"
                                      ? Icons.done
                                      : Icons.add_box,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                Text(
                                  "${snapshot.data["joining_status"]}" == "true"
                                      ? "Joined"
                                      : "Join",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        itemBuilder: (context) =>
                            "${snapshot.data["joining_status"]}" == "true"
                                ? [
                                    PopupMenuItem(
                                      child: Text("Unfollow"),
                                    ),
                                  ]
                                : [],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "About",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "${snapshot.data["details"]}",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Divider(
                    height: 40,
                    color: Colors.grey.shade200,
                    thickness: 5,
                  ),
                  Text(
                    "Events",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  getEvents(),
                  Divider(
                    height: 40,
                    color: Colors.grey.shade200,
                    thickness: 5,
                  ),
                  Text(
                    "Jobs",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  getJobs()
                ],
              );
            }));
  }

  followUnfollow(value) {}

  Widget _paddingPopup() => PopupMenuButton<int>(
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: Text(
              "English",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: Text(
              "Chinese",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
        elevation: 4,
        padding: EdgeInsets.symmetric(horizontal: 50),
      );

  getEvents() {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: events.length,
        itemBuilder: (BuildContext context, int index) {
          Map place = events.reversed.toList()[index];
          return Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "${place["img"]}",
                              height: 100,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: <Widget>[
                              Column(
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
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "${place["location"]}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.blueGrey[300],
                                      ),
                                      maxLines: 1,
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "${place["time"]}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.blueGrey[300],
                                      ),
                                      maxLines: 1,
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 8),
                              Container(
                                  alignment: Alignment.bottomRight,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      color: Colors.blueGrey[200],
                                      shape: BoxShape.rectangle),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12, bottom: 12, left: 4, right: 4),
                                    child: Text(
                                      CommonUtils.formatDateDayMonth(
                                          "${place["date"]}"),
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                onTap: () {
//                              Navigator.of(context).push(
//                                CupertinoPageRoute(
//                                  builder: (BuildContext context) {
//                                    return CommunityHome();
//                                  },
//                                ),
//                              );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  getJobs() {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        primary: false,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: jobsDetails.length,
        itemBuilder: (BuildContext context, int index) {
          Map place = jobsDetails.reversed.toList()[index];
          return Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "${place["img"]}",
                          height: 80,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
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
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${place["location"]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.blueGrey[300],
                                ),
                                maxLines: 1,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(height: 3),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${place["time"]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.blueGrey[300],
                                ),
                                maxLines: 1,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () {
//                              Navigator.of(context).push(
//                                CupertinoPageRoute(
//                                  builder: (BuildContext context) {
//                                    return CommunityHome();
//                                  },
//                                ),
//                              );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
