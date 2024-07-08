import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppSettingsMasterRecord extends FirestoreRecord {
  AppSettingsMasterRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "display" field.
  String? _display;
  String get display => _display ?? '';
  bool hasDisplay() => _display != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "createdDate" field.
  int? _createdDate;
  int get createdDate => _createdDate ?? 0;
  bool hasCreatedDate() => _createdDate != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _display = snapshotData['display'] as String?;
    _id = snapshotData['id'] as String?;
    _code = castToType<int>(snapshotData['code']);
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _isDeleted = snapshotData['isDeleted'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('APP_SETTINGS_MASTER');

  static Stream<AppSettingsMasterRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppSettingsMasterRecord.fromSnapshot(s));

  static Future<AppSettingsMasterRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AppSettingsMasterRecord.fromSnapshot(s));

  static AppSettingsMasterRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppSettingsMasterRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppSettingsMasterRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppSettingsMasterRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppSettingsMasterRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppSettingsMasterRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppSettingsMasterRecordData({
  String? title,
  String? display,
  String? id,
  int? code,
  int? createdDate,
  bool? isDeleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'display': display,
      'id': id,
      'code': code,
      'createdDate': createdDate,
      'isDeleted': isDeleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppSettingsMasterRecordDocumentEquality
    implements Equality<AppSettingsMasterRecord> {
  const AppSettingsMasterRecordDocumentEquality();

  @override
  bool equals(AppSettingsMasterRecord? e1, AppSettingsMasterRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.display == e2?.display &&
        e1?.id == e2?.id &&
        e1?.code == e2?.code &&
        e1?.createdDate == e2?.createdDate &&
        e1?.isDeleted == e2?.isDeleted;
  }

  @override
  int hash(AppSettingsMasterRecord? e) => const ListEquality().hash(
      [e?.title, e?.display, e?.id, e?.code, e?.createdDate, e?.isDeleted]);

  @override
  bool isValidKey(Object? o) => o is AppSettingsMasterRecord;
}
