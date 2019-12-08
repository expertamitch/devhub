import 'dart:io';

import 'package:dev_hub/blocs/conversation_bloc.dart';
import 'package:dev_hub/ui/communities/community_details.dart';
import 'package:dev_hub/ui/profile/user_profile.dart';
import 'package:dev_hub/util/data.dart';
import 'package:dev_hub/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:image_picker/image_picker.dart';

class Conversation extends StatefulWidget {
  bool isCommunity;

  Conversation(this.isCommunity);

  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  ConversationBloc _bloc = ConversationBloc();
  static Random random = Random();
  String name = names[random.nextInt(10)];
  File _image;
  TextEditingController textEditingController = TextEditingController();
  double offset = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: InkWell(
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 0.0, right: 10.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/cm${random.nextInt(10)}.jpeg",
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 15.0),
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Online",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return widget.isCommunity
                      ? CommunityDetails()
                      : UserProfilePage();
                },
              ),
            );
          },
        ),
        actions: <Widget>[
          widget.isCommunity
              ? PopupMenuButton<int>(
                  icon: Icon(Icons.more_horiz),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Text('Mute'),
                    ),
                    PopupMenuDivider(),
                    PopupMenuItem(
                      value: 2,
                      child: Text('Exit Community chat'),
                    ),
                  ],
                  onSelected: (item) {
                    switch (item) {
                      case 1:
                        {
                          confirmationDialog(
                              'Are you sure you want to Mute this chat?');
                        }
                        break;
                      case 2:
                        {
                          confirmationDialog(
                              'Are you sure you want to Exit Community chat?');
                        }
                        break;
                    }
                  },
                )
              : PopupMenuButton<int>(
                  icon: Icon(Icons.more_horiz),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Text('Mute'),
                    ),
                    PopupMenuDivider(),
                    PopupMenuItem(
                      value: 2,
                      child: Text('Block'),
                    ),
                    PopupMenuDivider(),
                    PopupMenuItem(
                      value: 3,
                      child: Text('Report'),
                    ),
                    PopupMenuDivider(),
                    PopupMenuItem(
                      value: 4,
                      child: Text('Clear chat'),
                    )
                  ],
                  onSelected: (item) {
                    switch (item) {
                      case 1:
                        {
                          confirmationDialog(
                              'Are you sure you want to Mute this chat?');
                        }
                        break;
                      case 2:
                        {
                          confirmationDialog(
                              'Are you sure you want to Bloc this user?');
                        }
                        break;
                      case 3:
                        {
                          confirmationDialog(
                              'Are you sure you want to Report this user?');
                        }
                        break;
                      case 4:
                        {
                          confirmationDialog(
                              'Are you sure you want to Clear this chat?');
                        }
                        break;
                    }
                  },
                )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Flexible(
              child: StreamBuilder<List<dynamic>>(
                  stream: _bloc.conversationStream,
                  builder: (context, snapshot) {
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      itemCount: snapshot.data.length,
                      reverse: true,
                      itemBuilder: (BuildContext context, int index) {
                        Map msg = snapshot.data[index];
                        return GestureDetector(
                          child: Transform.translate(
                            offset: Offset(offset, 0.0),
                            child: ChatBubble(
                              message: msg['type'] == "text"
                                  ? msg["text"]
                                  : msg["image"],
                              username: msg["username"],
                              time: msg["time"],
                              type: msg['type'],
                              replyText: msg["replyText"],
                              isMe: msg['isMe'],
                              isGroup: msg['isGroup'],
                              isReply: msg['isReply'],
                              replyName: name,
                            ),
                          ),
                          onHorizontalDragUpdate: (i) {
                            setState(() {
                              offset = i.globalPosition.dx;
                            });
                            print(i.localPosition.toString());
                          },
                          onHorizontalDragStart: (i) {
//                            print(i.localPosition.toString());
                          },
                        );
                      },
                    );
                  }),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 8),
//                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[500],
                      offset: Offset(0.0, 1.5),
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                constraints: BoxConstraints(
                  maxHeight: 190,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: ListTile(
                        leading: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Theme.of(context).accentColor,
                          ),
                          onPressed: () {
                            _showImagePickOptionDialog(false);
                          },
                        ),
                        contentPadding: EdgeInsets.all(0),
                        title: TextField(
                          textInputAction: TextInputAction.send,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Theme.of(context).textTheme.title.color,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            hintText: "Type your message here...",
                            hintStyle: TextStyle(
                              fontSize: 15.0,
                              color: Theme.of(context).textTheme.title.color,
                            ),
                          ),
                          maxLines: null,
                          controller: textEditingController,
                          onSubmitted: (text) {
                            textEditingController.text = "";
                            _bloc.sendMessage(text, false);
                          },
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.send,
                            color: Theme.of(context).accentColor,
                          ),
                          onPressed: () {
                            _bloc.sendMessage(
                                textEditingController.text, false);
                            textEditingController.text = "";
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  confirmationDialog(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alert'),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Future _getViaGallery(bool isReply) async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      _bloc.addMediaMesssage(image.path, isReply);
    });
  }

  Future _getViaCamera(bool isReply) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
      _bloc.addMediaMesssage(image.path, isReply);
    });
  }

  void _showImagePickOptionDialog(bool isReply) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select via"),
          actions: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: FlatButton(
                  child: new Text(
                    "Cancel",
                    textAlign: TextAlign.start,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ),
            // usually buttons at the bottom of the dialog
            FlatButton(
                child: new Text("Camera"),
                onPressed: () {
                  Navigator.of(context).pop();
                  _getViaCamera(isReply);
                }),
            FlatButton(
                child: new Text("Gallery"),
                onPressed: () {
                  Navigator.of(context).pop();
                  _getViaGallery(isReply);
                }),
          ],
        );
      },
    );
  }
}
