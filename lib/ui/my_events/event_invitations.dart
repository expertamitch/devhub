import 'package:dev_hub/util/common_utils.dart';
import 'package:dev_hub/util/constants.dart';
import 'package:dev_hub/util/data.dart';
import 'package:flutter/material.dart';

class EventInvitations extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _EventInvitationsState();
  }

}
class _EventInvitationsState extends State<EventInvitations>{
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        primary: false,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: events.length,
        itemBuilder: (BuildContext context, int index) {
          Map place = events.reversed.toList()[index];
          return InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("assets/images/blank_ticket.png"),
                        fit: BoxFit.fill)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 12, bottom: 12),
                  child: Row(
                    children: <Widget>[
                      RotatedBox(
                        quarterTurns: 3,
                        child: Container(
                          width: 96,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey[200],
                              shape: BoxShape.rectangle),
                          child: Center(
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
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.asset(
                                        "${place["img"]}",
                                        height: 50,
                                        width: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
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
                                          "${place["location"]}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                          ),
                                          maxLines: 2,
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          "${place["time"]}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                          ),
                                          maxLines: 1,
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(4),
                                height: 40,
                                child: RaisedButton(
                                  onPressed: () {},
                                  color: Constants.buttonColor,
                                  textColor: Colors.white,
                                  child: Text("Enter Event"),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            onTap: () {
              //todo apply on tap
            },
          );
        },
      ),
    );
  }

}