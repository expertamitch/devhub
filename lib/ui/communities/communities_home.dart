import 'package:dev_hub/blocs/community_home_bloc.dart';
import 'package:dev_hub/util/constants.dart';
import 'package:flutter/material.dart';

import 'community_details.dart';

class CommunitiesHome extends StatefulWidget {
  @override
  _CommunitiesHomeState createState() => _CommunitiesHomeState();
}

class _CommunitiesHomeState extends State<CommunitiesHome> {
  final TextEditingController _searchControl = new TextEditingController();
  CommunityHomeBloc _bloc = CommunityHomeBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            getSearch(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Your Communities',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            getYourCommunities(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Popular Communities',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            getPopularCommunities(),
          ],
        ),
      ),
    );
  }

  getSearch() {
    return Padding(
      padding: EdgeInsets.all(20),
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
            hintText: "Search here for events",
            prefixIcon: Icon(
              Icons.calendar_today,
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
    );
  }

  getYourCommunities() {
    return Padding(
      padding: const EdgeInsets.only(left:8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: StreamBuilder<List<dynamic>>(
            stream: _bloc.yourCommunitiesStream,
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              return snapshot.data == null
                  ? Container()
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      primary: false,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        Map place = snapshot.data.reversed.toList()[index];
                        return Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: InkWell(
                            child: Card(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        "${place["img_logo"]}",
                                        height: 80,
                                        width: 150,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                          SizedBox(height: 3),
                                          Text(
                                            "${place["follower_count"]} followers",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Colors.blueGrey[300],
                                            ),
                                            maxLines: 1,
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return CommunityDetails();
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
            }),
      ),
    );
  }

  getPopularCommunities() {
    return Padding(
      padding: const EdgeInsets.only(left:8.0,right: 8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder<List<dynamic>>(
            stream: _bloc.popularCommunitiesStream,
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              return snapshot.data == null
                  ? Container()
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      primary: false,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        Map place = snapshot.data.reversed.toList()[index];
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: InkWell(
                              child: Row(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      "${place["img_logo"]}",
                                      height: 80,
                                      width: 120,
                                      fit: BoxFit.contain,
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
                                        Text(
                                          "${place["follower_count"]} followers",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.blueGrey[300],
                                          ),
                                          maxLines: 1,
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  RaisedButton(
                                    onPressed: () {},
                                    child: Text("Join"),
                                    shape: StadiumBorder(),
                                    color: Constants.buttonColor,
                                    textColor: Colors.white,
                                  )
                                ],
                              ),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return CommunityDetails();
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
      ),
    );
  }
}
