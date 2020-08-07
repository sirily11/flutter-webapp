import 'package:flutter/material.dart';
import 'package:webdemo/pages/CustomAppBar.dart';
import 'package:webdemo/pages/MiniAppButton.dart';

import 'components/DateRemain.dart';
import 'components/DateSelect.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: CustomAppBar(
        titleText: "Count App",
        icon: Icon(Icons.date_range),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DateSelect(),
              DateRemain(),
            ],
          ),
        ),
      ),
      floatingActionButton: MiniAppButton(),
    );
  }
}
