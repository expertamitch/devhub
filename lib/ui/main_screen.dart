import 'package:dev_hub/ui/communities/communities_home.dart';
import 'package:dev_hub/ui/events/events_home.dart';
import 'package:dev_hub/ui/my_communities/my_communities.dart';
import 'package:dev_hub/ui/my_events/my_events.dart';
import 'package:dev_hub/ui/my_jobs/my_jobs.dart';
import 'package:dev_hub/ui/profile/user_profile.dart';
import 'package:dev_hub/util/constants.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
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
      bottomNavigationBar:FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.blueGrey.shade50,
          selectedItemBackgroundColor: Constants.lightPrimary,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Constants.lightPrimary,
          unselectedItemIconColor: Colors.blueGrey,
          unselectedItemLabelColor: Colors.blueGrey
        ),
        selectedIndex: _page,
        onSelectTab: (index) {
          setState(() {
            _page = index;
            navigationTapped(_page);
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.message,
            label: "Message",
          ),
          FFNavigationBarItem(
            iconData: Icons.group_work,
            label: "Community",
          ),
          FFNavigationBarItem(
            iconData: Icons.home,
            label: "Home",
          ),
          FFNavigationBarItem(
            iconData: Icons.card_travel,
            label: "Jobs",
          ),
          FFNavigationBarItem(
            iconData: Icons.event,
            label: "Events",
          ),
        ],
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
