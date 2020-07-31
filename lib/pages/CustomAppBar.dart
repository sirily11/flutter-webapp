import 'package:flutter/material.dart';

/// Define the appbar in each app
class CustomAppBar extends AppBar {
  CustomAppBar({String title}) : super(title: Text("$title"));

  @override
  double get elevation => 0;

  @override
  Widget get leading => Container();

  @override
  List<Widget> get actions => [
        BackButton(),
      ];
}

class BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        onPressed: () => Navigator.popUntil(context, ModalRoute.withName("/")),
        icon: Icon(Icons.close),
      ),
    );
  }
}
