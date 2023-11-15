import 'package:equatable/equatable.dart';

class StartAndEndPaths extends Equatable {
  final String startPath;
  final String endPath;
  StartAndEndPaths({
    required this.startPath,
    required this.endPath,
  });

  @override
  List<Object> get props => [startPath, endPath];
}
