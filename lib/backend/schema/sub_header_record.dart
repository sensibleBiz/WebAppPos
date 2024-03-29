import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubHeaderRecord extends FirestoreRecord {
  SubHeaderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "topicName" field.
  String? _topicName;
  String get topicName => _topicName ?? '';
  bool hasTopicName() => _topicName != null;

  // "videoURL" field.
  String? _videoURL;
  String get videoURL => _videoURL ?? '';
  bool hasVideoURL() => _videoURL != null;

  // "headLine" field.
  String? _headLine;
  String get headLine => _headLine ?? '';
  bool hasHeadLine() => _headLine != null;

  // "subHeadLine" field.
  String? _subHeadLine;
  String get subHeadLine => _subHeadLine ?? '';
  bool hasSubHeadLine() => _subHeadLine != null;

  // "steps" field.
  List<String>? _steps;
  List<String> get steps => _steps ?? const [];
  bool hasSteps() => _steps != null;

  // "paragraph" field.
  String? _paragraph;
  String get paragraph => _paragraph ?? '';
  bool hasParagraph() => _paragraph != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "createdDate" field.
  int? _createdDate;
  int get createdDate => _createdDate ?? 0;
  bool hasCreatedDate() => _createdDate != null;

  // "modifiedDate" field.
  int? _modifiedDate;
  int get modifiedDate => _modifiedDate ?? 0;
  bool hasModifiedDate() => _modifiedDate != null;

  // "imageURL" field.
  List<String>? _imageURL;
  List<String> get imageURL => _imageURL ?? const [];
  bool hasImageURL() => _imageURL != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "headerID" field.
  String? _headerID;
  String get headerID => _headerID ?? '';
  bool hasHeaderID() => _headerID != null;

  // "createdBy" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  // "modifiedBy" field.
  String? _modifiedBy;
  String get modifiedBy => _modifiedBy ?? '';
  bool hasModifiedBy() => _modifiedBy != null;

  // "deletedBy" field.
  String? _deletedBy;
  String get deletedBy => _deletedBy ?? '';
  bool hasDeletedBy() => _deletedBy != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _topicName = snapshotData['topicName'] as String?;
    _videoURL = snapshotData['videoURL'] as String?;
    _headLine = snapshotData['headLine'] as String?;
    _subHeadLine = snapshotData['subHeadLine'] as String?;
    _steps = getDataList(snapshotData['steps']);
    _paragraph = snapshotData['paragraph'] as String?;
    _note = snapshotData['note'] as String?;
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _modifiedDate = castToType<int>(snapshotData['modifiedDate']);
    _imageURL = getDataList(snapshotData['imageURL']);
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _headerID = snapshotData['headerID'] as String?;
    _createdBy = snapshotData['createdBy'] as String?;
    _modifiedBy = snapshotData['modifiedBy'] as String?;
    _deletedBy = snapshotData['deletedBy'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('SUB_HEADER')
          : FirebaseFirestore.instance.collectionGroup('SUB_HEADER');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('SUB_HEADER').doc(id);

  static Stream<SubHeaderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubHeaderRecord.fromSnapshot(s));

  static Future<SubHeaderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubHeaderRecord.fromSnapshot(s));

  static SubHeaderRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubHeaderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubHeaderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubHeaderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubHeaderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubHeaderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubHeaderRecordData({
  String? id,
  String? topicName,
  String? videoURL,
  String? headLine,
  String? subHeadLine,
  String? paragraph,
  String? note,
  int? createdDate,
  int? modifiedDate,
  bool? isDeleted,
  String? headerID,
  String? createdBy,
  String? modifiedBy,
  String? deletedBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'topicName': topicName,
      'videoURL': videoURL,
      'headLine': headLine,
      'subHeadLine': subHeadLine,
      'paragraph': paragraph,
      'note': note,
      'createdDate': createdDate,
      'modifiedDate': modifiedDate,
      'isDeleted': isDeleted,
      'headerID': headerID,
      'createdBy': createdBy,
      'modifiedBy': modifiedBy,
      'deletedBy': deletedBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubHeaderRecordDocumentEquality implements Equality<SubHeaderRecord> {
  const SubHeaderRecordDocumentEquality();

  @override
  bool equals(SubHeaderRecord? e1, SubHeaderRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.topicName == e2?.topicName &&
        e1?.videoURL == e2?.videoURL &&
        e1?.headLine == e2?.headLine &&
        e1?.subHeadLine == e2?.subHeadLine &&
        listEquality.equals(e1?.steps, e2?.steps) &&
        e1?.paragraph == e2?.paragraph &&
        e1?.note == e2?.note &&
        e1?.createdDate == e2?.createdDate &&
        e1?.modifiedDate == e2?.modifiedDate &&
        listEquality.equals(e1?.imageURL, e2?.imageURL) &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.headerID == e2?.headerID &&
        e1?.createdBy == e2?.createdBy &&
        e1?.modifiedBy == e2?.modifiedBy &&
        e1?.deletedBy == e2?.deletedBy;
  }

  @override
  int hash(SubHeaderRecord? e) => const ListEquality().hash([
        e?.id,
        e?.topicName,
        e?.videoURL,
        e?.headLine,
        e?.subHeadLine,
        e?.steps,
        e?.paragraph,
        e?.note,
        e?.createdDate,
        e?.modifiedDate,
        e?.imageURL,
        e?.isDeleted,
        e?.headerID,
        e?.createdBy,
        e?.modifiedBy,
        e?.deletedBy
      ]);

  @override
  bool isValidKey(Object? o) => o is SubHeaderRecord;
}
