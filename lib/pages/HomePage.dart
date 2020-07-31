import 'package:flutter/material.dart';
import 'package:webdemo/apps.dart';

class MainAppHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Web App Demo",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Apps",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Divider(),
                  for (var app in apps)
                    ListTile(
                      onTap: () => Navigator.pushNamed(context, app.path),
                      leading: Icon(app.icon),
                      title: Text("${app.title}"),
                      subtitle: Text("${app.description}"),
                      trailing: Icon(Icons.more_horiz),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
