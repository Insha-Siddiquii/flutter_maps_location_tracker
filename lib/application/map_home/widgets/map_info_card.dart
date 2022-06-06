import 'package:flutter/material.dart';
import 'package:flutter_app_location_tracker/application/style/colors.dart';

class MapInfoCard extends StatelessWidget {
  const MapInfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 30, bottom: 0, left: 0, right: 0),
      color: AppColors.appPrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SizedBox(
        height: 350,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
