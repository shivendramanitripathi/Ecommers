import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16,
  );
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Builder(builder: (context) {
      return SizedBox(
        width: 100,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const CircularProgressIndicator(
            color: Colors.red,
          ),
          const SizedBox(
            height: 18.0,
          ),
          Container(
              margin: const EdgeInsets.only(left: 8),
              child: const Text('Loading....'))
        ]),
      );
    }),
  );
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}

String getMessageFromErrorCode(String errorCode) {
  switch (errorCode) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
      return "Email already used Go to login page.";
    case "account-exists-with-different-credential":
      return "Email already used Go to login page.";
    case "email-already-in-use":
      return "Email already used Gp to login page.";
    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      return "Wrong Password";
    case "ERROR_USER_NOT_FOUND":
      return "No user found with this email";
    default:
      return "Login failed,Please try again.";
  }
}

bool loginValidation(String email, password) {
  if (email.isEmpty && password.isEmpty) {
    showMessage('Email and Password Required ');
    return false;
  }
  if (email.isEmpty) {
    showMessage('Email is empty');
    return false;
  }
  if (password.isEmpty) {
    showMessage('Password is empty');
    return false;
  } else {
    return true;
  }
}

bool signUpValidation(
    String email, String password, String name, String phone, String address) {
  if (email.isEmpty &&
      password.isEmpty &&
      name.isEmpty &&
      phone.isEmpty &&
      address.isEmpty) {
    showMessage('All Feilds are empty');
    return false;
  }
  if (email.isEmpty) {
    showMessage('Email is empty');
    return false;
  }
  if (password.isEmpty) {
    showMessage('Password is empty');
    return false;
  }
  if (phone.isEmpty) {
    showMessage('Phone is empty');
    return false;
  }
  if (name.isEmpty) {
    showMessage('Name is empty');
    return false;
  }
  if (address.isEmpty) {
    showMessage('Address is empty');
    return false;
  } else {
    return true;
  }
}
