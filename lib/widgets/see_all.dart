import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeeAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          child: Icon(Icons.navigate_next),
        ),
        Text(
          "See All",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        )
      ],
    ));
  }
}
