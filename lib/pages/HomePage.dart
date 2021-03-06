import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webdemo/apps.dart';
import 'package:webdemo/models/MainAppProvider.dart';
import 'package:webdemo/pages/MiniAppButton.dart';

class MainAppHomePage extends StatefulWidget {
  @override
  _MainAppHomePageState createState() => _MainAppHomePageState();
}

class _MainAppHomePageState extends State<MainAppHomePage> {
  goto(AppService app) async {
    MainAppProvider mainAppProvider = Provider.of(context, listen: false);
    mainAppProvider.appService = app;
    await Navigator.pushNamed(context, app.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Column(
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
            Wrap(
              children: [
                for (var i = 0; i < min(apps.length, 4); i++)
                  Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () => goto(apps[i]),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Column(
                            children: [
                              Icon(
                                apps[i].icon,
                                size: 50,
                                color: Colors.orange,
                              ),
                              Text(
                                "${apps[i].title}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
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
                        onTap: () => goto(app),
                        leading: Icon(app.icon),
                        title: Text("${app.title}"),
                        subtitle: Text("${app.description}"),
                        trailing: Icon(Icons.more_horiz),
                      ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: MiniAppButton(),
    );
  }
}
