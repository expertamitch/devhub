import 'package:dev_hub/blocs/my_jobs_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeaturedOrRecommendedJobs extends StatefulWidget {
//  0: featured, 1: recommended

  String type;

  FeaturedOrRecommendedJobs(this.type);

  @override
  State<StatefulWidget> createState() => _FeaturedOrRecommendedJobsState();
}

class _FeaturedOrRecommendedJobsState extends State<FeaturedOrRecommendedJobs> {
  MyJobsBloc _bloc = MyJobsBloc();
  String title;

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.type == "0")
      title = "Featured Jobs";
    else
      title = "Recommended Jobs";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
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
                                      onPressed: () {},
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
              }),
        ));
  }
}
