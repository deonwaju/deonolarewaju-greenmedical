import 'dart:io';

import 'package:deon_greenmed/notification/store/appstate.dart';
import 'package:deon_greenmed/notification/store/store.dart';
import 'package:deon_greenmed/notification/utils/notification_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:redux/redux.dart';

import 'builder/notification_switchbuilder.dart';
import 'builder/reminder_alertbuilder.dart';
import 'builder/reminder_listviewbuilder.dart';
import 'models/reminder.dart';


//final df = new DateFormat('dd-MM-yyyy hh:mm a');
//
//final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//    FlutterLocalNotificationsPlugin();
//NotificationAppLaunchDetails notificationAppLaunchDetails;
//Store<AppState> store;
//
//Future<void> main() async {
//  WidgetsFlutterBinding.ensureInitialized();
//  await initStore();
//  store = getStore();
//  notificationAppLaunchDetails =
//      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
//  await initNotifications(flutterLocalNotificationsPlugin);
//  requestIOSPermissions(flutterLocalNotificationsPlugin);
//
//  return(LaunchingApp(store));
//}

class LaunchingApp extends StatelessWidget {
  final Store<AppState> store;
  LaunchingApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      child: MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 80,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: ReminderAlertBuilder()),
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: NotificationSwitchBuilder()),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Reminders list",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.teal,
                              width: 2,
                            ),
                            borderRadius:
                            BorderRadius.all(Radius.circular(15.0)),
                          ),
                          child: SizedBox(
                            child: StoreConnector<AppState, List<Reminder>>(
                                converter: (store) =>
                                store.state.remindersState.reminders,
                                builder: (context, reminders) {
                                  return RemindersList(reminders: reminders);
                                }),
                            height: Platform.isAndroid ? 320 : 400,
                          ))),
                ],
              ),
            ),
          )),
      store: store,
    );

  }
}
