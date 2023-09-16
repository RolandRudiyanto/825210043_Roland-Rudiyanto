import 'package:stopwatch/about.dart';
import 'package:stopwatch/login_screen.dart';
import 'package:stopwatch/menu.dart';
import 'package:stopwatch/time.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

void main() {
  AwesomeNotifications().initialize(
    // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
      debug: true
  );
  runApp(StopwatchApp());
}

class StopwatchApp extends StatelessWidget{
  Widget build (BuildContext context){
    return MaterialApp(
        home: LoginScreen(),
    );
  }
}