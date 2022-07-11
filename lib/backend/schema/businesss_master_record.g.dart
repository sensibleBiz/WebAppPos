// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'businesss_master_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BusinesssMasterRecord> _$businesssMasterRecordSerializer =
    new _$BusinesssMasterRecordSerializer();

class _$BusinesssMasterRecordSerializer
    implements StructuredSerializer<BusinesssMasterRecord> {
  @override
  final Iterable<Type> types = const [
    BusinesssMasterRecord,
    _$BusinesssMasterRecord
  ];
  @override
  final String wireName = 'BusinesssMasterRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, BusinesssMasterRecord object,
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
    value = object.businessType;
    if (value != null) {
      result
        ..add('businessType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mobile;
    if (value != null) {
      result
        ..add('mobile')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.city;
    if (value != null) {
      result
        ..add('city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.state;
    if (value != null) {
      result
        ..add('state')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pincode;
    if (value != null) {
      result
        ..add('pincode')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.active;
    if (value != null) {
      result
        ..add('active')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.createdDate;
    if (value != null) {
      result
        ..add('createdDate')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.code;
    if (value != null) {
      result
        ..add('code')
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
  BusinesssMasterRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BusinesssMasterRecordBuilder();

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
        case 'businessType':
          result.businessType = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mobile':
          result.mobile = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pincode':
          result.pincode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'active':
          result.active = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'createdDate':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'createdBy':
          result.createdBy = serializers.deserialize(value,
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

class _$BusinesssMasterRecord extends BusinesssMasterRecord {
  @override
  final String id;
  @override
  final DocumentReference<Object> businessType;
  @override
  final String name;
  @override
  final String mobile;
  @override
  final String email;
  @override
  final int phone;
  @override
  final LatLng address;
  @override
  final String city;
  @override
  final String state;
  @override
  final int pincode;
  @override
  final bool active;
  @override
  final int createdDate;
  @override
  final int code;
  @override
  final DocumentReference<Object> createdBy;
  @override
  final DocumentReference<Object> reference;

  factory _$BusinesssMasterRecord(
          [void Function(BusinesssMasterRecordBuilder) updates]) =>
      (new BusinesssMasterRecordBuilder()..update(updates)).build();

  _$BusinesssMasterRecord._(
      {this.id,
      this.businessType,
      this.name,
      this.mobile,
      this.email,
      this.phone,
      this.address,
      this.city,
      this.state,
      this.pincode,
      this.active,
      this.createdDate,
      this.code,
      this.createdBy,
      this.reference})
      : super._();

  @override
  BusinesssMasterRecord rebuild(
          void Function(BusinesssMasterRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BusinesssMasterRecordBuilder toBuilder() =>
      new BusinesssMasterRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BusinesssMasterRecord &&
        id == other.id &&
        businessType == other.businessType &&
        name == other.name &&
        mobile == other.mobile &&
        email == other.email &&
        phone == other.phone &&
        address == other.address &&
        city == other.city &&
        state == other.state &&
        pincode == other.pincode &&
        active == other.active &&
        createdDate == other.createdDate &&
        code == other.code &&
        createdBy == other.createdBy &&
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
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(0, id.hashCode),
                                                            businessType
                                                                .hashCode),
                                                        name.hashCode),
                                                    mobile.hashCode),
                                                email.hashCode),
                                            phone.hashCode),
                                        address.hashCode),
                                    city.hashCode),
                                state.hashCode),
                            pincode.hashCode),
                        active.hashCode),
                    createdDate.hashCode),
                code.hashCode),
            createdBy.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BusinesssMasterRecord')
          ..add('id', id)
          ..add('businessType', businessType)
          ..add('name', name)
          ..add('mobile', mobile)
          ..add('email', email)
          ..add('phone', phone)
          ..add('address', address)
          ..add('city', city)
          ..add('state', state)
          ..add('pincode', pincode)
          ..add('active', active)
          ..add('createdDate', createdDate)
          ..add('code', code)
          ..add('createdBy', createdBy)
          ..add('reference', reference))
        .toString();
  }
}

class BusinesssMasterRecordBuilder
    implements Builder<BusinesssMasterRecord, BusinesssMasterRecordBuilder> {
  _$BusinesssMasterRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  DocumentReference<Object> _businessType;
  DocumentReference<Object> get businessType => _$this._businessType;
  set businessType(DocumentReference<Object> businessType) =>
      _$this._businessType = businessType;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _mobile;
  String get mobile => _$this._mobile;
  set mobile(String mobile) => _$this._mobile = mobile;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  int _phone;
  int get phone => _$this._phone;
  set phone(int phone) => _$this._phone = phone;

  LatLng _address;
  LatLng get address => _$this._address;
  set address(LatLng address) => _$this._address = address;

  String _city;
  String get city => _$this._city;
  set city(String city) => _$this._city = city;

  String _state;
  String get state => _$this._state;
  set state(String state) => _$this._state = state;

  int _pincode;
  int get pincode => _$this._pincode;
  set pincode(int pincode) => _$this._pincode = pincode;

  bool _active;
  bool get active => _$this._active;
  set active(bool active) => _$this._active = active;

  int _createdDate;
  int get createdDate => _$this._createdDate;
  set createdDate(int createdDate) => _$this._createdDate = createdDate;

  int _code;
  int get code => _$this._code;
  set code(int code) => _$this._code = code;

  DocumentReference<Object> _createdBy;
  DocumentReference<Object> get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object> createdBy) =>
      _$this._createdBy = createdBy;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  BusinesssMasterRecordBuilder() {
    BusinesssMasterRecord._initializeBuilder(this);
  }

  BusinesssMasterRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _businessType = $v.businessType;
      _name = $v.name;
      _mobile = $v.mobile;
      _email = $v.email;
      _phone = $v.phone;
      _address = $v.address;
      _city = $v.city;
      _state = $v.state;
      _pincode = $v.pincode;
      _active = $v.active;
      _createdDate = $v.createdDate;
      _code = $v.code;
      _createdBy = $v.createdBy;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BusinesssMasterRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BusinesssMasterRecord;
  }

  @override
  void update(void Function(BusinesssMasterRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BusinesssMasterRecord build() {
    final _$result = _$v ??
        new _$BusinesssMasterRecord._(
            id: id,
            businessType: businessType,
            name: name,
            mobile: mobile,
            email: email,
            phone: phone,
            address: address,
            city: city,
            state: state,
            pincode: pincode,
            active: active,
            createdDate: createdDate,
            code: code,
            createdBy: createdBy,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
