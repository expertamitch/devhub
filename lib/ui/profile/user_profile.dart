import 'package:dev_hub/ui/profile/edit_profile_basic_details.dart';
import 'package:dev_hub/util/constants.dart';
import 'package:dev_hub/util/data.dart';
import 'package:dev_hub/widgets/description_text.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  Widget build(BuildContext cx) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new Column(
            children: <Widget>[
              Container(
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 75),
                      child: Image.asset(
                        "assets/images/cover_photo.jpeg",
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: ShapeDecoration(
                            shape: CircleBorder(), color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(75.0),
                            child: Image.asset(
                              "assets/images/profile_photo.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 10.0),
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Mark Stein',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      Icons.check_circle,
                      color: Colors.blueAccent,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.work),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Founder and CEO at',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Exselcior IT',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.work),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Works at',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Exselcior IT',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.school),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Studied Computer Science at',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                      ],
                    ),
                    Wrap(
                      children: <Widget>[
                        Text(
                          'SLIIT University',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.home),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Lives in',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Colombo',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.location_on),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'From',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Sri Lanka',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
//                        _showMoreOption(cx);
                          },
                          child: Text(
                            'See more..',
                            style: TextStyle(fontSize: 18.0),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        RaisedButton.icon(
                            color: Colors.white70,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return EditProfileBasicDetails();
                                  },
                                ),
                              );
                            },
                            icon: Icon(Icons.edit, color: Colors.black),
                            label: Text('Edit Profile',
                                style: TextStyle(color: Colors.black))),
                      ],
                    ),
                    Divider(
                      height: 20,
                      color: Colors.grey.shade200,
                      thickness: 5,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'About me',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 5.0),
                          DescriptionTextWidget(text:
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                              "\nLorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an"
                              "\nunknown printer took a galley of type and scrambled it to make a type specimen book. It"
                              "\nhas survived not only five centuries, but also the leap into electronic typesetting, remaining"
                              "\nessentially unchanged. It was popularised"),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey.shade200,
                      thickness: 5,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Technologies',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(height: 10.0),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 22.0, vertical: 6.0),
                                    child: Text("Java",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ),
                              SizedBox(width: 2.0),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 22.0, vertical: 6.0),
                                    child: Text("Angular 2",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.0),
                          Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 22.0, vertical: 6.0),
                                    child: Text("AWS",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ),
                              SizedBox(width: 2.0),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 22.0, vertical: 6.0),
                                    child: Text("Flutter",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(
                      height: 40,
                      color: Colors.grey.shade200,
                      thickness: 5,
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Work Experience',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    getWorkExperience(),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Contacts',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Github'),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('LinkedIn'),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Stackoverflow'),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Email'),
                      ),
                    ),
                    Container(
                      height: 20.0,
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 5.0),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _showMoreOption(cx) {
    showModalBottomSheet(
      context: cx,
      builder: (BuildContext bcx) {
        return new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.feedback,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Give feedback or report this profile',
                    style: TextStyle(fontSize: 18.0),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.block,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Block',
                    style: TextStyle(fontSize: 18.0),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.link,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Copy link to profile',
                    style: TextStyle(fontSize: 18.0),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Search Profile',
                    style: TextStyle(fontSize: 18.0),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }

  getWorkExperience() {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          primary: false,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: jobsDetails.length,
          itemBuilder: (BuildContext context, int index) {
            Map place = jobsDetails.reversed.toList()[index];
            return InkWell(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "${place["img"]}",
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
                              "Apr 2017 - Nov 2019",
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
                    ],
                  ),
                  Container(
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            );
          },
        ));
  }
}
