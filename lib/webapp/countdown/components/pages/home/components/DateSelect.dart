
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webdemo/webapp/countdown/components/models/HomeProvider.dart';

import 'DurationPicker.dart';

typedef void OnDatePick(DateTime dateTime);

class DateSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of(context);
    DateTime end = homeProvider.start.add(homeProvider.duration);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DatePick(
              title: "Start Date",
              dateTime: homeProvider.start ?? DateTime.now(),
              onDatePick: (date) {
                homeProvider.start = date;
              },
            ),
            InkWell(
              onTap: () async {
                Duration duration = await showDialog(
                  context: context,
                  builder: (c) => DurationPicker(
                    duration: homeProvider.duration,
                  ),
                );

                if (duration != null) {
                  homeProvider.duration = duration;
                }
              },
              child: Column(
                children: [
                  Icon(Icons.flight_land),
                  Text(
                    "${homeProvider.duration?.inDays} day(s)",
                  )
                ],
              ),
            ),
            DatePick(
              title: "End Date",
              dateTime: end,
              enable: false,
            ),
          ],
        ),
      ),
    );
  }
}

class DatePick extends StatelessWidget {
  final OnDatePick onDatePick;
  final DateTime dateTime;
  final String title;
  final bool enable;

  DatePick({this.onDatePick, this.dateTime, this.title, this.enable = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enable
          ? () async {
              var picked = await showDatePicker(
                context: context,
                initialDate: dateTime,
                firstDate: DateTime(1970),
                lastDate: DateTime(2040),
              );
              if (picked != null) {
                onDatePick(picked);
              }
            }
          : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${dateTime.year}/${dateTime.month}/${dateTime.day}",
            style: TextStyle(fontSize: 30),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
