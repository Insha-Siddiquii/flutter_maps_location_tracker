import 'package:flutter/material.dart';
import 'package:flutter_app_location_tracker/application/style/colors.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: .0,
      left: .0,
      right: .0,
      child: CircleAvatar(
        radius: 55,
        backgroundColor: AppColors.appBlack,
        child: CircleAvatar(
          radius: 54,
          backgroundImage: AssetImage(
            'assets/avatar.png',
          ),
        ),
      ),
    );
  }
}
