import 'package:flutter/material.dart';

import '../../../../core/presentation/pages/loading.dart';
import '../../../../core/util/validator.dart';
import '../../../../injection_container.dart';
import '../bloc/settings_bloc.dart';

/// Change password page
class ChangePassword extends StatefulWidget {
  /// Constructor
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late String passwordText, confirmPasswordText;
  final formKey = GlobalKey<FormState>();
  final bloc = sl<SettingsBloc>();

  // ObscureText ternary
  bool obscurePasswordText = true;
  bool obscureConfirmPasswordText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Change Password'),
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                color: Colors.green.shade900,
                icon: const Icon(Icons.arrow_back))),
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
                        child: TextFormField(
                            obscureText: obscurePasswordText,
                            keyboardType: TextInputType.visiblePassword,
                            onSaved: (value) => passwordText = value!,
                            validator: Validator.password,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                suffixIcon: IconButton(
                                    onPressed: () => setState(() =>
                                        obscurePasswordText =
                                            !obscurePasswordText),
                                    icon: Icon(
                                      obscurePasswordText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey,
                                    ))))),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        child: TextFormField(
                            obscureText: obscureConfirmPasswordText,
                            onSaved: (value) => confirmPasswordText = value!,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              formKey.currentState!.save();
                              if (value != passwordText) {
                                return 'Password does not match!';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                suffixIcon: IconButton(
                                    onPressed: () => setState(() =>
                                        obscureConfirmPasswordText =
                                            !obscureConfirmPasswordText),
                                    icon: Icon(
                                        obscureConfirmPasswordText
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey))))),
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () async {
                              if (!formKey.currentState!.validate()) {
                                return;
                              }
                              formKey.currentState!.save();
                              // Verify phone number
                              final user = await bloc.retrieveUserBloc();
                              return showDialog(
                                  context: context,
                                  builder: (context) => LoadingPage(
                                      errorText:
                                          bloc.changePassword(passwordText),
                                      callback: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Your password has been changed successfully')));
                                        Navigator.of(context).pop();
                                      }));
                            },
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 100, vertical: 16)),
                            child: const Text('Confirm')))
                  ]),
            )));
  }
}
