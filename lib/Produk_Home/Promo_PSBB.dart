import 'package:flutter/material.dart';

class PromoPSBB extends StatefulWidget {
  @override
  _PromoPSBBState createState() => _PromoPSBBState();
}

class _PromoPSBBState extends State<PromoPSBB> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right:50),
              child: Text(
                'PROMO',
                style: TextStyle(
                    color: Colors.deepPurple[400], fontFamily: 'Comfortaa'),
              ),
            ),
            Text(
              'PSBB',
              style:
                  TextStyle(color: Colors.yellow[800], fontFamily: 'Comfortaa'),
            ),
          ],
        ),
        Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'tampilkan semuanya',
              style: TextStyle(fontFamily: 'Comfortaa', fontSize: 12),
            ),
            Icon(Icons.arrow_forward_ios_rounded, size: 12)
          ],
        ),
      ],
    );
  }
}
