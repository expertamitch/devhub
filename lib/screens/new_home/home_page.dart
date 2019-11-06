import 'package:dev_hub/screens/Events/event_homepage.dart';
import 'package:dev_hub/screens/jobs/job_details.dart';
import 'package:dev_hub/util/data.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomePage> {
  final TextEditingController _searchControl = new TextEditingController();
  CarouselSlider carouselSlider;
  int _current = 0;

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
          searchField(),
          carouselView(),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Upcoming Events',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          upcomingEvents(),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Recommended Jobs',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  searchField() {
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
              Icons.event,
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

  carouselView() {
    return Column(
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
          items: imgList.map((imgUrl) {
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
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(imgList, (index, url) {
            return Container(
              width: 6.0,
              height: 6.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index ? Colors.black : Colors.grey,
              ),
            );
          }),
        ),
      ],
    );
  }

  goToPrevious() {
    carouselSlider.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  upcomingEvents() {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 20),
//            color: Colors.red,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: events == null ? 0 : events.length,
        itemBuilder: (BuildContext context, int index) {
          Map place = events.reversed.toList()[index];
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              child: Container(
                height: 140,
                width: 250,
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
      ),
    );
  }

  recommendedJobs() {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 20),
      height: 250,
//            color: Colors.red,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: jobsDetails == null ? 0 : jobsDetails.length,
        itemBuilder: (BuildContext context, int index) {
          Map place = jobsDetails.reversed.toList()[index];
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              child: Container(
                height: 250,
                width: 140,
//                      color: Colors.green,
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "${place["img"]}",
                        height: 178,
                        width: 140,
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
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return Details();
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  goToNext() {
    carouselSlider.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }
}
