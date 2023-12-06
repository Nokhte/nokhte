import 'package:equatable/equatable.dart';

class FullAndRelativePath extends Equatable {
  final String fullPath;
  final String relativePath;
  const FullAndRelativePath({
    required this.fullPath,
    required this.relativePath,
  });

  @override
  List<Object> get props => [fullPath, relativePath];
}
