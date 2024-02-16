import 'dart:typed_data';
import 'package:equatable/equatable.dart';

class PathAndBytes extends Equatable {
  final Uint8List rawBytes;
  final String path;

  PathAndBytes({
    required this.path,
    required this.rawBytes,
  });

  @override
  List<Object> get props => [path, rawBytes];
}
