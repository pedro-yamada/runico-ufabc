import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class qrCode extends StatelessWidget {
  final String qrData;

  qrCode({required this.qrData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFCC00),
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Utilize o Qr Code abaixo',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              color: Colors.white,
              width: 200.0,
              height: 200.0,
              child: Center(
                child: QrImage(
                  data: 'seu_dado_do_QR_Code',
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}