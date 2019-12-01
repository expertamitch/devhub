import 'package:dev_hub/blocs/job_detail_bloc.dart';
import 'package:dev_hub/blocs/jobs_bloc.dart';
import 'package:dev_hub/ui/zoom_image.dart';
import 'package:dev_hub/util/data.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  JobDetailBloc _jobsBloc = JobDetailBloc();
  JobsBloc _recommendedJobsBloc = JobsBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: StreamBuilder<dynamic>(
          stream: _jobsBloc.stream,
          builder: (context, AsyncSnapshot<dynamic> snapshot) {
            Map place = snapshot.data;

            return ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: GestureDetector(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        place["img"],
                        height: 220,
                        width: MediaQuery.of(context).size.width - 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return ZoomImage(place["img"]);
                          },
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${jobsDetails[0]["name"]}",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.share,
                          ),
                          onPressed: () {
                            Share.share(
                                'check out my website https://example.com');
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.save,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 10.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage("assets/cm7.jpeg"),
                          ),
                        ),
                        Text(
                          place['companyname'],
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.attach_money,
                                  size: 16,
                                  color: Colors.blueGrey[300],
                                ),
                                Text(
                                  '24,400 pa',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  size: 14,
                                  color: Colors.blueGrey[300],
                                ),
                                SizedBox(width: 3),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "${jobsDetails[0]["location"]}",
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
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Text(
                                'Posted ${place['time']}',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            )
                          ],
                        ),
                        MaterialButton(
                          color: Colors.blueGrey[300],
                          child: Text(
                            'Apply',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                    Divider(height:40,color: Colors.grey.shade200,thickness: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Requirements",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        ListView.builder(
                          primary: false,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: place['requirement'].length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.only(top: 4),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      height: 8,
                                      width: 8,
                                      margin: const EdgeInsets.only(
                                          right: 8, top: 4),
                                      decoration: new BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle,
                                      )),
                                  Expanded(
                                    child: Text(
                                      place['requirement'][index],
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Technologies",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Wrap(
                          children: List<Widget>.generate(
                            place['technologies'].length,
                            (int index) {
                              return Container(
                                margin: const EdgeInsets.only(left: 4),
                                child: Chip(
                                  backgroundColor: Colors.blue,
                                  labelPadding:
                                      const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                  label: Text(
                                    place['technologies'][index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .body2
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        )
                      ],
                    ),
                    Divider(height:20,color: Colors.grey.shade200,thickness: 5,),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Details",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Job type: Full time',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${jobsDetails[0]["details"]}",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 10,),
                    MaterialButton(
                      elevation: 1,
                      color: Colors.blueGrey,
                      child: Text(
                        'Contact the Recruiter',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                Divider(height:20,color: Colors.grey.shade200,thickness: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Similar Jobs',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                getRecommended()
              ],
            );
          }),
    );
  }


  getRecommended() {
    return Container(
      height: 220,
      padding: EdgeInsets.only(top: 10, left: 20),
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder<List<dynamic>>(
          stream: _recommendedJobsBloc.stream,
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
                  padding: const EdgeInsets.only(right: 8),
                  child: Card(
                    elevation: 3,
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          width: 140,
                          child: Column(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "${place["img"]}",
                                  height: 120,
                                  width: 140,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 7),
                              Center(
                                child: Column(
                                  children: <Widget>[
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
                            ],
                          ),
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
                  ),
                );
              },
            );
          }),
    );
  }
}
