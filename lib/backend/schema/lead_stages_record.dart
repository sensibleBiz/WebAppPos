import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadStagesRecord extends FirestoreRecord {
  LeadStagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "display" field.
  String? _display;
  String get display => _display ?? '';
  bool hasDisplay() => _display != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "tabColor" field.
  Color? _tabColor;
  Color? get tabColor => _tabColor;
  bool hasTabColor() => _tabColor != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _id = snapshotData['id'] as String?;
    _display = snapshotData['display'] as String?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _isActive = snapshotData['isActive'] as bool?;
    _code = castToType<int>(snapshotData['code']);
    _tabColor = getSchemaColor(snapshotData['tabColor']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('LEAD_STAGES')
          : FirebaseFirestore.instance.collectionGroup('LEAD_STAGES');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('LEAD_STAGES').doc(id);

  static Stream<LeadStagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LeadStagesRecord.fromSnapshot(s));

  static Future<LeadStagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LeadStagesRecord.fromSnapshot(s));

  static LeadStagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LeadStagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LeadStagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LeadStagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LeadStagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LeadStagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLeadStagesRecordData({
  String? name,
  String? id,
  String? display,
  bool? isDeleted,
  bool? isActive,
  int? code,
  Color? tabColor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'id': id,
      'display': display,
      'isDeleted': isDeleted,
      'isActive': isActive,
      'code': code,
      'tabColor': tabColor,
    }.withoutNulls,
  );

  return firestoreData;
}

class LeadStagesRecordDocumentEquality implements Equality<LeadStagesRecord> {
  const LeadStagesRecordDocumentEquality();

  @override
  bool equals(LeadStagesRecord? e1, LeadStagesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.id == e2?.id &&
        e1?.display == e2?.display &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.isActive == e2?.isActive &&
        e1?.code == e2?.code &&
        e1?.tabColor == e2?.tabColor;
  }

  @override
  int hash(LeadStagesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.id,
        e?.display,
        e?.isDeleted,
        e?.isActive,
        e?.code,
        e?.tabColor
      ]);

  @override
  bool isValidKey(Object? o) => o is LeadStagesRecord;
}
