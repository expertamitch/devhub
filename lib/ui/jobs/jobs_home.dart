import 'package:dev_hub/blocs/jobs_bloc.dart';
import 'package:dev_hub/ui/jobs/featured_recommended_jobs.dart';
import 'package:dev_hub/ui/jobs/search_jobs.dart';
import 'package:dev_hub/widgets/see_all.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'job_details.dart';

class JobsHome extends StatefulWidget {
  @override
  _JobsHomeState createState() => _JobsHomeState();
}

class _JobsHomeState extends State<JobsHome> {
  final TextEditingController _searchControl = new TextEditingController();

  JobsBloc _recommendedJobsBloc = JobsBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Lets find you \na job.",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          getSearch(),
          SizedBox(height: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Featured',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              getFeatured(),
              Divider(
                height: 20,
                color: Colors.grey.shade200,
                thickness: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Recomended for you',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              getRecommended()
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Divider(
            height: 10,
            color: Colors.grey.shade200,
            thickness: 2,
          ),
          getOther(),
        ],
      ),
    );
  }

  getSearch() {
    return
      Padding(
        padding: EdgeInsets.all(20),
        child: GestureDetector(
          onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context)=>SearchJobs())),
          child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.calendar_today,
                    color: Colors.blueGrey[300],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("E.g: Software Engineer , Intern",style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.blueGrey[300],
                    ),),
                  )
                ],
              )
          ),
        ),
      );


    /*Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: TextField(
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.blueGrey[300],
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            hintText: "E.g: Software Engineer , Intern",
            prefixIcon: Icon(
              Icons.computer,
              color: Colors.blueGrey[300],
            ),
            hintStyle: TextStyle(
              fontSize: 15.0,
              color: Colors.blueGrey[300],
            ),
          ),
          maxLines: 1,
          controller: _searchControl,
        ),
      ),
    );*/
  }

  getFeatured() {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 20),
      height: 250,
//            color: Colors.red,
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder<List<dynamic>>(
          stream: _recommendedJobsBloc.stream,
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            return snapshot.data == null
                ? Container()
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    primary: false,
                    itemCount: snapshot.data.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          margin: const EdgeInsets.only(right: 10),
                          elevation: 3,
                          child: InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 180,
                                width: 180,
                                child: index == snapshot.data.length
                                    ? SeeAll()
                                    : Column(
                                        children: <Widget>[
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                              "${snapshot.data.reversed.toList()[index]["img"]}",
                                              height: 120,
                                              width: 180,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(height: 7),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "${snapshot.data.reversed.toList()[index]["name"]}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                              maxLines: 2,
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "${snapshot.data.reversed.toList()[index]["location"]}",
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
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (BuildContext context) {
                                    return index == snapshot.data.length
                                        ? FeaturedOrRecommendedJobs("0")
                                        : Details();
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
          }),
    );
  }

  getRecommended() {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 20),
      height: 250,
//            color: Colors.red,
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder<List<dynamic>>(
          stream: _recommendedJobsBloc.stream,
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            return snapshot.data == null
                ? Container()
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    primary: false,
                    itemCount: snapshot.data.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          margin: const EdgeInsets.only(right: 10),
                          elevation: 3,
                          child: InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 180,
                                width: 180,
                                child: index == snapshot.data.length
                                    ? SeeAll()
                                    : Column(
                                        children: <Widget>[
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                              "${snapshot.data.reversed.toList()[index]["img"]}",
                                              height: 120,
                                              width: 180,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(height: 7),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "${snapshot.data.reversed.toList()[index]["name"]}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                              maxLines: 2,
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          SizedBox(height: 3),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "${snapshot.data.reversed.toList()[index]["location"]}",
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
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (BuildContext context) {
                                    return index == snapshot.data.length
                                        ? FeaturedOrRecommendedJobs("0")
                                        : Details();
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
          }),
    );
  }

  getOther() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: StreamBuilder<List<dynamic>>(
          stream: _recommendedJobsBloc.stream,
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            return snapshot.data == null
                ? Container()
                : ListView.builder(
                    primary: false,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: InkWell(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.asset(
                                        "${snapshot.data.reversed.toList()[index]["img"]}",
                                        height: 70,
                                        width: 90,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Container(
                                      height: 80,
                                      width: MediaQuery.of(context).size.width -
                                          150,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "${snapshot.data.reversed.toList()[index]["name"]}",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14,
                                                  ),
                                                  maxLines: 2,
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 13,
                                                    color: Colors.blueGrey[300],
                                                  ),
                                                  SizedBox(width: 3),
                                                  Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      "${snapshot.data.reversed.toList()[index]["location"]}",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13,
                                                        color: Colors
                                                            .blueGrey[300],
                                                      ),
                                                      maxLines: 1,
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "${snapshot.data.reversed.toList()[index]["time"]}",
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                              maxLines: 1,
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Divider(
                                  height: 1,
                                  color: Colors.blueGrey,
                                )
                              ],
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
                        ),
                      );
                    },
                  );
          }),
    );
  }
}
