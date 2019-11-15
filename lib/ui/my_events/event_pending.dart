import 'package:dev_hub/util/common_utils.dart';
import 'package:dev_hub/util/constants.dart';
import 'package:dev_hub/util/data.dart';
import 'package:flutter/material.dart';

class EventPending extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _EventPendingState();
  }

}
class _EventPendingState extends State<EventPending>{
  @override
  Widget build(BuildContext context) {
    return Padding(
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        "${place["img"]}",
                        height: 80,
                        width: 100,
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
                            fontSize: 12,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "${place["time"]}",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Container(
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
                  IconButton(icon: Icon(Icons.delete,size: 18,), onPressed: null)
                ],
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