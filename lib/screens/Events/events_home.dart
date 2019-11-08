import 'package:dev_hub/blocs/event_home_bloc.dart';
import 'package:dev_hub/util/data.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'event_homepage.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          getSearch(),
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
            items: imgList.map((imgUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
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
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(imgList, (index, url) {
              return Container(
                width: 6.0,
                height: 6.0,
                margin:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index ? Colors.black : Colors.grey,
                ),
              );
            }),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Upcoming Events',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          getUpcomingEvents(),
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
    return StreamBuilder<List<dynamic>>(
        stream: _bloc.upcomingEventStream,
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return snapshot.hasError ? Container() : ListView.builder(
            scrollDirection: Axis.horizontal,
            primary: false,
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              Map place = snapshot.data.reversed.toList()[index];
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: InkWell(
                  child: Container(
                    height: 140,
                    width:MediaQuery.of(context).size.width,
//                      color: Colors.green,
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "${place["img"]}",
                            height: 140,
                            width: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 7),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${place["name"]}",
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
                            "${place["location"]}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blueGrey[300],
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 3),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${place["time"]}",
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
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return EventHomePage();
                        },
                      ),
                    );
                  },
                ),
              );
            },
          );
        }
    );
  }



  getSuggestedEvents() {
    return StreamBuilder<List<dynamic>>(
        stream: _bloc.suggestedEventStream,
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return snapshot.data == null ? Container() : ListView.builder(
            scrollDirection: Axis.horizontal,
            primary: false,
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              Map place = snapshot.data.reversed.toList()[index];
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: InkWell(
                  child: Container(
                    height: 140,
                    width:MediaQuery.of(context).size.width,
//                      color: Colors.green,
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "${place["img"]}",
                            height: 140,
                            width: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 7),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${place["name"]}",
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
                            "${place["location"]}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blueGrey[300],
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 3),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${place["time"]}",
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
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return EventHomePage();
                        },
                      ),
                    );
                  },
                ),
              );
            },
          );
        }
    );
  }
}
