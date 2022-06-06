import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 120,
      left: 150,
      right: .0,
      child: Text(
        'Insha Siddiqui',
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      ),
    );
  }
}
