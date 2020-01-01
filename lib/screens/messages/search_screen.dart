import 'package:dev_hub/blocs/my_event_bloc.dart';
import 'package:dev_hub/util/common_utils.dart';
import 'package:dev_hub/util/constants.dart';
import 'package:dev_hub/widgets/search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
//0:upcoming , 1:suggested

  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String title;

  MyEventBloc _bloc = MyEventBloc();

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
            stream: _bloc.eventGoingStream,
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 3,
                        child: Row(
                          children: <Widget>[
                            RotatedBox(
                              quarterTurns: 3,
                              child: Container(
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey[200],
                                    shape: BoxShape.rectangle),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12,
                                        bottom: 12,
                                        left: 4,
                                        right: 4),
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
                                  crossAxisAlignment:
                                  CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(4.0),
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(4),
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
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                                maxLines: 1,
                                                textAlign: TextAlign.left,
                                              ),
                                              Text(
                                                "${place["location"]}",
                                                style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  fontSize: 10,
                                                ),
                                                maxLines: 2,
                                                textAlign: TextAlign.left,
                                              ),
                                              Text(
                                                "${place["time"]}",
                                                style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.w500,
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
                    onTap: () {
                      //todo apply on tap
                    },
                  );
                },
              );
            }),
      ),
    );
  }
}
