import 'package:equatable/equatable.dart';

class Error extends Equatable {
  final String errorMessage;
  const Error({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
