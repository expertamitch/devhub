import 'package:dev_hub/blocs/chats_block.dart';
import 'package:dev_hub/widgets/chat_item.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  ChatsBloc _chatsBloc = ChatsBloc();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration.collapsed(
            hintText: 'Search',
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Theme.of(context).accentColor,
          labelColor: Theme.of(context).accentColor,
          unselectedLabelColor: Theme.of(context).textTheme.caption.color,
          isScrollable: false,
          tabs: <Widget>[
            Tab(
              text: "Message",
            ),
            Tab(
              text: "Groups",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          StreamBuilder<List<dynamic>>(
              stream: _chatsBloc.chatsStream,
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                return snapshot.data == null
                    ? Center(
                        child: Container(
                          child: CircularProgressIndicator(),
                          width: MediaQuery.of(context).size.width * 0.1,
                          height: MediaQuery.of(context).size.width * 0.1,
                        ),
                      )
                    : ListView.separated(
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
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          Map chat = snapshot.data[index];
                          return ChatItem(
                            dp: chat['dp'],
                            name: chat['name'],
                            isOnline: chat['isOnline'],
                            counter: chat['counter'],
                            msg: chat['msg'],
                            time: chat['time'],
                            isCommunity: false,
                          );
                        },
                      );
              }),
          StreamBuilder<List<dynamic>>(
              stream: _chatsBloc.groupsStream,
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                return snapshot.data == null
                    ? Center(
                        child: Container(
                          child: CircularProgressIndicator(),
                          width: MediaQuery.of(context).size.width * 0.1,
                          height: MediaQuery.of(context).size.width * 0.1,
                        ),
                      )
                    : ListView.separated(
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
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          Map chat = snapshot.data[index];
                          return ChatItem(
                            dp: chat['dp'],
                            name: chat['name'],
                            isOnline: chat['isOnline'],
                            counter: chat['counter'],
                            msg: chat['msg'],
                            time: chat['time'],
                            isCommunity: true,
                          );
                        },
                      );
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {},
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
