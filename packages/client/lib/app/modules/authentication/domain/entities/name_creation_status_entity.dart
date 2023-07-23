/// name_creation_status_entity.dart
/// Proofreading Information:
///   - Proofreader: Sonny Vesali
///   - Date: July 23rd 2023
///
/// Author: Sonny Vesali
///
/// This file defines the [NameCreationStatusEntity] class, an entity that represents
/// the status of a name creation process in the application. The [NameCreationStatusEntity]
/// extends the [DefaultDBStatusEntity] class, which is a generalization of entities used
/// for common database call status representation.
///
/// The [NameCreationStatusEntity] contains the following property:
/// - [isSent]: A boolean value indicating whether the name creation data has
///   been successfully sent to the database (true) or not (false).
///
/// The [NameCreationStatusEntity] is an immutable class, and it extends
/// [DefaultDBStatusEntity] to inherit the common status representation
/// features.

import 'package:primala/app/core/entities/default_db_status_entity.dart';

class NameCreationStatusEntity extends DefaultDBStatusEntity {
  /// Constructs a [NameCreationStatusEntity] instance with the specified [isSent] status.
  const NameCreationStatusEntity({required isSent}) : super(isSent: isSent);
}
