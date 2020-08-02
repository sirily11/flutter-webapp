import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'package:webdemo/webapp/countdown/components/models/HomeProvider.dart';
import 'package:webdemo/webapp/countdown/components/pages/home/components/CountingDisplay.dart';

class DateRemain extends StatefulWidget {
  @override
  _DateRemainState createState() => _DateRemainState();
}

class _DateRemainState extends State<DateRemain> {
  DateTime now = DateTime.now();
  Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of(context);
    Duration remaining =
        homeProvider.start.add(homeProvider.duration).difference(now);

    return Card(
      child: Container(
        height: 350,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            CountingDisplay(),
            Spacer(
              flex: 1,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(),
                Text(
                  "${remaining.inDays}",
                  style: TextStyle(fontSize: 100),
                ),
                Text("days"),
                Text(
                  "${remaining.inHours.remainder(24)}",
                  style: TextStyle(fontSize: 50),
                ),
                Text("hours"),
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
            Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }
}
