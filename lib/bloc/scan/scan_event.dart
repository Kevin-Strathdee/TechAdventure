part of 'scan_bloc.dart';

@immutable
abstract class ScanEvent {}

class ScanCodeDetected extends ScanEvent {
  ScanCodeDetected(this.code);
  final String code;
}

class ScanStarted extends ScanEvent {}

class ScanEnded extends ScanEvent {}
