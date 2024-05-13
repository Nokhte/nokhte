import 'package:equatable/equatable.dart';

class UserMetadataEntity extends Equatable {
  final bool hasUsedTrial;
  final bool isSubscribed;

  const UserMetadataEntity({
    required this.hasUsedTrial,
    required this.isSubscribed,
  });

  @override
  List<Object> get props => [hasUsedTrial, isSubscribed];

  factory UserMetadataEntity.fromSupabase(List res) {
    if (res.isEmpty) {
      return const UserMetadataEntity(hasUsedTrial: false, isSubscribed: false);
    } else {
      return UserMetadataEntity(
          hasUsedTrial: res.first["has_used_trial"],
          isSubscribed: res.first["is_subscribed"]);
    }
  }
}
