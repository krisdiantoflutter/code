import 'package:flutter/material.dart';

class ProdukRekomendasi extends StatefulWidget {
  @override
  _ProdukRekomendasiState createState() => _ProdukRekomendasiState();
}

class _ProdukRekomendasiState extends State<ProdukRekomendasi> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 44.0),
              child: Text(
                'Produk',
                style: TextStyle(
                    color: Colors.deepPurple[400], fontFamily: 'Comfortaa',fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'Rekomendasi',
              style:
                  TextStyle(color: Colors.yellow[800], fontFamily: 'Comfortaa',fontWeight: FontWeight.bold),
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
