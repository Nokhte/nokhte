import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';

abstract class RecordingContract {
  Future<Either<Failure, bool>> startRecording(String path);
  Future<Either<Failure, File>> stopRecording(NoParams params);
}
