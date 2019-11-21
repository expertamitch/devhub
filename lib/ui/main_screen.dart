import 'package:dev_hub/ui/communities/communities_home.dart';
import 'package:dev_hub/ui/events/events_home.dart';
import 'package:dev_hub/ui/my_communities/my_communities.dart';
import 'package:dev_hub/ui/my_events/my_events.dart';
import 'package:dev_hub/ui/my_jobs/my_jobs.dart';
import 'package:dev_hub/ui/profile/user_profile.dart';
import 'package:flutter/material.dart';

import '../screens/connects/friends.dart';
import '../screens/messages/chats.dart';
import '../screens/notifications.dart';
import 'jobs/jobs_home.dart';
import 'new_home/home_page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DevHub',
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'Notifications',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return Notifications();
                  },
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return UserProfilePage();
                    },
                  ),
                );
              },
              child: UserAccountsDrawerHeader(
                accountName: Text(
                  'Mark Stein',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                accountEmail: Text('Go to profile'),
                currentAccountPicture: CircleAvatar(
                  child: Text('MK'),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            ListTile(
              leading: Icon(Icons.link),
              title: Text('Connects'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return Connects();
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: Text('My Events'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return MyEvents();
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('My Communities'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return MyCommunities();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.card_travel),
              title: Text('My Jobs'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return MyJobs();
                    },
                  ),
                );
              },
            ),
            Divider(height: 10.0),
            SizedBox(height: 14.0),
            ListTile(
              title: Text('Contact Us'),
              onTap: () {},
            ),
            ListTile(
              title: Text('About'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Terms & Conditions'),
              onTap: () {},
            ),
            SizedBox(height: 70.0),
            ListTile(
              leading: Icon(Icons.offline_bolt),
              title: Text('Log Out'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          Chats(),
          CommunitiesHome(),
          HomePage(),
          JobsHome(),
          EventsHome(),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Theme.of(context).primaryColor,

          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Theme.of(context).accentColor,
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Colors.grey[500]),
              ),
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
              ),
              title: Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.group_work,
              ),
              title: Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.card_travel,
              ),
              title: Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.event,
              ),
              title: Container(height: 0.0),
            ),
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 2);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
