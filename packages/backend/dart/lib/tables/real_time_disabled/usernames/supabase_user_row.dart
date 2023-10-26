import 'package:equatable/equatable.dart';

class UsernamesRow extends Equatable {
  final String uid;
  final String firstName;
  final String lastName;

  UsernamesRow({
    required this.uid,
    required this.firstName,
    required this.lastName,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'first_name': firstName,
      'last_name': lastName,
    };
  }

  @override
  List<Object> get props => [
        uid,
        firstName,
        lastName,
      ];
}
