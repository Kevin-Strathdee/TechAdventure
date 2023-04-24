import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  StreamSubscription<Barcode>? scannerStreamSubscription;

  @override
  void dispose() {
    scannerStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan"),
      ),
      body: Stack(
        children: [
          QRView(
            overlay: QrScannerOverlayShape(
              borderRadius: 8,
            ),
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(result?.code != null ? "${result?.code}" : "No code found"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    setState(() {
      scannerStreamSubscription = controller.scannedDataStream.listen((scanData) {
        setState(() {
          result = scanData;
        });
      });
    });
  }
}
