import 'package:equatable/equatable.dart';

class DefaultUsernameEntity extends Equatable {
  final String defaultUsername;

  const DefaultUsernameEntity({required this.defaultUsername});

  @override
  List<Object> get props => [defaultUsername];
}
