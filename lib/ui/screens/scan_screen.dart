import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:japomo/bloc/scan/scan_bloc.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  StreamSubscription<Barcode>? scannerStreamSubscription;

  @override
  void dispose() {
    scannerStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return QRView(
      overlay: QrScannerOverlayShape(
        borderRadius: 8,
      ),
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    BlocProvider.of<ScanBloc>(context).add(ScanStarted());
    setState(() {
      scannerStreamSubscription = controller.scannedDataStream.listen((scanData) {
        final code = scanData.code;
        if (code != null && BlocProvider.of<ScanBloc>(context).state is! ScanCompleted) {
          BlocProvider.of<ScanBloc>(context).add(ScanCodeDetected(code));
        }
      });
    });
  }
}
