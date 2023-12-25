import 'package:ecommers/constants/constant.dart';
import 'package:ecommers/constants/routes.dart';
import 'package:ecommers/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:ecommers/screens/Home/home.dart';
import 'package:ecommers/screens/auth_ui/sign_up.dart';
import 'package:ecommers/widget/primary_button.dart';
import 'package:ecommers/widget/top_titles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isShowPassword = true;
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TopTitles(
                      heading: 'Login',
                      tittle: 'Welcome Back to Ecommerce app'),
                ],
              ),
              const SizedBox(
                height: 130,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailTextController,
                    decoration: const InputDecoration(
                        hintText: 'Email', prefixIcon: Icon(Icons.email)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: isShowPassword,
                    controller: passwordTextController,
                    decoration: InputDecoration(
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                isShowPassword = !isShowPassword;
                              });
                            },
                            child: const Icon(Icons.visibility)),
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.password)),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  PrimaryButton(
                      onPressed: () async {
                        bool isValidated = loginValidation(
                            emailTextController.text,
                            passwordTextController.text);
                        if (isValidated) {
                          bool isLogged = await FirebaseAuthHelper.instance
                              .login(emailTextController.text,
                                  passwordTextController.text, context);
                          if (isLogged) {
                            // ignore: use_build_context_synchronously
                            Routes.instance.pushAndRemoveUntil(
                                const HomeScreen(), context);
                          }
                        }
                      },
                      title: 'Login'),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: InkWell(
                          onTap: () {},
                          child: const Text(
                            "Don't have an account",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ))),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: InkWell(
                          onTap: () {
                            Routes.instance.push(const SignUp(), context);
                          },
                          child: const Text(
                            "Create an account",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue),
                          ))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
