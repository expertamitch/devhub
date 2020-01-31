import 'package:dev_hub/blocs/event_details_bloc.dart';
import 'package:dev_hub/util/common_utils.dart';
import 'package:dev_hub/util/constants.dart';
import 'package:dev_hub/util/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

import 'apply_event.dart';

class EventDetails extends StatefulWidget {
  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  EventDetailsBloc _bloc = EventDetailsBloc();
  bool _seeMoreSpeakersExpanded = false;

  bool _seeMoreScheduleExpanded = false;
  int scheduleLength = 0;

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
          stream: _bloc.eventDetailsStream,
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
                        "${snapshot.data["img"]}",
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset(
                            "${snapshot.data["img"]}",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                alignment: Alignment.centerLeft,
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
                              IconButton(
                                icon: Icon(
                                  Icons.share,
                                ),
                                onPressed: () {
                                  Share.share(
                                      'check out my website https://example.com');
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.bookmark,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                size: 14,
                                color: Colors.blueGrey[300],
                              ),
                              SizedBox(width: 3),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${snapshot.data["location"]}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.blueGrey[300],
                                  ),
                                  maxLines: 1,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.calendar_today,
                                size: 14,
                                color: Colors.blueGrey[300],
                              ),
                              SizedBox(width: 3),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${snapshot.data["time"]}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.blueGrey[300],
                                  ),
                                  maxLines: 1,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.blueGrey[200],
                            shape: BoxShape.rectangle),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 12, bottom: 12, left: 4, right: 4),
                          child: Text(
                            CommonUtils.formatDateDayMonth(
                                "${snapshot.data["date"]}"),
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2, top: 8.0),
                  child: Text(
                    snapshot.data['applied']
                        ? snapshot.data['approved']
                            ? 'You are going to this event'
                            : 'Approval pending'
                        : '',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  onPressed: () {
                    applyEvent();
                  },
                  child: Text("Apply Event"),
                  shape: StadiumBorder(),
                  color: Constants.buttonColor,
                  textColor: Colors.white,
                ),
                Divider(
                  height: 20,
                  color: Colors.grey.shade200,
                  thickness: 5,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "About",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "${snapshot.data["details"]}",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 10.0),
                Row(children: [
                  Text(
                    "Schedule -",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    CommonUtils.formatDateWithDayName(
                        "${snapshot.data["date"]}"),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.left,
                  )
                ]),
                SizedBox(height: 10.0),
//                Stepper(
//                  physics: NeverScrollableScrollPhysics(),
//                  steps: getScheduleSteps(),
//                  type: StepperType.vertical,
//                  controlsBuilder: (BuildContext context,
//                          {VoidCallback onStepContinue,
//                          VoidCallback onStepCancel}) =>
//                      Container(
//                    height: 0,
//                  ),
//                ),
//                events.length > 3
//                    ? Container(
//                        margin:
//                            const EdgeInsets.only(left: 8, bottom: 8, top: 4),
//                        child: InkWell(
//                          onTap: () {
//                            setState(() {
//                              _seeMoreScheduleExpanded =
//                                  !_seeMoreScheduleExpanded;
//                            });
//                          },
//                          child: Text(
//                            _seeMoreScheduleExpanded ? "See less" : "See more",
//                            style: TextStyle(
//                                fontWeight: FontWeight.bold,
//                                fontSize: 14,
//                                color: Colors.blue),
//                          ),
//                        ),
//                      )
//                    : Container(),

                getScheduleSteps(),
                Divider(
                  height: 40,
                  color: Colors.grey.shade200,
                  thickness: 5,
                ),
                Text(
                  "Speakers",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 10,
                ),
                getSpeakers(),
                Divider(
                  height: 20,
                  color: Colors.grey.shade200,
                  thickness: 5,
                ),
                Text(
                  "Partners & Sponsers",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10),
                getPartners(),
                Divider(
                  height: 20,
                  color: Colors.grey.shade200,
                  thickness: 5,
                ),
                Text(
                  "Contact the host",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(
                              "${snapshot.data["img"]}",
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 4),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${snapshot.data["name"]}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Text("Contact"),
                      color: Constants.buttonColor,
                      textColor: Colors.white,
                    ),
                  ],
                )
              ],
            );
          }),
    );
  }

