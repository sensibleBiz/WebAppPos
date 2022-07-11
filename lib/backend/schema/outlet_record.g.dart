// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OutletRecord> _$outletRecordSerializer =
    new _$OutletRecordSerializer();

class _$OutletRecordSerializer implements StructuredSerializer<OutletRecord> {
  @override
  final Iterable<Type> types = const [OutletRecord, _$OutletRecord];
  @override
  final String wireName = 'OutletRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, OutletRecord object,
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
    value = object.businessMatser;
    if (value != null) {
      result
        ..add('businessMatser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.businessType;
    if (value != null) {
      result
        ..add('businessType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.branch;
    if (value != null) {
      result
        ..add('branch')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
    value = object.renewalDate;
    if (value != null) {
      result
        ..add('renewalDate')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.createdDate;
    if (value != null) {
      result
        ..add('createdDate')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.fssaiLicenceNo;
    if (value != null) {
      result
        ..add('fssaiLicenceNo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
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
  OutletRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OutletRecordBuilder();

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
        case 'businessMatser':
          result.businessMatser = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'businessType':
          result.businessType = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'branch':
          result.branch = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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
        case 'renewalDate':
          result.renewalDate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'createdDate':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'fssaiLicenceNo':
          result.fssaiLicenceNo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userRef':
          result.userRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
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

class _$OutletRecord extends OutletRecord {
  @override
  final String id;
  @override
  final String name;
  @override
  final DocumentReference<Object> businessMatser;
  @override
  final DocumentReference<Object> businessType;
  @override
  final String branch;
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
  final int renewalDate;
  @override
  final int createdDate;
  @override
  final String fssaiLicenceNo;
  @override
  final DocumentReference<Object> userRef;
  @override
  final DocumentReference<Object> createdBy;
  @override
  final DocumentReference<Object> reference;

  factory _$OutletRecord([void Function(OutletRecordBuilder) updates]) =>
      (new OutletRecordBuilder()..update(updates)).build();

  _$OutletRecord._(
      {this.id,
      this.name,
      this.businessMatser,
      this.businessType,
      this.branch,
      this.address,
      this.city,
      this.state,
      this.pincode,
      this.active,
      this.renewalDate,
      this.createdDate,
      this.fssaiLicenceNo,
      this.userRef,
      this.createdBy,
      this.reference})
      : super._();

  @override
  OutletRecord rebuild(void Function(OutletRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OutletRecordBuilder toBuilder() => new OutletRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OutletRecord &&
        id == other.id &&
        name == other.name &&
        businessMatser == other.businessMatser &&
        businessType == other.businessType &&
        branch == other.branch &&
        address == other.address &&
        city == other.city &&
        state == other.state &&
        pincode == other.pincode &&
        active == other.active &&
        renewalDate == other.renewalDate &&
        createdDate == other.createdDate &&
        fssaiLicenceNo == other.fssaiLicenceNo &&
        userRef == other.userRef &&
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
                                                            $jc(
                                                                $jc(
                                                                    0,
                                                                    id
                                                                        .hashCode),
                                                                name.hashCode),
                                                            businessMatser
                                                                .hashCode),
                                                        businessType.hashCode),
                                                    branch.hashCode),
                                                address.hashCode),
                                            city.hashCode),
                                        state.hashCode),
                                    pincode.hashCode),
                                active.hashCode),
                            renewalDate.hashCode),
                        createdDate.hashCode),
                    fssaiLicenceNo.hashCode),
                userRef.hashCode),
            createdBy.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OutletRecord')
          ..add('id', id)
          ..add('name', name)
          ..add('businessMatser', businessMatser)
          ..add('businessType', businessType)
          ..add('branch', branch)
          ..add('address', address)
          ..add('city', city)
          ..add('state', state)
          ..add('pincode', pincode)
          ..add('active', active)
          ..add('renewalDate', renewalDate)
          ..add('createdDate', createdDate)
          ..add('fssaiLicenceNo', fssaiLicenceNo)
          ..add('userRef', userRef)
          ..add('createdBy', createdBy)
          ..add('reference', reference))
        .toString();
  }
}

class OutletRecordBuilder
    implements Builder<OutletRecord, OutletRecordBuilder> {
  _$OutletRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  DocumentReference<Object> _businessMatser;
  DocumentReference<Object> get businessMatser => _$this._businessMatser;
  set businessMatser(DocumentReference<Object> businessMatser) =>
      _$this._businessMatser = businessMatser;

  DocumentReference<Object> _businessType;
  DocumentReference<Object> get businessType => _$this._businessType;
  set businessType(DocumentReference<Object> businessType) =>
      _$this._businessType = businessType;

  String _branch;
  String get branch => _$this._branch;
  set branch(String branch) => _$this._branch = branch;

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

  int _renewalDate;
  int get renewalDate => _$this._renewalDate;
  set renewalDate(int renewalDate) => _$this._renewalDate = renewalDate;

  int _createdDate;
  int get createdDate => _$this._createdDate;
  set createdDate(int createdDate) => _$this._createdDate = createdDate;

  String _fssaiLicenceNo;
  String get fssaiLicenceNo => _$this._fssaiLicenceNo;
  set fssaiLicenceNo(String fssaiLicenceNo) =>
      _$this._fssaiLicenceNo = fssaiLicenceNo;

  DocumentReference<Object> _userRef;
  DocumentReference<Object> get userRef => _$this._userRef;
  set userRef(DocumentReference<Object> userRef) => _$this._userRef = userRef;

  DocumentReference<Object> _createdBy;
  DocumentReference<Object> get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object> createdBy) =>
      _$this._createdBy = createdBy;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  OutletRecordBuilder() {
    OutletRecord._initializeBuilder(this);
  }

  OutletRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _businessMatser = $v.businessMatser;
      _businessType = $v.businessType;
      _branch = $v.branch;
      _address = $v.address;
      _city = $v.city;
      _state = $v.state;
      _pincode = $v.pincode;
      _active = $v.active;
      _renewalDate = $v.renewalDate;
      _createdDate = $v.createdDate;
      _fssaiLicenceNo = $v.fssaiLicenceNo;
      _userRef = $v.userRef;
      _createdBy = $v.createdBy;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OutletRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OutletRecord;
  }

  @override
  void update(void Function(OutletRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OutletRecord build() {
    final _$result = _$v ??
        new _$OutletRecord._(
            id: id,
            name: name,
            businessMatser: businessMatser,
            businessType: businessType,
            branch: branch,
            address: address,
            city: city,
            state: state,
            pincode: pincode,
            active: active,
            renewalDate: renewalDate,
            createdDate: createdDate,
            fssaiLicenceNo: fssaiLicenceNo,
            userRef: userRef,
            createdBy: createdBy,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
