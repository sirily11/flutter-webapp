import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webdemo/apps.dart';
import 'package:webdemo/models/MainAppProvider.dart';
import 'package:webdemo/pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> routes =
        Map.fromIterable(apps, key: (e) => e.path, value: (e) => (c) => e.app);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainAppProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: "/",
        routes: {
          "/": (c) => MainAppHomePage(),
        }..addAll(routes),
      ),
    );
  }
}
