import 'package:flutter/material.dart';

class TopTitles extends StatelessWidget {
  final String heading;
  final String tittle;
  const TopTitles({super.key, required this.heading, required this.tittle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: kToolbarHeight + 12,
        ),
        if (heading == 'Login' ||
            heading == 'Create Account' ||
            heading == 'View Item')
          InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back,
                size: 27,
              )),
        const SizedBox(
          height: 10,
        ),
        Text(
          heading,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          tittle,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
