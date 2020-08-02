import 'dart:async';

import 'package:flutter/material.dart';

class CountingDisplay extends StatefulWidget {
  @override
  _CountingDisplayState createState() => _CountingDisplayState();
}

class _CountingDisplayState extends State<CountingDisplay> {
  int count = 0;
  final totalCount = 8;
  Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        count = count + 1;
        if (count == totalCount) {
          count = 0;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          for (var i = 1; i < totalCount; i++)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  height: 5,
                  color: i <= count ? Colors.blue : Colors.transparent,
                ),
              ),
            )
        ],
      ),
    );
  }
}
