import 'package:equatable/equatable.dart';

class P2PRequestRecipientEntity extends Equatable {
  final bool exists;
  final bool duplicateSender;
  final bool duplicateRecipient;

  const P2PRequestRecipientEntity({
    required this.exists,
    required this.duplicateSender,
    required this.duplicateRecipient,
  });

  @override
  List<Object?> get props => [
        exists,
        duplicateRecipient,
        duplicateSender,
      ];
}
