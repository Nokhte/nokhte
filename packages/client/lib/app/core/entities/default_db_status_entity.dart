import 'package:equatable/equatable.dart';

class DefaultDBStatusEntity extends Equatable {
  final bool isSent;

  const DefaultDBStatusEntity({required this.isSent});

  @override
  List<Object?> get props => [isSent];
}
