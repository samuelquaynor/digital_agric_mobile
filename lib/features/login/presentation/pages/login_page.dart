import 'package:flutter/material.dart';

import '../../../../core/presentation/pages/loading.dart';
import '../../../../core/util/validator.dart';
import '../../../../injection_container.dart';
import '../../../home/presentation/pages/home.dart';
import '../../../signup/presentation/pages/signup_page.dart';
import '../bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  /// Constructor
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  late String emailText, passwordText;

  // ObscureText ternary
  final obscureLoginPasswordText = ValueNotifier<bool>(true);
  final bloc = sl<LoginBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(shrinkWrap: true, children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Image.asset('assets/images/sprout.png',
                height: 130, width: 130, fit: BoxFit.cover),
          ),
          const Text('Welcome Back',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  height: 1.5)),
          const Text(
            'Sign in with your email and password',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        ],
      ),
      Container(
          height: MediaQuery.of(context).size.height * 5.5,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 84),
          child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        padding:
                            const EdgeInsets.only(left: 14, right: 14, top: 4),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFFE9E9E9)),
                        ),
                        child: TextFormField(
                            onSaved: (value) => emailText = value!,
                            validator: Validator.email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                border: InputBorder.none,
                                hintText: 'Enter your email',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF9D9D9D))))),
                    ValueListenableBuilder<bool>(
                        valueListenable: obscureLoginPasswordText,
                        builder: (context, result, child) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.only(
                                  left: 14, right: 14, top: 4),
                              margin: const EdgeInsets.only(bottom: 24),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: const Color(0xFFE9E9E9)),
                              ),
                              child: TextFormField(
                                  style: const TextStyle(
                                      fontSize: 14, fontFamily: 'poppins'),
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: obscureLoginPasswordText.value,
                                  onSaved: (value) => passwordText = value!,
                                  validator: Validator.password,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () =>
                                              obscureLoginPasswordText.value =
                                                  !obscureLoginPasswordText
                                                      .value,
                                          icon: Icon(
                                              obscureLoginPasswordText.value
                                                  ? Icons.visibility
                                                  : Icons.visibility_off)),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      border: InputBorder.none,
                                      hintText: 'Password',
                                      hintStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF9D9D9D)))));
                        }),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                          formKey.currentState!.save();
                          return showDialog(
                              context: context,
                              builder: (context) => LoadingPage(
                                  errorText:
                                      bloc.loginUser(emailText, passwordText),
                                  callback: () => Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                          builder: (context) =>
                                              const HomeScreen()))));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade500,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(top: 4),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account?"),
                              TextButton(
                                  onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                          builder: (context) =>
                                              const SignUpPage())),
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.green,
                                  ),
                                  child: const Text('Sign up.'))
                            ]))
                  ])))
    ]));
  }
}
