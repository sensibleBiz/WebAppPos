// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_type_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UnitTypeRecord> _$unitTypeRecordSerializer =
    new _$UnitTypeRecordSerializer();

class _$UnitTypeRecordSerializer
    implements StructuredSerializer<UnitTypeRecord> {
  @override
  final Iterable<Type> types = const [UnitTypeRecord, _$UnitTypeRecord];
  @override
  final String wireName = 'UnitTypeRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, UnitTypeRecord object,
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
    value = object.unitType;
    if (value != null) {
      result
        ..add('unitType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.factor;
    if (value != null) {
      result
        ..add('factor')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  UnitTypeRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UnitTypeRecordBuilder();

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
        case 'unitType':
          result.unitType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'factor':
          result.factor = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$UnitTypeRecord extends UnitTypeRecord {
  @override
  final String id;
  @override
  final String name;
  @override
  final int code;
  @override
  final String unitType;
  @override
  final int factor;
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

  factory _$UnitTypeRecord([void Function(UnitTypeRecordBuilder) updates]) =>
      (new UnitTypeRecordBuilder()..update(updates)).build();

  _$UnitTypeRecord._(
      {this.id,
      this.name,
      this.code,
      this.unitType,
      this.factor,
      this.createdDate,
      this.createdBy,
      this.updatedDate,
      this.updatedBy,
      this.reference})
      : super._();

  @override
  UnitTypeRecord rebuild(void Function(UnitTypeRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnitTypeRecordBuilder toBuilder() =>
      new UnitTypeRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnitTypeRecord &&
        id == other.id &&
        name == other.name &&
        code == other.code &&
        unitType == other.unitType &&
        factor == other.factor &&
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
                                $jc($jc($jc(0, id.hashCode), name.hashCode),
                                    code.hashCode),
                                unitType.hashCode),
                            factor.hashCode),
                        createdDate.hashCode),
                    createdBy.hashCode),
                updatedDate.hashCode),
            updatedBy.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UnitTypeRecord')
          ..add('id', id)
          ..add('name', name)
          ..add('code', code)
          ..add('unitType', unitType)
          ..add('factor', factor)
          ..add('createdDate', createdDate)
          ..add('createdBy', createdBy)
          ..add('updatedDate', updatedDate)
          ..add('updatedBy', updatedBy)
          ..add('reference', reference))
        .toString();
  }
}

class UnitTypeRecordBuilder
    implements Builder<UnitTypeRecord, UnitTypeRecordBuilder> {
  _$UnitTypeRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _code;
  int get code => _$this._code;
  set code(int code) => _$this._code = code;

  String _unitType;
  String get unitType => _$this._unitType;
  set unitType(String unitType) => _$this._unitType = unitType;

  int _factor;
  int get factor => _$this._factor;
  set factor(int factor) => _$this._factor = factor;

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

  UnitTypeRecordBuilder() {
    UnitTypeRecord._initializeBuilder(this);
  }

  UnitTypeRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _code = $v.code;
      _unitType = $v.unitType;
      _factor = $v.factor;
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
  void replace(UnitTypeRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UnitTypeRecord;
  }

  @override
  void update(void Function(UnitTypeRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UnitTypeRecord build() {
    final _$result = _$v ??
        new _$UnitTypeRecord._(
            id: id,
            name: name,
            code: code,
            unitType: unitType,
            factor: factor,
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
