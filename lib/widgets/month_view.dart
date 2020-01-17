import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MonthWidget extends StatelessWidget {
  String name;
  bool selected;

  MonthWidget(this.name, this.selected);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            this.name,
            style: TextStyle(
                color: selected ? Colors.blueAccent : Colors.black,
                fontSize: selected ? 22 : 14,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
