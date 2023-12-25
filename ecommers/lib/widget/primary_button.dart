import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, required this.onPressed, required this.title});
  final void Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.maxFinite,
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
          )),
    );
  }
}
