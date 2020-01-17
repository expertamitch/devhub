import 'package:dev_hub/blocs/my_event_bloc.dart';
import 'package:dev_hub/blocs/my_jobs_bloc.dart';
import 'package:dev_hub/ui/jobs/job_details.dart';
import 'package:dev_hub/util/common_utils.dart';
import 'package:dev_hub/util/constants.dart';
import 'package:dev_hub/widgets/search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'apply_job.dart';

class SearchJobs extends StatefulWidget {
//0:upcoming , 1:suggested

  @override
  State<StatefulWidget> createState() => _SearchJobsState();
}

class _SearchJobsState extends State<SearchJobs> {
  String title;

  MyJobsBloc _bloc = MyJobsBloc();

  @override
  void initState() {
    /* if (widget.type == "0") {
      title = "Upcoming events";
    } else {
      title = "Suggested events";
    }*/
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
            title: SearchField(),
            centerTitle: true,
            leading: IconButton(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Icon(
                  Icons.arrow_back,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<List<dynamic>>(
              stream: _bloc.appliedJobsStream,
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                return snapshot.data == null
                    ? Container()
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        primary: false,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          Map place = snapshot.data.reversed.toList()[index];
                          return InkWell(
                            child: Card(
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                            MainAxisAlignment.start,
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
                                          SizedBox(height: 4),
                                          Text(
                                            "${place["location"]}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                            ),
                                            maxLines: 2,
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    MaterialButton(
                                      color: Colors.blueGrey[300],
                                      child: Text(
                                        'Apply',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    ApplyJob()));
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (BuildContext context) {
                                    return Details();
                                  },
                                ),
                              );
                            },
                          );
                        },
                      );
              }),
        ));
  }
}
