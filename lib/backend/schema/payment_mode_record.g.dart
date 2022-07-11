// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_mode_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PaymentModeRecord> _$paymentModeRecordSerializer =
    new _$PaymentModeRecordSerializer();

class _$PaymentModeRecordSerializer
    implements StructuredSerializer<PaymentModeRecord> {
  @override
  final Iterable<Type> types = const [PaymentModeRecord, _$PaymentModeRecord];
  @override
  final String wireName = 'PaymentModeRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, PaymentModeRecord object,
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
  PaymentModeRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PaymentModeRecordBuilder();

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

class _$PaymentModeRecord extends PaymentModeRecord {
  @override
  final String id;
  @override
  final String name;
  @override
  final int code;
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

  factory _$PaymentModeRecord(
          [void Function(PaymentModeRecordBuilder) updates]) =>
      (new PaymentModeRecordBuilder()..update(updates)).build();

  _$PaymentModeRecord._(
      {this.id,
      this.name,
      this.code,
      this.createdDate,
      this.createdBy,
      this.updatedDate,
      this.updatedBy,
      this.reference})
      : super._();

  @override
  PaymentModeRecord rebuild(void Function(PaymentModeRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaymentModeRecordBuilder toBuilder() =>
      new PaymentModeRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentModeRecord &&
        id == other.id &&
        name == other.name &&
        code == other.code &&
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
                        $jc($jc($jc(0, id.hashCode), name.hashCode),
                            code.hashCode),
                        createdDate.hashCode),
                    createdBy.hashCode),
                updatedDate.hashCode),
            updatedBy.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PaymentModeRecord')
          ..add('id', id)
          ..add('name', name)
          ..add('code', code)
          ..add('createdDate', createdDate)
          ..add('createdBy', createdBy)
          ..add('updatedDate', updatedDate)
          ..add('updatedBy', updatedBy)
          ..add('reference', reference))
        .toString();
  }
}

class PaymentModeRecordBuilder
    implements Builder<PaymentModeRecord, PaymentModeRecordBuilder> {
  _$PaymentModeRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _code;
  int get code => _$this._code;
  set code(int code) => _$this._code = code;

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

  PaymentModeRecordBuilder() {
    PaymentModeRecord._initializeBuilder(this);
  }

  PaymentModeRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _code = $v.code;
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
  void replace(PaymentModeRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PaymentModeRecord;
  }

  @override
  void update(void Function(PaymentModeRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PaymentModeRecord build() {
    final _$result = _$v ??
        new _$PaymentModeRecord._(
            id: id,
            name: name,
            code: code,
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
