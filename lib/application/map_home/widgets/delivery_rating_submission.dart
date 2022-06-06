import 'package:flutter/material.dart';

class DeliveryRatingSubmission extends StatelessWidget {
  const DeliveryRatingSubmission({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      right: -10,
      child: Container(
        height: 40,
        width: 180,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
          color: Colors.white,
        ),
        child: Row(
          children: const [
            SizedBox(
              width: 40,
            ),
            Text(
              'Submit',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              width: 50,
            ),
            Icon(Icons.arrow_forward)
          ],
        ),
      ),
    );
  }
}
