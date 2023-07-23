/// default_db_status_entity.dart
///
/// Author: Sonny Vesali
///
/// This file defines the [DefaultDBStatusEntity] class, an abstract entity that represents
/// the default status of a database call in the application. It is designed to be extended
/// by specific database call entities to provide a common representation for status data.
///
/// The [DefaultDBStatusEntity] contains the following property:
/// - [isSent]: A boolean value indicating the default status of a database call. Specific
///   entities that extend [DefaultDBStatusEntity] can use this property to represent their
///   respective status.
///
/// The [DefaultDBStatusEntity] is an immutable class, and it extends [Equatable] to enable
/// easy comparison of objects for equality.
import 'package:equatable/equatable.dart';

class DefaultDBStatusEntity extends Equatable {
  final bool isSent;

  const DefaultDBStatusEntity({required this.isSent});

  @override
  List<Object?> get props => [isSent];
}
