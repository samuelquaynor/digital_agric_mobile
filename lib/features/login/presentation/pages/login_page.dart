import 'package:flutter/material.dart';

import '../../../home/presentation/pages/home.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.14,
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
            height: MediaQuery.of(context).size.height * 65 / 100,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 36, bottom: 84),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  child: Text('Log in',
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
                  child: const TextField(
                    // controller: controller.emailC,
                    decoration: InputDecoration(
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
                Material(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 14, right: 14, top: 4),
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFE9E9E9)),
                    ),
                    child: const TextField(
                      style: TextStyle(fontSize: 14, fontFamily: 'poppins'),
                      // controller: controller.passC,
                      // obscureText: controller.obsecureText.value,
                      decoration: InputDecoration(
                        label: Text(
                          'Password',
                          style: TextStyle(
                            color: Color(0xFF9D9D9D),
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: InputBorder.none,
                        hintText: '*************',
                        // suffixIcon: IconButton(
                        //   icon: (controller.obsecureText != false)
                        //       ? SvgPicture.asset('assets/svg/show.svg')
                        //       : SvgPicture.asset('assets/svg/hide.svg'),
                        //   onPressed: () {
                        //     controller.obsecureText.value =
                        //         !controller.obsecureText.value;
                        //   },
                        // ),
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF9D9D9D),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      await Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (context) => const HomeScreen()));
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
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () => null,
                    style: TextButton.styleFrom(
                      primary: const Color(0xFF9D9D9D),
                    ),
                    child: const Text('Forgot your password?'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
