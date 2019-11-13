import 'package:dev_hub/util/constants.dart';
import 'package:dev_hub/util/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';

import 'apply_event.dart';

class EventHomePage extends StatefulWidget {
  @override
  _EventHomePageState createState() => _EventHomePageState();
}

class _EventHomePageState extends State<EventHomePage> {
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
      body: ListView(
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
//                    "assets/image_01.png",
                  "${events[0]["img"]}",
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
                  decoration:
                      ShapeDecoration(shape: CircleBorder(), color: Colors.red),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(
                      "assets/images/logo.jpeg",
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
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${events[0]["name"]}",
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
                            "${events[0]["location"]}",
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
                            "${events[0]["time"]}",
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
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.blueGrey[200],
                      shape: BoxShape.rectangle),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12, bottom: 12, left: 4, right: 4),
                    child: Text(
                      formatDate("${events[0]["date"]}"),
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  )),
            ],
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
          SizedBox(height: 20.0),
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
              "${events[0]["details"]}",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
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
              formatDateWithDay("${events[0]["date"]}"),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              maxLines: 1,
              textAlign: TextAlign.left,
            )
          ]),
          SizedBox(height: 10.0),
          Stepper(
            physics: NeverScrollableScrollPhysics(),
            steps: getScheduleSteps(),
            type: StepperType.vertical,
            controlsBuilder: (BuildContext context,
                    {VoidCallback onStepContinue, VoidCallback onStepCancel}) =>
                Container(
              height: 0,
            ),
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
          ListView.builder(
            scrollDirection: Axis.vertical,
            primary: false,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: events.length,
            itemBuilder: (BuildContext context, int index) {
              Map place = events.reversed.toList()[index];
              return InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 8, left: 8, top: 4, bottom: 4),
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
                            Text(
                              "${place["name"]}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              maxLines: 1,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "${place["name"]}",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                              maxLines: 1,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "${place["name"]}",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                              maxLines: 1,
                              textAlign: TextAlign.left,
                            ),
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
          ),
          SizedBox(height: 20),
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
          Container(
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
                    padding: const EdgeInsets.only(
                        right: 8, left: 8, top: 4, bottom: 4),
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
          ),
          SizedBox(height: 20.0),
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
                        "${events[0]["img"]}",
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 4),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${events[0]["name"]}",
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
      ),
    );
  }

  String formatDate(String dateToFormat) {
    return DateFormat("dd MMM")
        .format(DateFormat("dd MMMM yyyy").parse(dateToFormat));
  }

  String formatDateWithDay(String dateToFormat) {
    return DateFormat("EEEE, MMMM dd, yyyy")
        .format(DateFormat("dd MMMM yyyy").parse(dateToFormat));
  }

  List<Step> getScheduleSteps() {
    List<Step> scheduleSteps = [
      Step(
          title: Text("4:00PM-5:00PM"),
          subtitle: Text("Registeration"),
          isActive: true,
          content: SizedBox(
            height: 0,
          )),
      Step(
          title: Text("5:00PM-5:15PM"),
          subtitle: Text("Welcome Address"),
          isActive: true,
          content: SizedBox(
            height: 0,
          )),
      Step(
          title: Text("5:10PM-7:00PM"),
          subtitle: Text("Presentation on IO"),
          isActive: true,
          content: SizedBox(
            height: 0,
          )),
      Step(
          title: Text("7:00PM-8:00PM"),
          subtitle: Text("Award Distribution"),
          isActive: true,
          content: SizedBox(
            height: 0,
          )),
      Step(
          title: Text("8:00PM-9:00PM"),
          subtitle: Text("Gala Dinner"),
          isActive: true,
          content: SizedBox(
            height: 0,
          )),
    ];
    return scheduleSteps;
  }

  applyEvent() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return ApplyEvent();
        },
      ),
    );
  }
}
