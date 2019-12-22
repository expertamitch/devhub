import 'package:dev_hub/blocs/event_home_bloc.dart';
import 'package:dev_hub/ui/my_events/upcoming_suggested_events.dart';
import 'package:dev_hub/util/common_utils.dart';
import 'package:dev_hub/util/data.dart';
import 'package:dev_hub/widgets/see_all.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'event_details.dart';

class EventsHome extends StatefulWidget {
  EventsHome() : super();

  @override
  EventsHomeState createState() => EventsHomeState();
}

class EventsHomeState extends State<EventsHome> {
  final TextEditingController _searchControl = new TextEditingController();
  CarouselSlider carouselSlider;
  int _current = 0;

  EventHomeBloc _bloc = EventHomeBloc();

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          getSearch(),
          carouselView(),
          Divider(
            height: 20,
            color: Colors.grey.shade200,
            thickness: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Upcoming Events',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          getUpcomingEvents(),
          Divider(
            height: 20,
            color: Colors.grey.shade200,
            thickness: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Suggested Events',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          getSuggestedEvents(),
        ],
      ),
    );
  }

  carouselView() {
    return StreamBuilder<List<dynamic>>(
        stream: _bloc.newEventsStream,
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return snapshot.data == null
              ? Container()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    carouselSlider = CarouselSlider(
                      height: 200.0,
                      initialPage: 0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      reverse: false,
                      enableInfiniteScroll: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 2000),
                      pauseAutoPlayOnTouch: Duration(seconds: 6),
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index) {
                        setState(() {
                          _current = index;
                        });
                      },
                      items: snapshot.data.map((imgUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.green,
                              ),
                              child: Image.network(
                                imgUrl,
                                fit: BoxFit.fill,
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: map<Widget>(snapshot.data, (index, url) {
                        return Container(
                          width: 6.0,
                          height: 6.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                _current == index ? Colors.black : Colors.grey,
                          ),
                        );
                      }),
                    ),
                  ],
                );
        });
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

  goToPrevious() {
    carouselSlider.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToNext() {
    carouselSlider.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }

  getUpcomingEvents() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: StreamBuilder<List<dynamic>>(
          stream: _bloc.upcomingEventStream,
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            return snapshot.data == null
                ? Container()
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    primary: false,
                    itemCount: snapshot.data.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: InkWell(
                            child: Container(
                              height: 140,
                              width: 250,
                              child: index == snapshot.data.length
                                  ? SeeAll()
                                  : Column(
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            "${snapshot.data.reversed.toList()[index]["img"]}",
                                            height: 140,
                                            width: 250,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Column(
                                                  children: <Widget>[
                                                    Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "${snapshot.data.reversed.toList()[index]["name"]}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14,
                                                        ),
                                                        maxLines: 2,
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                    SizedBox(height: 3),
                                                    Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "${snapshot.data.reversed.toList()[index]["location"]}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color: Colors
                                                              .blueGrey[300],
                                                        ),
                                                        maxLines: 1,
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                    SizedBox(height: 3),
                                                    Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "${snapshot.data.reversed.toList()[index]["time"]}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color: Colors
                                                              .blueGrey[300],
                                                        ),
                                                        maxLines: 1,
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8.0)),
                                                      color:
                                                          Colors.blueGrey[200],
                                                      shape:
                                                          BoxShape.rectangle),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 12,
                                                            bottom: 12,
                                                            left: 4,
                                                            right: 4),
                                                    child: Text(
                                                      CommonUtils
                                                          .formatDateDayMonth(
                                                              "${snapshot.data.reversed.toList()[index]["date"]}"),
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (BuildContext context) {
                                    return index == snapshot.data.length
                                        ? UpcomingOrSuggestedEvents("0")
                                        : EventDetails();
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

  getSuggestedEvents() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: StreamBuilder<List<dynamic>>(
          stream: _bloc.upcomingEventStream,
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            return snapshot.data == null
                ? Container()
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    primary: false,
                    itemCount: snapshot.data.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: InkWell(
                            child: Container(
                              height: 140,
                              width: 250,
                              child: index == snapshot.data.length
                                  ? SeeAll()
                                  : Column(
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            "${snapshot.data.reversed.toList()[index]["img"]}",
                                            height: 140,
                                            width: 250,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Column(
                                                  children: <Widget>[
                                                    Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "${snapshot.data.reversed.toList()[index]["name"]}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14,
                                                        ),
                                                        maxLines: 2,
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                    SizedBox(height: 3),
                                                    Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "${snapshot.data.reversed.toList()[index]["location"]}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color: Colors
                                                              .blueGrey[300],
                                                        ),
                                                        maxLines: 1,
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                    SizedBox(height: 3),
                                                    Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "${snapshot.data.reversed.toList()[index]["time"]}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12,
                                                          color: Colors
                                                              .blueGrey[300],
                                                        ),
                                                        maxLines: 1,
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8.0)),
                                                      color:
                                                          Colors.blueGrey[200],
                                                      shape:
                                                          BoxShape.rectangle),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 12,
                                                            bottom: 12,
                                                            left: 4,
                                                            right: 4),
                                                    child: Text(
                                                      CommonUtils
                                                          .formatDateDayMonth(
                                                              "${snapshot.data.reversed.toList()[index]["date"]}"),
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (BuildContext context) {
                                    return index == snapshot.data.length
                                        ? UpcomingOrSuggestedEvents("0")
                                        : EventDetails();
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
}
