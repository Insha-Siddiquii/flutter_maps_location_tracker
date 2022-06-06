import 'package:flutter/material.dart';

class MapDeliveryTimeline extends StatelessWidget {
  const MapDeliveryTimeline({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<String> data;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 140,
      left: -160,
      child: SizedBox(
        height: 200,
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ...List.generate(
              data.length,
              (index) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(mainAxisSize: MainAxisSize.min, children: [
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == 0 ? Colors.black : Colors.white),
                    ),
                    if (index != 3)
                      Container(
                          height: 30.0,
                          width: 4.0,
                          color: index == 0 ? Colors.black : Colors.white),
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
