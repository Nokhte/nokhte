import 'package:primala/app/modules/p2p_request_recipient/domain/entities/p2p_recipient_request_entity.dart';
import 'package:primala/app/modules/p2p_request_recipient/domain/entities/p2p_recipient_request_presentational_entity.dart';
import 'utc_dates.dart';

class SampleDataSourceResonses {
  static List<dynamic> get recipientRequestList => [
        {
          'request_id': '82cc910c-9bd7-447a-857a-255a288fa7d0',
          'sender_id': '3ad354ef-0671-479c-aea2-686c28636d8d',
          'receiver_id': '4f899180-dfe5-43e5-afd0-ab5b2c2f985a',
          'sent_at': UTCDates.oneMinuteBefore,
          'responded_at': null,
          'is_accepted': false,
          'usernames': {'username': 'tester1'}
        },
        {
          'request_id': '82cc910c-9bd7-447a-857a-255a288fa7d0',
          'sender_id': '3ad354ef-0671-479c-aea2-686c28636d8d',
          'receiver_id': '4f899180-dfe5-43e5-afd0-ab5b2c2f985a',
          'sent_at': UTCDates.tenMinutesBefore,
          'responded_at': null,
          'is_accepted': false,
          'usernames': {'username': 'tester2'}
        },
        {
          'request_id': '82cc910c-9bd7-447a-857a-255a288fa7d0',
          'sender_id': '3ad354ef-0671-479c-aea2-686c28636d8d',
          'receiver_id': '4f899180-dfe5-43e5-afd0-ab5b2c2f985a',
          'sent_at': UTCDates.oneHourBefore,
          'responded_at': null,
          'is_accepted': false,
          'usernames': {'username': 'tester3'}
        },
        {
          'request_id': '82cc910c-9bd7-447a-857a-255a288fa7d0',
          'sender_id': '3ad354ef-0671-479c-aea2-686c28636d8d',
          'receiver_id': '4f899180-dfe5-43e5-afd0-ab5b2c2f985a',
          'sent_at': UTCDates.twoHoursBefore,
          'responded_at': null,
          'is_accepted': false,
          'usernames': {'username': 'tester4'}
        },
        {
          'request_id': '82cc910c-9bd7-447a-857a-255a288fa7d0',
          'sender_id': '3ad354ef-0671-479c-aea2-686c28636d8d',
          'receiver_id': '4f899180-dfe5-43e5-afd0-ab5b2c2f985a',
          'sent_at': UTCDates.oneDayBefore,
          'responded_at': null,
          'is_accepted': false,
          'usernames': {'username': 'tester5'}
        },
        {
          'request_id': '82cc910c-9bd7-447a-857a-255a288fa7d0',
          'sender_id': '3ad354ef-0671-479c-aea2-686c28636d8d',
          'receiver_id': '4f899180-dfe5-43e5-afd0-ab5b2c2f985a',
          'sent_at': UTCDates.twoDaysBefore,
          'responded_at': null,
          'is_accepted': false,
          'usernames': {'username': 'tester6'}
        }
      ];

  static List<P2PRecipientRequest> get recipientReqList => [
        P2PRecipientRequest(
          senderUsername: 'tester1',
          timestampz: UTCDates.oneMinuteBefore,
        ),
        P2PRecipientRequest(
          senderUsername: 'tester2',
          timestampz: UTCDates.tenMinutesBefore,
        ),
        P2PRecipientRequest(
          senderUsername: 'tester3',
          timestampz: UTCDates.oneHourBefore,
        ),
        P2PRecipientRequest(
          senderUsername: 'tester4',
          timestampz: UTCDates.twoHoursBefore,
        ),
        P2PRecipientRequest(
          senderUsername: 'tester5',
          timestampz: UTCDates.oneDayBefore,
        ),
        P2PRecipientRequest(
          senderUsername: 'tester6',
          timestampz: UTCDates.twoDaysBefore,
        ),
      ];
  static List<dynamic> get emptyResponse => [];

  static List<P2PPresentationalRecipientRequest> get formattedRelativeTimes => [
        const P2PPresentationalRecipientRequest(
          relativeTimeString: '1 minute ago',
          senderUsername: 'tester1',
        ),
        const P2PPresentationalRecipientRequest(
          relativeTimeString: '10 minutes ago',
          senderUsername: 'tester2',
        ),
        const P2PPresentationalRecipientRequest(
          relativeTimeString: '1 hour ago',
          senderUsername: 'tester3',
        ),
        const P2PPresentationalRecipientRequest(
          relativeTimeString: '2 hours ago',
          senderUsername: 'tester4',
        ),
        const P2PPresentationalRecipientRequest(
          relativeTimeString: '1 day ago',
          senderUsername: 'tester5',
        ),
        const P2PPresentationalRecipientRequest(
          relativeTimeString: '2 days ago',
          senderUsername: 'tester6',
        )
      ];
}
