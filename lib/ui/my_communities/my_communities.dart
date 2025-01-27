import 'package:dev_hub/blocs/community_home_bloc.dart';
import 'package:dev_hub/ui/communities/community_details.dart';
import 'package:dev_hub/util/constants.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class MyCommunities extends StatefulWidget {
//  0:popular, 1: my communities

  String type;

  MyCommunities(this.type);

  @override
  State<StatefulWidget> createState() {
    return _MyCommunitiesState();
  }
}

class _MyCommunitiesState extends State<MyCommunities> {
  CommunityHomeBloc _bloc = CommunityHomeBloc();
  String title;

  @override
  void initState() {
    if (widget.type == "0") {
      title = "Popular Communities";
    } else {
      title = "My Communities";
    }
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
          title: Text(title),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.pop(context),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: getYourCommunities(),
      ),
    );
  }

  getYourCommunities() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder<List<dynamic>>(
            stream: _bloc.yourCommunitiesStream,
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
                          elevation: 3,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                  widget.type == "0"
                                      ? RaisedButton(
                                          onPressed: () {},
                                          child: Text("Join"),
                                          shape: StadiumBorder(),
                                          color: Constants.buttonColor,
                                          textColor: Colors.white,
                                        )
                                      : Container()
                                ],
                              ),
                              onTap: () {
                                Navigator.of(context).push(
                                  CupertinoPageRoute(
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
