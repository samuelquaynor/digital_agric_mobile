import 'package:flutter/material.dart';

import '../../../../core/data/images.dart';
import '../../../../core/presentation/pages/loading.dart';
import '../../../../core/user/domain/entities/user.dart';
import '../../../../injection_container.dart';
import '../../../login/presentation/pages/login_page.dart';
import '../bloc/settings_bloc.dart';
import '../widgets/change_password.dart';
import '../widgets/change_phone.dart';
import '../widgets/edit_profile.dart';
import '../widgets/profile_image.dart';

/// Settings Page
class SettingsPage extends StatefulWidget {
  /// Constructor
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final bloc = sl<SettingsBloc>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            title: Text('Settings',
                style: Theme.of(context).textTheme.titleMedium)),
        body: SafeArea(
            child: FutureBuilder<UserEntity?>(
                future: bloc.retrieveUserBloc(),
                initialData: UserEntity.initial(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          SettingsProfileImage(
                            onChange: () async {
                              final loading = await showDialog<bool>(
                                  context: context,
                                  builder: (context) => LoadingPage(
                                      errorText: bloc.changeAvatar()));
                              if (loading ?? false) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'You have changed your avatar.')));
                                setState(() {});
                              }
                            },
                            avatarUrl: snapshot.requireData?.avatar ?? 'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1931&q=80',
                          ),
                          Text(snapshot.requireData?.name ?? '',
                              style: Theme.of(context).textTheme.headline6),
                          Text(snapshot.requireData?.email ?? '',
                              style: Theme.of(context).textTheme.subtitle1),
                          // if (snapshot.requireData.vip)
                          //   SvgPicture.asset(SvgAssets.vip, width: 30),
                          //Only for Precious
                          // if (snapshot.requireData.id.contains('246'))
                          //   Text('Made with ❤️ from Gbenga',
                          //       style: Theme.of(context).textTheme.subtitle1),
                          Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Text('Account',
                                  style:
                                      Theme.of(context).textTheme.headline6)),
                          SizedBox(
                              width: size.width * 0.9,
                              child: ListTile(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20))),
                                  tileColor: Colors.grey.withOpacity(0.1),
                                  onTap: () => Navigator.push<void>(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const EditProfile())),
                                  leading: const Icon(Icons.mode_edit),
                                  title: const Text('Edit Profile'),
                                  trailing:
                                      const Icon(Icons.arrow_forward_ios))),
                          SizedBox(
                              width: size.width * 0.9,
                              child: ListTile(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(20))),
                                  tileColor: Colors.grey.withOpacity(0.1),
                                  onTap: () => Navigator.push<void>(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ChangePhone())),
                                  leading: const Icon(Icons.phone),
                                  title: const Text('Change Phone'),
                                  trailing:
                                      const Icon(Icons.arrow_forward_ios))),
                          Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Text('Security',
                                  style:
                                      Theme.of(context).textTheme.headline6)),
                          SizedBox(
                              width: size.width * 0.9,
                              child: ListTile(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  tileColor: Colors.grey.withOpacity(0.1),
                                  onTap: () => Navigator.push<void>(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ChangePassword())),
                                  leading: const Icon(Icons.lock),
                                  title: const Text('Change Password'),
                                  trailing:
                                      const Icon(Icons.arrow_forward_ios))),
                          // Container(
                          //     alignment: Alignment.centerLeft,
                          //     padding: const EdgeInsets.symmetric(
                          //         horizontal: 20, vertical: 20),
                          //     child: Text('Support',
                          //         style:
                          //             Theme.of(context).textTheme.headline6)),
                          // SizedBox(
                          //     width: size.width * 0.9,
                          //     child: ListTile(
                          //         shape: const RoundedRectangleBorder(
                          //             borderRadius: BorderRadius.vertical(
                          //                 top: Radius.circular(20))),
                          //         tileColor: Colors.grey.withOpacity(0.1),
                          //         // onTap: () => showModalBottomSheet<void>(
                          //         //     context: context,
                          //         //     builder: (context) =>
                          //         //         CustomerCareBottomSheet(bloc: bloc)),
                          //         leading: const Icon(Icons.support_agent),
                          //         title: const Text('Contact Heny'),
                          //         trailing:
                          //             const Icon(Icons.arrow_forward_ios))),
                          // SizedBox(
                          //     width: size.width * 0.9,
                          //     child: ListTile(
                          //         tileColor: Colors.grey.withOpacity(0.1),
                          //         // onTap: () =>
                          //         //     bloc.openBrowser('https://heny.app/'),
                          //         leading: const Icon(Icons.info),
                          //         title: const Text('About Heny'),
                          //         trailing:
                          //             const Icon(Icons.arrow_forward_ios))),
                          // SizedBox(
                          //     width: size.width * 0.9,
                          //     child: ListTile(
                          //         tileColor: Colors.grey.withOpacity(0.1),
                          //         // onTap: () => bloc.openBrowser(
                          //         //     'https://www.instagram.com/heny.app/'),
                          //         leading: SvgPicture.asset(SvgAssets.instagram,
                          //             height: 20, width: 20),
                          //         title: const Text('Instagram'),
                          //         trailing:
                          //             const Icon(Icons.arrow_forward_ios))),
                          // SizedBox(
                          //     width: size.width * 0.9,
                          //     child: ListTile(
                          //         tileColor: Colors.grey.withOpacity(0.1),
                          //         // onTap: () => bloc.openBrowser(
                          //         //     'https://twitter.com/HenyApp'),
                          //         leading: SvgPicture.asset(SvgAssets.twitter,
                          //             height: 20, width: 20),
                          //         title: const Text('Twitter'),
                          //         trailing:
                          //             const Icon(Icons.arrow_forward_ios))),
                          // SizedBox(
                          //     width: size.width * 0.9,
                          //     child: ListTile(
                          //         tileColor: Colors.grey.withOpacity(0.1),
                          //         shape: const RoundedRectangleBorder(
                          //             borderRadius: BorderRadius.vertical(
                          //                 bottom: Radius.circular(20))),
                          //         // onTap: () => bloc.openBrowser(
                          //         //     'https://www.tiktok.com/@heny.app'),
                          //         leading: SvgPicture.asset(SvgAssets.tiktok,
                          //             height: 20, width: 20),
                          //         title: const Text('Tiktok'),
                          //         trailing:
                          //             const Icon(Icons.arrow_forward_ios))),
                          // Container(
                          //     alignment: Alignment.centerLeft,
                          //     padding: const EdgeInsets.symmetric(
                          //         horizontal: 20, vertical: 20),
                          //     child: Text('Legal',
                          //         style:
                          //             Theme.of(context).textTheme.headline6)),
                          // SizedBox(
                          //     width: size.width * 0.9,
                          //     child: ListTile(
                          //         tileColor: Colors.grey.withOpacity(0.1),
                          //         shape: const RoundedRectangleBorder(
                          //             borderRadius: BorderRadius.vertical(
                          //                 top: Radius.circular(20))),
                          //         // onTap: () => bloc
                          //         //     .openBrowser('https://heny.app/privacy'),
                          //         leading: const Icon(Icons.privacy_tip_sharp),
                          //         title: const Text('Privacy Policy'),
                          //         trailing:
                          //             const Icon(Icons.arrow_forward_ios))),
                          // SizedBox(
                          //     width: size.width * 0.9,
                          //     child: ListTile(
                          //         tileColor: Colors.grey.withOpacity(0.1),
                          //         shape: const RoundedRectangleBorder(
                          //             borderRadius: BorderRadius.vertical(
                          //                 bottom: Radius.circular(20))),
                          //         // onTap: () => bloc.openBrowser(
                          //         //     'https://heny.app/terms-condition'),
                          //         leading: const Icon(Icons.file_present),
                          //         title: const Text('Terms and Conditions'),
                          //         trailing:
                          //             const Icon(Icons.arrow_forward_ios))),
                          SizedBox(
                              width: size.width * 0.9,
                              child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: ListTile(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      tileColor: Colors.grey.withOpacity(0.1),
                                      onTap: () => showDialog<void>(
                                          context: context,
                                          builder: (context) => LoadingPage(
                                              errorText: bloc.logoutUser(),
                                              callback: () => Navigator.of(context)
                                                  .push(MaterialPageRoute<void>(
                                                      builder: (context) =>
                                                          const LoginPage())))),
                                      leading: const Icon(Icons.logout),
                                      title: const Text('Logout'),
                                      trailing:
                                          const Icon(Icons.arrow_forward_ios)))),
                          Image.asset(Images.logoTextBlack,
                              height: 50, width: 50, fit: BoxFit.cover),
                          Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text('©  DigiFarms Solutions, Inc.',
                                  style: Theme.of(context).textTheme.subtitle1))
                        ]));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                })));
  }
}
