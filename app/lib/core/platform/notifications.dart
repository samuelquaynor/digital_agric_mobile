import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

/// Handle notifications from firebase
class NotificationHandler extends StatefulWidget {
  /// Constructor
  const NotificationHandler({super.key, required this.child});

  /// Child widget
  final Widget child;

  @override
  State<NotificationHandler> createState() => _NotificationHandlerState();
}

class _NotificationHandlerState extends State<NotificationHandler> {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    _fcm.subscribeToTopic('susya');
    // _fcm.
    //   onMessage.listen( message) async {
    //     print("onMessage: $message");
    //     showDialog(
    //       context: context,
    //       builder: (context) => AlertDialog(
    //         content: ListTile(
    //           title: Text(message['notification']['title']),
    //           subtitle: Text(message['notification']['body']),
    //         ),
    //         actions: <Widget>[
    //           FlatButton(
    //             child: Text('Ok'),
    //             onPressed: () => Navigator.of(context).pop(),
    //           ),
    //         ],
    //       ))
    //   },
    //   )
    //   onLaunch: (Map<String, dynamic> message) async {
    //     print("onLaunch: $message");
    //     Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => View(false)));
    //   },
    //   onResume: (Map<String, dynamic> message) async {
    //     print("onResume: $message");
    //   },
    // );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final msg = message.data['body'] as String? ?? ' ';

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: ListTile(
              title: const Text('Digi-Farm Alerts'), subtitle: Text(msg)),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.white));

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
