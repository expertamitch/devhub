import 'package:flutter/material.dart';

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({@required this.text});

  @override
  _DescriptionTextWidgetState createState() =>  _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String firstHalf;
  String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 200) {
      firstHalf = widget.text.substring(0, 200);
      secondHalf = widget.text.substring(200, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:  EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
      child: secondHalf.isEmpty
          ?  Text(firstHalf,textAlign: TextAlign.justify,)
          :  Column(
        children: <Widget>[
           Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf),textAlign: TextAlign.justify,),
           InkWell(
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                 Text(
                  flag ? "Show more" : "Show less",
                  style:  TextStyle(color: Colors.blue),
                ),
              ],
            ),
            onTap: () {
              setState(() {
                flag = !flag;
              });
            },
          ),
        ],
      ),
    );
  }
}