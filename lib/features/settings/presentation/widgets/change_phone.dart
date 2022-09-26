import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/presentation/pages/loading.dart';
import '../../../../injection_container.dart';
import '../bloc/settings_bloc.dart';

/// Change Phone page
class ChangePhone extends StatefulWidget {
  /// Constructor
  const ChangePhone({super.key});

  @override
  State<ChangePhone> createState() => _ChangePhoneState();
}

class _ChangePhoneState extends State<ChangePhone> {
  late String phoneNumberText;

  final formKey = GlobalKey<FormState>();
  final _bloc = sl<SettingsBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Change Phone No'),
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              color: Colors.green.shade900,
              icon: const Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          child: IntlPhoneField(
                              initialCountryCode: 'GH',
                              onSaved: (value) => phoneNumberText =
                                  value!.completeNumber.replaceFirst('0', ''),
                              decoration: const InputDecoration(
                                  counter: SizedBox.shrink()))),
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () async {
                                // Push OTP page and check phone number first update phone number
                                if (!formKey.currentState!.validate()) {
                                  return;
                                }
                                formKey.currentState!.save();
                                return showDialog(
                                    context: context,
                                    builder: (context) => LoadingPage(
                                        errorText: _bloc
                                            .changePhoneNumber(phoneNumberText),
                                        callback: () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      'Your phone number has been changed successfully')));
                                          Navigator.of(context).pop();
                                        }));
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 100, vertical: 16)),
                              child: const Text('Confirm')))
                    ]))));
  }
}
