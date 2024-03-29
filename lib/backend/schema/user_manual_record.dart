import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserManualRecord extends FirestoreRecord {
  UserManualRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "headerName" field.
  String? _headerName;
  String get headerName => _headerName ?? '';
  bool hasHeaderName() => _headerName != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "createdDate" field.
  int? _createdDate;
  int get createdDate => _createdDate ?? 0;
  bool hasCreatedDate() => _createdDate != null;

  // "modifiedDate" field.
  int? _modifiedDate;
  int get modifiedDate => _modifiedDate ?? 0;
  bool hasModifiedDate() => _modifiedDate != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _headerName = snapshotData['headerName'] as String?;
    _isActive = snapshotData['isActive'] as bool?;
    _code = castToType<int>(snapshotData['code']);
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _modifiedDate = castToType<int>(snapshotData['modifiedDate']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('USER_MANUAL');

  static Stream<UserManualRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserManualRecord.fromSnapshot(s));

  static Future<UserManualRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserManualRecord.fromSnapshot(s));

  static UserManualRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserManualRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserManualRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserManualRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserManualRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserManualRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserManualRecordData({
  String? id,
  String? headerName,
  bool? isActive,
  int? code,
  int? createdDate,
  int? modifiedDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'headerName': headerName,
      'isActive': isActive,
      'code': code,
      'createdDate': createdDate,
      'modifiedDate': modifiedDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserManualRecordDocumentEquality implements Equality<UserManualRecord> {
  const UserManualRecordDocumentEquality();

  @override
  bool equals(UserManualRecord? e1, UserManualRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.headerName == e2?.headerName &&
        e1?.isActive == e2?.isActive &&
        e1?.code == e2?.code &&
        e1?.createdDate == e2?.createdDate &&
        e1?.modifiedDate == e2?.modifiedDate;
  }

  @override
  int hash(UserManualRecord? e) => const ListEquality().hash([
        e?.id,
        e?.headerName,
        e?.isActive,
        e?.code,
        e?.createdDate,
        e?.modifiedDate
      ]);

  @override
  bool isValidKey(Object? o) => o is UserManualRecord;
}
