import 'package:dev_hub/util/data.dart';
import 'package:flutter/material.dart';

class CommunityHome extends StatefulWidget {
  @override
  _CommunityHomeState createState() => _CommunityHomeState();
}

class _CommunityHomeState extends State<CommunityHome> {
  var _followingStatus = "Follow";
  var _dropDownMenuItems;
  List<String> _optionList = [
    "Follow",
    "Unfollow",
  ];

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _followingStatus = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String option in _optionList) {
      items.add(new DropdownMenuItem(value: option, child: new Text(option)));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          primary: false,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomLeft,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Image.asset(
//                    "assets/image_01.png",
                    "${events[0]["img"]}",
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: ShapeDecoration(
                        shape: CircleBorder(), color: Colors.grey),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.asset(
                          "assets/images/logo.jpeg",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "${events[0]["name"]}",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                ),
                DropdownButton(
                    value: _followingStatus,
                    items: _dropDownMenuItems,
                    onChanged: followUnfollow)
              ],
            ),
            Text(
              "About",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              "${events[0]["details"]}",
              style: TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ));
  }

  followUnfollow(value) {}
}
