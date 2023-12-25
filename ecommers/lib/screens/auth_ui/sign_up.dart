import 'package:ecommers/constants/constant.dart';
import 'package:ecommers/constants/routes.dart';
import 'package:ecommers/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:ecommers/screens/Home/home.dart';
import 'package:ecommers/widget/primary_button.dart';
import 'package:ecommers/widget/top_titles.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isShowPassword = true;
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopTitles(
                  heading: 'Create Account',
                  tittle: 'Welcome to Ecommerce app'),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: nameTextController,
                decoration: const InputDecoration(
                    hintText: 'Name',
                    prefixIcon: Icon(Icons.person_off_outlined)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailTextController,
                decoration: const InputDecoration(
                    hintText: 'Email', prefixIcon: Icon(Icons.email)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: phoneTextController,
                decoration: const InputDecoration(
                    hintText: 'Phone', prefixIcon: Icon(Icons.phone)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: addressTextController,
                decoration: const InputDecoration(
                    hintText: 'Address', prefixIcon: Icon(Icons.location_city)),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordTextController,
                obscureText: isShowPassword,
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
                height: 20,
              ),
              PrimaryButton(
                  onPressed: () async {
                    bool isValidated = signUpValidation(
                        emailTextController.text,
                        passwordTextController.text,
                        phoneTextController.text,
                        nameTextController.text,
                        addressTextController.text);
                    if (isValidated) {
                      bool isLogged = await FirebaseAuthHelper.instance.SignUp(
                          emailTextController.text,
                          passwordTextController.text,
                          addressTextController.text,
                          context);
                      if (isLogged) {
                        // ignore: use_build_context_synchronously
                        Routes.instance
                            .pushAndRemoveUntil(const HomeScreen(), context);
                      }
                    }
                  },
                  title: 'Create an account'),
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: InkWell(
                      onTap: () {},
                      child: const Text(
                        "I have already created an account?",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue),
                      ))),
              Center(
                  child: InkWell(
                      onTap: () {},
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
