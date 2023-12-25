import 'package:ecommers/constants/routes.dart';
import 'package:ecommers/screens/auth_ui/login.dart';
import 'package:ecommers/screens/auth_ui/sign_up.dart';
import 'package:ecommers/widget/primary_button.dart';
import 'package:ecommers/widget/top_titles.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TopTitles(
                          heading: 'Welcome',
                          tittle: 'Buy any Itmes using this app'),
                      const SizedBox(
                        height: 50,
                      ),
                      Image.asset('assets/images/welcome.png'),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 50,
                              width: 50,
                              child:
                                  Image.asset('assets/images/gogleImage.png')),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.asset('assets/images/facebook.png'),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      PrimaryButton(
                        onPressed: () {
                          Routes.instance.push(const LoginScreen(), context);
                        },
                        title: 'Login',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PrimaryButton(
                          onPressed: () {
                            Routes.instance.push(const SignUp(), context);
                          },
                          title: 'SignUp')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
