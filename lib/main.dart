import 'package:deon_greenmed/notification/book_appointment.dart';
import 'package:deon_greenmed/notification/store/appstate.dart';
import 'package:deon_greenmed/notification/store/store.dart';
import 'package:deon_greenmed/notification/utils/notification_helper.dart';
import 'file:///C:/FlutterVS/deon_greenmed/lib/pages/login.dart';
import 'package:deon_greenmed/screens/auth/login/login_screen.dart';
import 'package:deon_greenmed/screens/auth/signup/signup_screen.dart';
import 'package:deon_greenmed/screens/doctors/doctor_details_screen.dart';
import 'package:deon_greenmed/screens/home/home_screen.dart';
import 'package:deon_greenmed/tab/choose_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';


final df = new DateFormat('dd-MM-yyyy hh:mm a');

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
NotificationAppLaunchDetails notificationAppLaunchDetails;
Store<AppState> store;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initStore();
  store = getStore();
  notificationAppLaunchDetails =
  await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  await initNotifications(flutterLocalNotificationsPlugin);
  requestIOSPermissions(flutterLocalNotificationsPlugin);

  runApp(MyApp());
}

final routes = {
  '/login': (BuildContext context) => new LoginScreen(),
  '/home': (BuildContext context) => new HomeScreen(),
  '/register': (BuildContext context) => new SignUpScreen(),
  '/docProfile': (BuildContext context) => new DoctorDetailsScreen(),
  '/selectDoc': (BuildContext context) => new SelectDoctor(),
  '/bookappointment': (BuildContext context) => new LaunchingApp(store),
  '/': (BuildContext context) => new LoginScreen(),
};


class MyApp extends StatelessWidget with PreferredSizeWidget{
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      routes: routes,

    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
