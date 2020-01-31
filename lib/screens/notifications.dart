import 'package:dev_hub/blocs/notification_bloc.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  NotificationsBloc bloc;

  @override
  void initState() {
    bloc = NotificationsBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<List<dynamic>>(
          stream: bloc.notificationsStream,
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            return ListView.separated(
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
                Map notif = snapshot.data[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        notif['dp'],
                      ),
                      radius: 25,
                    ),
                    contentPadding: EdgeInsets.all(0),
                    title: Text(notif['notif']),
                    trailing: Text(
                      notif['time'],
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 11,
                      ),
                    ),
                    onTap: () {},
                  ),
                );
              },
            );
          }),
    );
  }
}
