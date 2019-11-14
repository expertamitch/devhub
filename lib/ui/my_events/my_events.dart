import 'package:dev_hub/ui/my_events/event_invitations.dart';
import 'package:dev_hub/ui/my_events/event_pending.dart';
import 'package:dev_hub/util/constants.dart';
import 'package:flutter/material.dart';

import 'event_going.dart';

class MyEvents extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyEventState();
  }
}

class _MyEventState extends State<MyEvents> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              bottom: TabBar(
                labelPadding: EdgeInsets.all(5),
                unselectedLabelColor: Colors.grey,
                tabs: <Widget>[
                  Tab(text: "Going"),
                  Tab(text: "Invitations"),
                  Tab(text: "Pending")
                ],
                labelColor: Constants.lightPrimary,
                indicatorColor: Constants.lightPrimary,
                labelStyle: TextStyle(
                    color: Constants.lightPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                unselectedLabelStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                EventGoing(),
                EventInvitations(),
                EventPending()
              ],
            )));
  }
}
