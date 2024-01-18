import 'package:equatable/equatable.dart';

class ChannelIdEntity extends Equatable {
  final String channelId;

  const ChannelIdEntity({
    required this.channelId,
  });

  factory ChannelIdEntity.initial() => const ChannelIdEntity(channelId: '');

  @override
  List<Object> get props => [channelId];
}
