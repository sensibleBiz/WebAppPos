// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SubCategoryRecord> _$subCategoryRecordSerializer =
    new _$SubCategoryRecordSerializer();

class _$SubCategoryRecordSerializer
    implements StructuredSerializer<SubCategoryRecord> {
  @override
  final Iterable<Type> types = const [SubCategoryRecord, _$SubCategoryRecord];
  @override
  final String wireName = 'SubCategoryRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, SubCategoryRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.active;
    if (value != null) {
      result
        ..add('active')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categoryMasterRef;
    if (value != null) {
      result
        ..add('categoryMasterRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.regionalName;
    if (value != null) {
      result
        ..add('regionalName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdDate;
    if (value != null) {
      result
        ..add('createdDate')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('createdBy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.updatedDate;
    if (value != null) {
      result
        ..add('updatedDate')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.updatedBy;
    if (value != null) {
      result
        ..add('updatedBy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  SubCategoryRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubCategoryRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'active':
          result.active = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'categoryMasterRef':
          result.categoryMasterRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'regionalName':
          result.regionalName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdDate':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'createdBy':
          result.createdBy = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'updatedDate':
          result.updatedDate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'updatedBy':
          result.updatedBy = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$SubCategoryRecord extends SubCategoryRecord {
  @override
  final String id;
  @override
  final String name;
  @override
  final int code;
  @override
  final bool active;
  @override
  final String image;
  @override
  final DocumentReference<Object> categoryMasterRef;
  @override
  final String regionalName;
  @override
  final int createdDate;
  @override
  final DocumentReference<Object> createdBy;
  @override
  final int updatedDate;
  @override
  final DocumentReference<Object> updatedBy;
  @override
  final DocumentReference<Object> reference;

  factory _$SubCategoryRecord(
          [void Function(SubCategoryRecordBuilder) updates]) =>
      (new SubCategoryRecordBuilder()..update(updates)).build();

  _$SubCategoryRecord._(
      {this.id,
      this.name,
      this.code,
      this.active,
      this.image,
      this.categoryMasterRef,
      this.regionalName,
      this.createdDate,
      this.createdBy,
      this.updatedDate,
      this.updatedBy,
      this.reference})
      : super._();

  @override
  SubCategoryRecord rebuild(void Function(SubCategoryRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubCategoryRecordBuilder toBuilder() =>
      new SubCategoryRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubCategoryRecord &&
        id == other.id &&
        name == other.name &&
        code == other.code &&
        active == other.active &&
        image == other.image &&
        categoryMasterRef == other.categoryMasterRef &&
        regionalName == other.regionalName &&
        createdDate == other.createdDate &&
        createdBy == other.createdBy &&
        updatedDate == other.updatedDate &&
        updatedBy == other.updatedBy &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, id.hashCode),
                                                name.hashCode),
                                            code.hashCode),
                                        active.hashCode),
                                    image.hashCode),
                                categoryMasterRef.hashCode),
                            regionalName.hashCode),
                        createdDate.hashCode),
                    createdBy.hashCode),
                updatedDate.hashCode),
            updatedBy.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SubCategoryRecord')
          ..add('id', id)
          ..add('name', name)
          ..add('code', code)
          ..add('active', active)
          ..add('image', image)
          ..add('categoryMasterRef', categoryMasterRef)
          ..add('regionalName', regionalName)
          ..add('createdDate', createdDate)
          ..add('createdBy', createdBy)
          ..add('updatedDate', updatedDate)
          ..add('updatedBy', updatedBy)
          ..add('reference', reference))
        .toString();
  }
}

class SubCategoryRecordBuilder
    implements Builder<SubCategoryRecord, SubCategoryRecordBuilder> {
  _$SubCategoryRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _code;
  int get code => _$this._code;
  set code(int code) => _$this._code = code;

  bool _active;
  bool get active => _$this._active;
  set active(bool active) => _$this._active = active;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  DocumentReference<Object> _categoryMasterRef;
  DocumentReference<Object> get categoryMasterRef => _$this._categoryMasterRef;
  set categoryMasterRef(DocumentReference<Object> categoryMasterRef) =>
      _$this._categoryMasterRef = categoryMasterRef;

  String _regionalName;
  String get regionalName => _$this._regionalName;
  set regionalName(String regionalName) => _$this._regionalName = regionalName;

  int _createdDate;
  int get createdDate => _$this._createdDate;
  set createdDate(int createdDate) => _$this._createdDate = createdDate;

  DocumentReference<Object> _createdBy;
  DocumentReference<Object> get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object> createdBy) =>
      _$this._createdBy = createdBy;

  int _updatedDate;
  int get updatedDate => _$this._updatedDate;
  set updatedDate(int updatedDate) => _$this._updatedDate = updatedDate;

  DocumentReference<Object> _updatedBy;
  DocumentReference<Object> get updatedBy => _$this._updatedBy;
  set updatedBy(DocumentReference<Object> updatedBy) =>
      _$this._updatedBy = updatedBy;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  SubCategoryRecordBuilder() {
    SubCategoryRecord._initializeBuilder(this);
  }

  SubCategoryRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _code = $v.code;
      _active = $v.active;
      _image = $v.image;
      _categoryMasterRef = $v.categoryMasterRef;
      _regionalName = $v.regionalName;
      _createdDate = $v.createdDate;
      _createdBy = $v.createdBy;
      _updatedDate = $v.updatedDate;
      _updatedBy = $v.updatedBy;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubCategoryRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubCategoryRecord;
  }

  @override
  void update(void Function(SubCategoryRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SubCategoryRecord build() {
    final _$result = _$v ??
        new _$SubCategoryRecord._(
            id: id,
            name: name,
            code: code,
            active: active,
            image: image,
            categoryMasterRef: categoryMasterRef,
            regionalName: regionalName,
            createdDate: createdDate,
            createdBy: createdBy,
            updatedDate: updatedDate,
            updatedBy: updatedBy,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
