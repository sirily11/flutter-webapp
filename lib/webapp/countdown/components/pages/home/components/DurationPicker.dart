import 'package:flutter/material.dart';

class DurationPicker extends StatefulWidget {
  final Duration duration;

  DurationPicker({@required this.duration});

  @override
  _DurationPickerState createState() => _DurationPickerState();
}

class _DurationPickerState extends State<DurationPicker> {
  TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController =
        TextEditingController(text: "${widget.duration?.inDays ?? ""}");
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Pick Duration"),
      content: TextFormField(
        autovalidate: true,
        controller: textEditingController,
        decoration: InputDecoration(labelText: "Duration"),
        validator: (v) {
          int day = int.tryParse(v);
          if (day != null) {
            return null;
          }
          return "Invaild duration";
        },
      ),
      actions: [
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),
        FlatButton(
          onPressed: () {
            int day = int.tryParse(textEditingController.text);
            if (day != null) {
              Navigator.pop(context, Duration(days: day));
            }
          },
          child: Text("ok"),
        )
      ],
    );
  }
}
