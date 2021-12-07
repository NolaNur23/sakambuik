import 'package:flutter/material.dart';
import 'package:sakambuik/Home/home_detail_deskripsi.dart';
import 'package:sakambuik/Home/home_detail_screen.dart';

class NavigatorDetail extends StatefulWidget {
  const NavigatorDetail({Key key}) : super(key: key);

  @override
  _NavigatorDetailState createState() => _NavigatorDetailState();
}

class _NavigatorDetailState extends State<NavigatorDetail>
    with SingleTickerProviderStateMixin {
  bool changed = true;
  TabController tabcontroll;
  @override
  void initState() {
    tabcontroll = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabcontroll?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabcontroll,
        tabs: [
          Tab(
            child: Text(
              'Deskripsi',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Ubuntu',
                color: Colors.black,
              ),
            ),
          ),
          Tab(
            child: Text(
              'Lokasi',
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Ubuntu',
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
