import 'package:dev_hub/blocs/my_jobs_bloc.dart';
import 'package:flutter/material.dart';

class SavedJobs extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SavedJobsState();
  }

}
class _SavedJobsState extends State<SavedJobs>{
  MyJobsBloc _bloc=MyJobsBloc();


  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder<List<dynamic>>(
          stream: _bloc.appliedJobsStream,
          builder: (context,AsyncSnapshot<List<dynamic>> snapshot) {
            return snapshot.data==null?Container():ListView.builder(
            scrollDirection: Axis.vertical,
            primary: false,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              Map place = snapshot.data.reversed.toList()[index];
              return InkWell(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              "${place["img"]}",
                              height: 80,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${place["name"]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 4),
                              Text(
                                "${place["location"]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                                maxLines: 2,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 4),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete)
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  //todo apply on tap
                },
              );
            },
          );
        }
      ),
    );
  }

}