import 'package:flutter/material.dart';

/// Define the appbar in each app
class CustomAppBar extends AppBar {
  final Icon icon;
  final String titleText;

  CustomAppBar({this.titleText, @required this.icon})
      : super(title: Text("$titleText"));

  @override
  double get elevation => 0;

  @override
  Widget get leading => Hero(
        tag: Key(titleText),
        child: icon,
      );

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
