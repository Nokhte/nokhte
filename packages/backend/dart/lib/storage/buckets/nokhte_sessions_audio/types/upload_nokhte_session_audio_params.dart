import 'dart:io';
import 'package:equatable/equatable.dart';

class UploadNokhteSessionAudioParams extends Equatable {
  final String audioID;
  final File file;

  UploadNokhteSessionAudioParams({
    required this.audioID,
    required this.file,
  });

  @override
  List<Object> get props => [audioID, file];
}
