import 'package:dev_hub/screens/messages/conversation.dart';
import 'package:dev_hub/util/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Connects extends StatefulWidget {
  bool openChat;

  Connects(this.openChat);

  @override
  _ConnectsState createState() => _ConnectsState();
}

class _ConnectsState extends State<Connects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration.collapsed(
            hintText: 'Search',
          ),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(10),
        separatorBuilder: (BuildContext context, int index) {
          return Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 0.5,
              width: MediaQuery.of(context).size.width / 1.3,
              child: Divider(),
            ),
          );
        },
        itemCount: friends.length,
        itemBuilder: (BuildContext context, int index) {
          Map friend = friends[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  friend['dp'],
                ),
                radius: 25,
              ),
              contentPadding: EdgeInsets.all(0),
              title: Text(friend['name']),
              subtitle: Text(friend['status']),
              trailing: !widget.openChat
                  ? friend['isAccept']
                      ? FlatButton(
                          child: Text(
                            "Unfollow",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: Colors.grey,
                          onPressed: () {},
                        )
                      : FlatButton(
                          child: Text(
                            "Follow",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: Theme.of(context).accentColor,
                          onPressed: () {},
                        )
                  : IconButton(
                      icon: Icon(Icons.navigate_next),
                      color: Colors.grey,
                      onPressed: () {},
                    ),
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return Conversation(true);
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
}
