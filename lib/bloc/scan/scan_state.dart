part of 'scan_bloc.dart';

@immutable
abstract class ScanState {}

class ScanInitial extends ScanState {}

class ScanInProgress extends ScanState {}

class ScanCompleted extends ScanState {
  final String code;

  ScanCompleted(this.code);
}
