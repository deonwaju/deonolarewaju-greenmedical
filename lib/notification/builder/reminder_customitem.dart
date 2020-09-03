


import 'package:deon_greenmed/notification/builder/reminder_alertbuilder.dart';
import 'package:flutter/material.dart';

class ReminderCustomItem extends StatelessWidget {
  final bool checkBoxValue;
  final void Function(bool) onChanged;
  final String iconName;
  final void Function() showTimeDialog;
  ReminderCustomItem(
      {this.checkBoxValue, this.onChanged, this.iconName, this.showTimeDialog});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: new EdgeInsets.only(left: 0, right: 0, bottom: 10),
        child: CheckboxListTile(
            value: checkBoxValue,
            onChanged: onChanged,
            activeColor: Colors.teal,
            title: Row(children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    remindersIcons[iconName],
                    color: Colors.teal,
                    size: 30.0,
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                          padding: new EdgeInsets.only(left: 10),
                          child: Text(
                            iconName,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.normal),
                          )),
                      SizedBox(
                        child: Padding(
                            padding: new EdgeInsets.only(top: 0, bottom: 10),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                              ),
                              color: Colors.teal,
                              child: Text(
                                'SET TIME',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                              onPressed: showTimeDialog,
                            )),
                        width: 90,
                        height: 40,
                      )
                    ],
                  )
                ],
              )
            ])));
  }
}
