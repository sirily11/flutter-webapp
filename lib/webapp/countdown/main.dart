import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webdemo/webapp/countdown/components/pages/home/HomePage.dart';

import 'components/models/HomeProvider.dart';

class CountdownApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        )
      ],
      child: Material(
        child: HomePage(),
      ),
    );
  }
}
