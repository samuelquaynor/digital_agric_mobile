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
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 32),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Colors.greenAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/pattern-1-1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'DigiFarm',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 6,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 36, bottom: 84),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    child: Text('Sign up',
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 14, right: 14, top: 4),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFE9E9E9)),
                    ),
                    child: TextFormField(
                      onSaved: (value) => emailText = value!,
                      validator: Validator.email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        label: Text(
                          'Email',
                          style: TextStyle(
                            color: Color(0xFF9D9D9D),
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: InputBorder.none,
                        hintText: 'youremail@email.com',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF9D9D9D),
                        ),
                      ),
                    ),
                  ),
                  ValueListenableBuilder<bool>(
                      valueListenable: obscureLoginPasswordText,
                      builder: (context, result, child) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                              left: 14, right: 14, top: 4),
                          margin: const EdgeInsets.only(bottom: 24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFFE9E9E9)),
                          ),
                          child: TextFormField(
                            style: const TextStyle(
                                fontSize: 14, fontFamily: 'poppins'),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: obscureLoginPasswordText.value,
                            onSaved: (value) => passwordText = value!,
                            validator: Validator.password,
                            decoration: InputDecoration(
                              label: const Text(
                                'Password',
                                style: TextStyle(
                                  color: Color(0xFF9D9D9D),
                                ),
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () => obscureLoginPasswordText
                                      .value = !obscureLoginPasswordText.value,
                                  icon: Icon(obscureLoginPasswordText.value
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: InputBorder.none,
                              hintText: '*************',
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF9D9D9D),
                              ),
                            ),
                          ),
                        );
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
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFFE9E9E9)),
                          ),
                          child: TextFormField(
                            style: const TextStyle(
                                fontSize: 14, fontFamily: 'poppins'),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: obscureConfirmPasswordText.value,
                            onSaved: (value) => confirmPasswordText = value!,
                            validator: (value) {
                              formKey.currentState!.save();
                              if (value != passwordText) {
                                return 'Password does not match!';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: const Text(
                                'Confirm Password',
                                style: TextStyle(
                                  color: Color(0xFF9D9D9D),
                                ),
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () => obscureConfirmPasswordText
                                      .value = !obscureConfirmPasswordText.value,
                                  icon: Icon(obscureConfirmPasswordText.value
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: InputBorder.none,
                              hintText: '*************',
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF9D9D9D),
                              ),
                            ),
                          ),
                        );
                      }),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
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
                                    email: emailText, password: passwordText),
                                callback: () => Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                        builder: (context) =>
                                            const HomeScreen()))));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        elevation: 0,
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Sign up',
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
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute<void>(
                              builder: (context) => const LoginPage())),
                      style: TextButton.styleFrom(
                        primary: const Color(0xFF9D9D9D),
                      ),
                      child: const Text('Already have an accoount. Login'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
