import 'package:dev_hub/ui/my_events/event_invitations.dart';
import 'package:dev_hub/ui/my_events/event_pending.dart';
import 'package:dev_hub/ui/my_jobs/saved_jobs.dart';
import 'package:dev_hub/util/constants.dart';
import 'package:flutter/material.dart';

import 'applied_jobs.dart';

class MyJobs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyJobState();
  }
}

class _MyJobState extends State<MyJobs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text("My Jobs"), centerTitle: true,
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
                  Tab(text: "Applied Jobs"),
                  Tab(text: "Saved"),
                ],
                labelColor: Constants.lightPrimary,
                labelStyle: TextStyle(
                    color: Constants.lightPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                unselectedLabelStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
                indicatorColor: Constants.lightPrimary,

              ),
            ),
            body: TabBarView(
              children: <Widget>[AppliedJobs(), SavedJobs()],
            )));
  }
}
