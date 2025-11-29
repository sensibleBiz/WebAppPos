import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ModuleSubscriptionRecord extends FirestoreRecord {
  ModuleSubscriptionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "createdDate" field.
  int? _createdDate;

  /// Unix Timestamp
  int get createdDate => _createdDate ?? 0;
  bool hasCreatedDate() => _createdDate != null;

  // "updatedDate" field.
  int? _updatedDate;
  int get updatedDate => _updatedDate ?? 0;
  bool hasUpdatedDate() => _updatedDate != null;

  // "renewalDate" field.
  int? _renewalDate;
  int get renewalDate => _renewalDate ?? 0;
  bool hasRenewalDate() => _renewalDate != null;

  // "transactionId" field.
  String? _transactionId;
  String get transactionId => _transactionId ?? '';
  bool hasTransactionId() => _transactionId != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "permittedUsers" field.
  int? _permittedUsers;
  int get permittedUsers => _permittedUsers ?? 0;
  bool hasPermittedUsers() => _permittedUsers != null;

  // "activeUserIds" field.
  List<String>? _activeUserIds;
  List<String> get activeUserIds => _activeUserIds ?? const [];
  bool hasActiveUserIds() => _activeUserIds != null;

  // "name" field.
  SubscriptionModules? _name;
  SubscriptionModules? get name => _name;
  bool hasName() => _name != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _updatedDate = castToType<int>(snapshotData['updatedDate']);
    _renewalDate = castToType<int>(snapshotData['renewalDate']);
    _transactionId = snapshotData['transactionId'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _isActive = snapshotData['isActive'] as bool?;
    _permittedUsers = castToType<int>(snapshotData['permittedUsers']);
    _activeUserIds = getDataList(snapshotData['activeUserIds']);
    _name = snapshotData['name'] is SubscriptionModules
        ? snapshotData['name']
        : deserializeEnum<SubscriptionModules>(snapshotData['name']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('MODULE_SUBSCRIPTION')
          : FirebaseFirestore.instance.collectionGroup('MODULE_SUBSCRIPTION');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('MODULE_SUBSCRIPTION').doc(id);

  static Stream<ModuleSubscriptionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ModuleSubscriptionRecord.fromSnapshot(s));

  static Future<ModuleSubscriptionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ModuleSubscriptionRecord.fromSnapshot(s));

  static ModuleSubscriptionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ModuleSubscriptionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ModuleSubscriptionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ModuleSubscriptionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ModuleSubscriptionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ModuleSubscriptionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createModuleSubscriptionRecordData({
  String? id,
  int? createdDate,
  int? updatedDate,
  int? renewalDate,
  String? transactionId,
  double? amount,
  bool? isActive,
  int? permittedUsers,
  SubscriptionModules? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'createdDate': createdDate,
      'updatedDate': updatedDate,
      'renewalDate': renewalDate,
      'transactionId': transactionId,
      'amount': amount,
      'isActive': isActive,
      'permittedUsers': permittedUsers,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class ModuleSubscriptionRecordDocumentEquality
    implements Equality<ModuleSubscriptionRecord> {
  const ModuleSubscriptionRecordDocumentEquality();

  @override
  bool equals(ModuleSubscriptionRecord? e1, ModuleSubscriptionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.createdDate == e2?.createdDate &&
        e1?.updatedDate == e2?.updatedDate &&
        e1?.renewalDate == e2?.renewalDate &&
        e1?.transactionId == e2?.transactionId &&
        e1?.amount == e2?.amount &&
        e1?.isActive == e2?.isActive &&
        e1?.permittedUsers == e2?.permittedUsers &&
        listEquality.equals(e1?.activeUserIds, e2?.activeUserIds) &&
        e1?.name == e2?.name;
  }

  @override
  int hash(ModuleSubscriptionRecord? e) => const ListEquality().hash([
        e?.id,
        e?.createdDate,
        e?.updatedDate,
        e?.renewalDate,
        e?.transactionId,
        e?.amount,
        e?.isActive,
        e?.permittedUsers,
        e?.activeUserIds,
        e?.name
      ]);

  @override
  bool isValidKey(Object? o) => o is ModuleSubscriptionRecord;
}
