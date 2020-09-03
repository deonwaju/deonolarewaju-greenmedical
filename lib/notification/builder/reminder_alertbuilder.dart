import 'dart:io';

import 'package:deon_greenmed/main.dart';
import 'package:deon_greenmed/notification/actions/actions.dart';
import 'package:deon_greenmed/notification/builder/reminder_customitem.dart';
import 'package:deon_greenmed/notification/builder/reminder_item.dart';
import 'package:deon_greenmed/notification/models/reminder.dart';
import 'package:deon_greenmed/notification/store/store.dart';
import 'package:deon_greenmed/notification/utils/notification_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const String hourly = 'Trigger every hour';
const String custom = "You have a doctor's appointment";

const remindersIcons = {
  hourly: Icons.notifications_none,
  custom:  Icons.notifications_none,
};

class ReminderAlertBuilder extends StatefulWidget {
  ReminderAlertBuilder({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ReminderAlertBuilderState createState() => _ReminderAlertBuilderState();
}

class _ReminderAlertBuilderState extends State<ReminderAlertBuilder> {
  bool hourlyReminder = false;
  bool customReminder = false;
  double margin = Platform.isIOS ? 20 : 5;

  TimeOfDay customNotificationTime;
  DateTime customNotificationDate;

  @override
  Widget build(BuildContext context) {
    _prepareState();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          ButtonTheme(
            minWidth: 380,
            height: 56,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
              ),
              child: new Text("Manage Appointments",style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
              ),
              ),
              onPressed: _showMaterialDialog,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  _showMaterialDialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              contentPadding: EdgeInsets.all(0.0),
              backgroundColor: Colors.white,
              content: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width - 10,
                        height: MediaQuery.of(context).size.height - 80,
                        padding: EdgeInsets.all(20),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                                padding: new EdgeInsets.only(
                                    bottom: margin, top: margin),
                                child: Text(
                                  'Remind me every hour',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w500),
                                )),
                            ReminderItem(
                              onChanged: (value) {
                                setState(() {
                                  hourlyReminder = value;
                                });
                                _configure5minWalk(value);
                              },
                              checkBoxValue: hourlyReminder,
                              iconName: hourly,
                            ),

                            SizedBox(height: 50,),

                            Padding(
                                padding: new EdgeInsets.only(
                                    bottom: margin, top: margin),
                                child: Text(
                                  'Set Appointment Time',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.w500),
                                )),
                            ReminderCustomItem(
                              checkBoxValue: customReminder,
                              iconName: '',
                              onChanged: (value) {
                                setState(() {
                                  customReminder = value;
                                });
                                _configureCustomReminder(value);
                              },
                              showTimeDialog: () {
                                _showTimeDialog(setState);
                              },
                            ),

                            Padding(
                              padding: new EdgeInsets.only(
                                  top: margin * 2, bottom: margin),
                              child: RaisedButton(
                                  color: Colors.teal,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "SAVE",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                            Padding(
                              padding: new EdgeInsets.only(
                                  top: margin * 2, bottom: margin),
                              child: RaisedButton(
                                  color: Colors.teal,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            )
                          ],
                        ),
                      ),
                    );
                  }));
        });
  }

  _prepareState() {
    List<Reminder> list = getStore().state.remindersState.reminders;

    list.forEach((item) {
      switch (item.name) {
        case hourly:
          hourlyReminder = true;
          break;
        case custom:
          customReminder = true;
          break;
        default:
          return;
      }
    });
  }


  void _configure5minWalk(bool value) {
    if (value) {
      getStore().dispatch(SetReminderAction(
          time: new DateTime.now().toIso8601String(),
          name: hourly,
          repeat: RepeatInterval.Hourly));
      scheduleNotificationPeriodically(
          flutterLocalNotificationsPlugin, '2', hourly, RepeatInterval.Hourly);
    } else {
      getStore().dispatch(RemoveReminderAction(hourly));
      turnOffNotificationById(flutterLocalNotificationsPlugin, 2);
    }
  }

  void _configureCustomReminder(bool value) {
    if (customNotificationTime != null && customNotificationDate != null) {
      if (value) {

        var notificationTime = new DateTime(customNotificationDate.year, customNotificationDate.month, customNotificationDate.day,
            customNotificationTime.hour, (customNotificationTime.minute - 10));

        getStore().dispatch(SetReminderAction(
            time: notificationTime.toIso8601String(),
            name: custom,
            repeat: RepeatInterval.Daily));

        scheduleNotification(
            flutterLocalNotificationsPlugin, '4', custom, notificationTime);
      } else {
        getStore().dispatch(RemoveReminderAction(custom));
        turnOffNotificationById(flutterLocalNotificationsPlugin, 4);
      }
    }
  }


  _showTimeDialog(StateSetter setState) async {

    DateTime selectedDate = await showDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2100),
      context: context,
    );

    TimeOfDay selectedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    setState(() {
      customNotificationDate = selectedDate;
      customNotificationTime = selectedTime;
      customReminder = true;
    });

    _configureCustomReminder(true);
  }
}


