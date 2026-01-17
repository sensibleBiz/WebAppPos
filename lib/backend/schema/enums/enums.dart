import 'package:collection/collection.dart';

/// Login Status Enum for QR Session
enum LoginStatus {
  pending,
  logged_in,
  logged_out,
}

enum CallLogStatus {
  incoming,
  outgoing,
  missed,
  rejected,
}

enum SubscriptionModules {
  Attendance,
  ComplaintsManagement,
}

enum PaymentStatus {
  SUCCESS,
  PENDING,
  FAILED,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (LoginStatus):
      return LoginStatus.values.deserialize(value) as T?;
    case (CallLogStatus):
      return CallLogStatus.values.deserialize(value) as T?;
    case (SubscriptionModules):
      return SubscriptionModules.values.deserialize(value) as T?;
    case (PaymentStatus):
      return PaymentStatus.values.deserialize(value) as T?;
    default:
      return null;
  }
}
