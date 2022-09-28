import 'package:flutter/material.dart';

import '../../../../core/presentation/pages/loading.dart';
import '../../../../core/util/validator.dart';
import '../../../../injection_container.dart';
import '../../../home/presentation/pages/home.dart';
import '../../../login/presentation/pages/login_page.dart';
import '../bloc/signup_bloc.dart';

class SignUpPage extends StatefulWidget {
  /// Constructor
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  late String emailText, confirmPasswordText, passwordText;

  // ObscureText ternary
  final obscureLoginPasswordText = ValueNotifier<bool>(true);
  final obscureConfirmPasswordText = ValueNotifier<bool>(true);
  final bloc = sl<SignupBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            const Text('Register Account',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.5)),
            const Text(
              'Complete your details or continue \nwith social media',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Container(
                height: MediaQuery.of(context).size.height * 1,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 36, bottom: 84),
                child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                              left: 14, right: 14, top: 4),
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
                                  border: Border.all(
                                      color: const Color(0xFFE9E9E9)),
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
                      ValueListenableBuilder<bool>(
                          valueListenable: obscureConfirmPasswordText,
                          builder: (context, result, child) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.only(
                                    left: 14, right: 14, top: 4),
                                margin: const EdgeInsets.only(bottom: 24),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: const Color(0xFFE9E9E9)),
                                ),
                                child: TextFormField(
                                    style: const TextStyle(
                                        fontSize: 14, fontFamily: 'poppins'),
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText:
                                        obscureConfirmPasswordText.value,
                                    onSaved: (value) =>
                                        confirmPasswordText = value!,
                                    validator: (value) {
                                      formKey.currentState!.save();
                                      if (value != passwordText) {
                                        return 'Password does not match!';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                            onPressed: () =>
                                                obscureConfirmPasswordText
                                                        .value =
                                                    !obscureConfirmPasswordText
                                                        .value,
                                            icon: Icon(
                                                obscureConfirmPasswordText.value
                                                    ? Icons.visibility
                                                    : Icons.visibility_off)),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        border: InputBorder.none,
                                        hintText: 'Confirm Password',
                                        hintStyle: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF9D9D9D)))));
                          }),
                      const Text(
                          'By continuing your confirm that you agree \nwith our Terms and Conditions',
                          textAlign: TextAlign.center),
                      const SizedBox(height: 20),
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
                                        errorText: bloc.signUpUser(
                                            email: emailText,
                                            password: passwordText),
                                        callback: () => Navigator.of(context)
                                            .push(MaterialPageRoute<void>(
                                                builder: (context) =>
                                                    const HomeScreen()))));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green.shade500,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              child: const Text('Sign up',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)))),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(top: 4),
                          alignment: Alignment.center,
                          child: TextButton(
                              onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                      builder: (context) => const LoginPage())),
                              style: TextButton.styleFrom(
                                foregroundColor: const Color(0xFF9D9D9D),
                              ),
                              child: const Text(
                                  'Already have an account? Login..')))
                    ])))
          ])),
    ));
  }
}
