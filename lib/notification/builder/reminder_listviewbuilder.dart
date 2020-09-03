

import 'package:deon_greenmed/main.dart';
import 'package:deon_greenmed/notification/builder/reminder_alertbuilder.dart';
import 'package:deon_greenmed/notification/models/reminder.dart';
import 'package:flutter/material.dart';

class RemindersList extends StatelessWidget {
  final List<Reminder> reminders;
  RemindersList({this.reminders});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: reminders.length,
        itemBuilder: (context, index) {
          final item = reminders[index];
          return ListTile(
              title: Row(
                children: <Widget>[
                  Icon(
                    remindersIcons[item.name],
                    color: Colors.teal,
                    size: 30.0,
                  ),
                  Text(item.name)
                ],
              ),
              subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Start time: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(df.format(DateTime.parse(item.time))),
                          ],
                        )),
                    Text(Reminder.parseRepeatIntervalToString(item.repeat))
                  ]));
        });
    ;
  }
}
