/// name_creation_status_model.dart
///
/// Author: Sonny Vesali
///
/// This file defines the [NameCreationStatusModel] class, which extends [NameCreationStatusEntity].
/// The [NameCreationStatusModel] is a model class that represents the status of the name creation process from the remote source.
/// It serves as an intermediate abstraction between the database query response and our application's domain logic.
///
/// The [NameCreationStatusModel] constructor takes a [bool] parameter, [isSent], and calls the constructor of [NameCreationStatusEntity]
/// to initialize the name creation status.
///
/// The [fromSupabase] factory method creates a [NameCreationStatusModel] instance from the provided [sbQueryRes], which is a list of dynamic
/// values from a Supabase query response. If the list is empty, it indicates that the name creation is not sent, and the method returns an instance
/// of [NameCreationStatusModel] with [isSent] set to false. Otherwise, it returns an instance with [isSent] set to true.
///
/// Similar to other models, the [NameCreationStatusModel] follows the dependency inversion principle, abstracting the status of the name creation
/// process into terms controlled by our application, thereby enhancing code maintainability and flexibility.

import 'package:primala/app/modules/authentication/domain/entities/name_creation_status_entity.dart';

class NameCreationStatusModel extends NameCreationStatusEntity {
  /// Constructs a [NameCreationStatusModel] instance with the specified
  /// [isSent] status.
  const NameCreationStatusModel({required bool isSent}) : super(isSent: isSent);

  /// Creates a [NameCreationStatusModel] from the provided [sbQueryRes] from a
  /// Supabase query response.
  static NameCreationStatusModel fromSupabase(List<dynamic> sbQueryRes) {
    if (sbQueryRes.isEmpty) {
      return const NameCreationStatusModel(isSent: false);
    } else {
      return const NameCreationStatusModel(isSent: true);
    }
  }
}
