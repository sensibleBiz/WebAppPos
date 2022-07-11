import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'payment_mode_record.g.dart';

abstract class PaymentModeRecord
    implements Built<PaymentModeRecord, PaymentModeRecordBuilder> {
  static Serializer<PaymentModeRecord> get serializer =>
      _$paymentModeRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get name;

  @nullable
  int get code;

  @nullable
  int get createdDate;

  @nullable
  DocumentReference get createdBy;

  @nullable
  int get updatedDate;

  @nullable
  DocumentReference get updatedBy;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PaymentModeRecordBuilder builder) => builder
    ..id = ''
    ..name = ''
    ..code = 0
    ..createdDate = 0
    ..updatedDate = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PAYMENT_MODE');

  static Stream<PaymentModeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PaymentModeRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PaymentModeRecord._();
  factory PaymentModeRecord([void Function(PaymentModeRecordBuilder) updates]) =
      _$PaymentModeRecord;

  static PaymentModeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPaymentModeRecordData({
  String id,
  String name,
  int code,
  int createdDate,
  DocumentReference createdBy,
  int updatedDate,
  DocumentReference updatedBy,
}) =>
    serializers.toFirestore(
        PaymentModeRecord.serializer,
        PaymentModeRecord((p) => p
          ..id = id
          ..name = name
          ..code = code
          ..createdDate = createdDate
          ..createdBy = createdBy
          ..updatedDate = updatedDate
          ..updatedBy = updatedBy));
