import 'package:flutter/material.dart';

class TipsKesehatan extends StatefulWidget {
  @override
  _TipsKesehatanState createState() => _TipsKesehatanState();
}

class _TipsKesehatanState extends State<TipsKesehatan> {
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
                'TIPS',
                style: TextStyle(
                    color: Colors.deepPurple[400], fontFamily: 'Comfortaa'),
              ),
            ),
            Text(
              'KESEHATAN',
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
