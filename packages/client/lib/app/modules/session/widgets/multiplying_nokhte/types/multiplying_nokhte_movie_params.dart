import 'package:equatable/equatable.dart';
import 'types.dart';

class MultiplyingNokhteMovieParams extends Equatable {
  final MultiplyingNokhteMovieModes movieMode;
  final bool reverse;

  const MultiplyingNokhteMovieParams({
    required this.movieMode,
    this.reverse = false,
  });

  @override
  List<Object> get props => [movieMode, reverse];
}
