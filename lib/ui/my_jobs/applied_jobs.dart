import 'package:dev_hub/util/common_utils.dart';
import 'package:dev_hub/util/constants.dart';
import 'package:dev_hub/util/data.dart';
import 'package:flutter/material.dart';

class AppliedJobs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppliedJobsState();
  }
}

class _AppliedJobsState extends State<AppliedJobs> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        primary: false,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: jobsDetails.length,
        itemBuilder: (BuildContext context, int index) {
          Map place = jobsDetails.reversed.toList()[index];
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
      ),
    );
  }
}
