import 'package:flutter/material.dart';
import 'package:webdemo/apps.dart';

class MainAppHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: apps.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          var app = apps[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, app.path);
            },
            child: Card(
              child: Center(
                child: Text("${app.title}"),
              ),
            ),
          );
        },
      ),
    );
  }
}
