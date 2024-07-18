import 'package:equatable/equatable.dart';
import 'package:nokhte_backend/tables/user_information.dart';

class UserFlagParam extends Equatable {
  final UserFlagKeys key;
  final bool value;

  const UserFlagParam({
    required this.key,
    required this.value,
  });

  String get keyStr {
    switch (key) {
      case UserFlagKeys.hasEnteredStorage:
        return UserInformationConstants.S_HAS_ENTERED_STORAGE;
      case UserFlagKeys.hasAccessedQrCodeScanner:
        return UserInformationConstants.S_HAS_ACCESSED_QR_CODE_SCANNER;
    }
  }

  @override
  List<Object> get props => [key, value];
}

enum UserFlagKeys { hasEnteredStorage, hasAccessedQrCodeScanner }