//  List<Step> getScheduleSteps() {
//    scheduleLength = events.length > 3
//        ? _seeMoreScheduleExpanded ? events.length : 3
//        : events.length;
//
//    List<Step> scheduleSteps = [];
//
//    for (int i = 0; i < scheduleLength; i++) {
//      Map place = events.reversed.toList()[i];
//
//      scheduleSteps.add(
//        Step(
//            title: Text(place["schedule_time"]),
//            subtitle: Text(place["activity_name"]),
//            isActive: true,
//            content: SizedBox(
//              height: 0,
//            )),
//      );
//    }
//
////    scheduleSteps = [
////      Step(
////          title: Text("4:00PM-5:00PM"),
////          subtitle: Text("Registeration"),
////          isActive: true,
////          content: SizedBox(
////            height: 0,
////          )),
////      Step(
////          title: Text("5:00PM-5:15PM"),
////          subtitle: Text("Welcome Address"),
////          isActive: true,
////          content: SizedBox(
////            height: 0,
////          )),
////      Step(
////          title: Text("5:10PM-7:00PM"),
////          subtitle: Text("Presentation on IO"),
////          isActive: true,
////          content: SizedBox(
////            height: 0,
////          )),
////      Step(
////          title: Text("7:00PM-8:00PM"),
////          subtitle: Text("Award Distribution"),
////          isActive: true,
////          content: SizedBox(
////            height: 0,
////          )),
////      Step(
////          title: Text("8:00PM-9:00PM"),
////          subtitle: Text("Gala Dinner"),
////          isActive: true,
////          content: SizedBox(
////            height: 0,
////          )),
////    ];
//    return scheduleSteps;
//  }

  applyEvent() {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (BuildContext context) {
          return ApplyEvent();
        },
      ),
    );
  }

  getPartners() {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: events.length,
        itemBuilder: (BuildContext context, int index) {
          Map place = events.reversed.toList()[index];
          return InkWell(
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 8, left: 8, top: 4, bottom: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      "${place["img"]}",
                      height: 80,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "${place["name"]}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "${place["name"]}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
            onTap: () {
              //todo apply tap
            },
          );
        },
      ),
    );
  }

  getSpeakers() {
    var length = events.length > 4
        ? _seeMoreSpeakersExpanded ? events.length : 4
        : events.length;

    return ListView.builder(
      scrollDirection: Axis.vertical,
      primary: false,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: length,
      itemBuilder: (BuildContext context, int index) {
        Map place = events.reversed.toList()[index];
        return InkWell(
          child: Padding(
            padding:
                const EdgeInsets.only(right: 8, left: 8, top: 4, bottom: 4),
            child: Container(
              height: 90,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      "${place["img"]}",
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text(
                          "${place["name"]} ",
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text(
                          "${place["name"]} ",
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text(
                          "${place["name"]} ",
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      length - 1 == index && events.length > 4
                          ? Container(
                              margin: const EdgeInsets.only(
                                  left: 8, bottom: 8, top: 4),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _seeMoreSpeakersExpanded =
                                        !_seeMoreSpeakersExpanded;
                                  });
                                },
                                child: Text(
                                  jobsDetails.length > 4
                                      ? _seeMoreSpeakersExpanded
                                          ? "See less"
                                          : "See more"
                                      : "",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.blue),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  )
                ],
              ),
            ),
          ),
          onTap: () {
            //todo apply on tap
          },
        );
      },
    );
  }

  getScheduleSteps() {
    var length = events.length > 2
        ? _seeMoreScheduleExpanded ? events.length : 4
        : events.length;
    return Container(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          primary: false,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: length,
          itemBuilder: (BuildContext context, int index) {
            Map place = events.reversed.toList()[index];
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
                        height: 30,
                        width: 30,
                        decoration: ShapeDecoration(
                            shape: CircleBorder(), color: Colors.blue),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(
                              child: Text(
                            (index + 1).toString(),
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )),
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
                              "${place["schedule_time"]}",
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
                            "${place["activity_name"]}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.grey,
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
                        margin:
                            const EdgeInsets.only(left: 22, top: 4, bottom: 4),
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
                              _seeMoreScheduleExpanded =
                                  !_seeMoreScheduleExpanded;
                            });
                          },
                          child: Text(
                            events.length > 4
                                ? _seeMoreScheduleExpanded
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
}
