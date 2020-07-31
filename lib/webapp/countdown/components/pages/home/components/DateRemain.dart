import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webdemo/webapp/countdown/components/models/HomeProvider.dart';

class DateRemain extends StatefulWidget {
  @override
  _DateRemainState createState() => _DateRemainState();
}

class _DateRemainState extends State<DateRemain> {
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      now = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of(context);

    return Card(
      child: Container(
        height: 400,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(),
                Text(
                  "${homeProvider.start.add(homeProvider.duration).difference(now).inDays}",
                  style: TextStyle(fontSize: 100),
                ),
                Text("days"),
                Spacer(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Divider(
                  color: Colors.black,
                ),
              ),
            ),
            Text("距离结束日期还剩"),
          ],
        ),
      ),
    );
  }
}
