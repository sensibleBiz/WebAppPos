import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryRecord extends FirestoreRecord {
  CategoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "categoryNo" field.
  int? _categoryNo;
  int get categoryNo => _categoryNo ?? 0;
  bool hasCategoryNo() => _categoryNo != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "categoryRf" field.
  DocumentReference? _categoryRf;
  DocumentReference? get categoryRf => _categoryRf;
  bool hasCategoryRf() => _categoryRf != null;

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  bool hasType() => _type != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "catimageUrl" field.
  String? _catimageUrl;
  String get catimageUrl => _catimageUrl ?? '';
  bool hasCatimageUrl() => _catimageUrl != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _categoryNo = castToType<int>(snapshotData['categoryNo']);
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _categoryRf = snapshotData['categoryRf'] as DocumentReference?;
    _type = castToType<int>(snapshotData['type']);
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _code = castToType<int>(snapshotData['code']);
    _catimageUrl = snapshotData['catimageUrl'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('CATEGORY')
          : FirebaseFirestore.instance.collectionGroup('CATEGORY');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('CATEGORY').doc(id);

  static Stream<CategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoryRecord.fromSnapshot(s));

  static Future<CategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoryRecord.fromSnapshot(s));

  static CategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoryRecordData({
  int? categoryNo,
  String? id,
  String? name,
  DocumentReference? categoryRf,
  int? type,
  bool? isDeleted,
  int? code,
  String? catimageUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'categoryNo': categoryNo,
      'id': id,
      'name': name,
      'categoryRf': categoryRf,
      'type': type,
      'isDeleted': isDeleted,
      'code': code,
      'catimageUrl': catimageUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoryRecordDocumentEquality implements Equality<CategoryRecord> {
  const CategoryRecordDocumentEquality();

  @override
  bool equals(CategoryRecord? e1, CategoryRecord? e2) {
    return e1?.categoryNo == e2?.categoryNo &&
        e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.categoryRf == e2?.categoryRf &&
        e1?.type == e2?.type &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.code == e2?.code &&
        e1?.catimageUrl == e2?.catimageUrl;
  }

  @override
  int hash(CategoryRecord? e) => const ListEquality().hash([
        e?.categoryNo,
        e?.id,
        e?.name,
        e?.categoryRf,
        e?.type,
        e?.isDeleted,
        e?.code,
        e?.catimageUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is CategoryRecord;
}
