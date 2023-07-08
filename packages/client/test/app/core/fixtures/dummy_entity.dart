import 'package:equatable/equatable.dart';

class DummyEntity extends Equatable {
  final bool dummyBool;

  const DummyEntity({required this.dummyBool});

  @override
  List<Object> get props => [dummyBool];
}
