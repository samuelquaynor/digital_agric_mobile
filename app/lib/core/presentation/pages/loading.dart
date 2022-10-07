import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:nil/nil.dart';

/// Loading Page Dialog
class LoadingPage extends StatelessWidget {
  /// Constructor
  const LoadingPage({super.key, required this.errorText, this.callback});

  /// A String value to show error message to user
  /// When null thus validation passed, then execute callback()
  /// An empty value is the initial value for the loading screen to be running.
  final Future<String?> errorText;

  /// Function called when loading has completed
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
        initialData: '', // Empty data string to initiate a loading screen
        future: errorText,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return AlertDialog(
                title: snapshot.data!.isNotEmpty ? const Text('ERROR') : null,
                content: snapshot.data!.isNotEmpty
                    ? Text(snapshot.data!)
                    : Row(children: const <Widget>[
                        CircularProgressIndicator.adaptive(),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Text('Loading...'))
                      ]),
                actions: snapshot.data!.isNotEmpty
                    ? <Widget>[
                        TextButton.icon(
                            icon: const Icon(Icons.refresh),
                            onPressed: () =>
                                Navigator.of(context).pop<bool>(false),
                            // Closes the loading screen and returns false
                            label: const Text('TRY AGAIN'))
                      ]
                    : null);
          }
          return Builder(builder: (context) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pop<bool>(
                  true); // Closes the Loading Screen and returns true
              final call = callback ?? () {};
              call();
            });
            return nil;
          });
        });
  }
}
