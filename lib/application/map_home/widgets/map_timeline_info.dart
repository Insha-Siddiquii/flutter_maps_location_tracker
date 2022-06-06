import 'package:flutter/material.dart';

class MapTimelineInfo extends StatelessWidget {
  const MapTimelineInfo({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<String> data;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 140,
      left: 60,
      child: SizedBox(
        height: 200,
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ...List.generate(
              data.length,
              (index) => Column(
                children: [
                  Text(
                    data[index],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 13,
                      color: index == 0 ? Colors.black : Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
