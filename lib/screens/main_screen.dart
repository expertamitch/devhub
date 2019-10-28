import 'package:dev_hub/screens/profile/user_profile.dart';
import 'package:flutter/material.dart';
import 'Events/events_home.dart';
import 'communities/communities_home.dart';
import 'connects/friends.dart';
import 'homepage/home.dart';
import 'jobs/jobs_home.dart';
import 'messages/chats.dart';
import 'notifications.dart';
import 'profile/profile.dart';

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
          style: TextStyle(fontSize: 27.0,color: Colors.white),
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
            SizedBox(height: 50.0),
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
            SizedBox(height: 50.0),
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
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('My Communities'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.card_travel),
              title: Text('My Jobs'),
              onTap: () {},
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
          NewsFeed(),
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
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
                color: Colors.white,
              ),
              title: Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.group_work,
                color: Colors.white,
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
                color: Colors.white,
              ),
              title: Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.event,
                color: Colors.white,
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
