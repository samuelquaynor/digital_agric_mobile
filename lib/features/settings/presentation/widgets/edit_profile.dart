import 'package:flutter/material.dart';

import '../../../../core/presentation/pages/loading.dart';
import '../../../../core/util/validator.dart';
import '../../../../injection_container.dart';
import '../bloc/settings_bloc.dart';

/// EditProfile page
class EditProfile extends StatefulWidget {
  /// Constructor
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late String emailText, nameText;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final bloc = sl<SettingsBloc>();

  @override
  void initState() {
    super.initState();
    initNameEmail();
  }

  Future<void> initNameEmail() async {
    final user = await bloc.retrieveUserBloc();
    setState(() {
      emailController.text = user.email;
      nameController.text = user.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
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
                            vertical: 20, horizontal: 10),
                        child: TextFormField(
                            keyboardType: TextInputType.text,
                            validator: Validator.name,
                            controller: nameController,
                            onSaved: (value) => nameText = value!,
                            decoration:
                                const InputDecoration(labelText: 'Your Name'))),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: Validator.email,
                            controller: emailController,
                            onSaved: (value) => emailText = value!,
                            decoration:
                                const InputDecoration(labelText: 'Email'))),
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () async {
                              if (!formKey.currentState!.validate()) {
                                return;
                              }
                              formKey.currentState!.save();
                              return showDialog<void>(
                                  context: context,
                                  builder: (context) => LoadingPage(
                                      errorText: bloc.changeNameEmail(
                                          email: emailText, name: nameText),
                                      callback: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Your name and email has been changed successfully')));
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
