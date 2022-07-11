// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserProfileRecord> _$userProfileRecordSerializer =
    new _$UserProfileRecordSerializer();

class _$UserProfileRecordSerializer
    implements StructuredSerializer<UserProfileRecord> {
  @override
  final Iterable<Type> types = const [UserProfileRecord, _$UserProfileRecord];
  @override
  final String wireName = 'UserProfileRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, UserProfileRecord object,
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
    value = object.active;
    if (value != null) {
      result
        ..add('active')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.role;
    if (value != null) {
      result
        ..add('role')
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
    value = object.email;
    if (value != null) {
      result
        ..add('email')
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
    value = object.accessToMulticounter;
    if (value != null) {
      result
        ..add('accessToMulticounter')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.createdDate;
    if (value != null) {
      result
        ..add('createdDate')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.outletId;
    if (value != null) {
      result
        ..add('outletId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.outlets;
    if (value != null) {
      result
        ..add('outlets')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.quickPin;
    if (value != null) {
      result
        ..add('quickPin')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.renewalDate;
    if (value != null) {
      result
        ..add('renewalDate')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.userAccess;
    if (value != null) {
      result
        ..add('userAccess')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userSettings;
    if (value != null) {
      result
        ..add('userSettings')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  UserProfileRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserProfileRecordBuilder();

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
        case 'active':
          result.active = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'role':
          result.role = serializers.deserialize(value,
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
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'businessType':
          result.businessType = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'accessToMulticounter':
          result.accessToMulticounter = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'createdDate':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'outletId':
          result.outletId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'outlets':
          result.outlets.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'quickPin':
          result.quickPin = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'renewalDate':
          result.renewalDate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'userAccess':
          result.userAccess = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userSettings':
          result.userSettings = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$UserProfileRecord extends UserProfileRecord {
  @override
  final String id;
  @override
  final bool active;
  @override
  final String role;
  @override
  final LatLng address;
  @override
  final String city;
  @override
  final String state;
  @override
  final int pincode;
  @override
  final String email;
  @override
  final DocumentReference<Object> businessType;
  @override
  final bool accessToMulticounter;
  @override
  final int createdDate;
  @override
  final String outletId;
  @override
  final BuiltList<String> outlets;
  @override
  final int quickPin;
  @override
  final int renewalDate;
  @override
  final String userAccess;
  @override
  final String userSettings;
  @override
  final String photoUrl;
  @override
  final String uid;
  @override
  final DateTime createdTime;
  @override
  final String phoneNumber;
  @override
  final String displayName;
  @override
  final DocumentReference<Object> reference;

  factory _$UserProfileRecord(
          [void Function(UserProfileRecordBuilder) updates]) =>
      (new UserProfileRecordBuilder()..update(updates)).build();

  _$UserProfileRecord._(
      {this.id,
      this.active,
      this.role,
      this.address,
      this.city,
      this.state,
      this.pincode,
      this.email,
      this.businessType,
      this.accessToMulticounter,
      this.createdDate,
      this.outletId,
      this.outlets,
      this.quickPin,
      this.renewalDate,
      this.userAccess,
      this.userSettings,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.displayName,
      this.reference})
      : super._();

  @override
  UserProfileRecord rebuild(void Function(UserProfileRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserProfileRecordBuilder toBuilder() =>
      new UserProfileRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserProfileRecord &&
        id == other.id &&
        active == other.active &&
        role == other.role &&
        address == other.address &&
        city == other.city &&
        state == other.state &&
        pincode == other.pincode &&
        email == other.email &&
        businessType == other.businessType &&
        accessToMulticounter == other.accessToMulticounter &&
        createdDate == other.createdDate &&
        outletId == other.outletId &&
        outlets == other.outlets &&
        quickPin == other.quickPin &&
        renewalDate == other.renewalDate &&
        userAccess == other.userAccess &&
        userSettings == other.userSettings &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        displayName == other.displayName &&
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
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc(0, id.hashCode), active.hashCode), role.hashCode), address.hashCode),
                                                                                city.hashCode),
                                                                            state.hashCode),
                                                                        pincode.hashCode),
                                                                    email.hashCode),
                                                                businessType.hashCode),
                                                            accessToMulticounter.hashCode),
                                                        createdDate.hashCode),
                                                    outletId.hashCode),
                                                outlets.hashCode),
                                            quickPin.hashCode),
                                        renewalDate.hashCode),
                                    userAccess.hashCode),
                                userSettings.hashCode),
                            photoUrl.hashCode),
                        uid.hashCode),
                    createdTime.hashCode),
                phoneNumber.hashCode),
            displayName.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserProfileRecord')
          ..add('id', id)
          ..add('active', active)
          ..add('role', role)
          ..add('address', address)
          ..add('city', city)
          ..add('state', state)
          ..add('pincode', pincode)
          ..add('email', email)
          ..add('businessType', businessType)
          ..add('accessToMulticounter', accessToMulticounter)
          ..add('createdDate', createdDate)
          ..add('outletId', outletId)
          ..add('outlets', outlets)
          ..add('quickPin', quickPin)
          ..add('renewalDate', renewalDate)
          ..add('userAccess', userAccess)
          ..add('userSettings', userSettings)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('displayName', displayName)
          ..add('reference', reference))
        .toString();
  }
}

class UserProfileRecordBuilder
    implements Builder<UserProfileRecord, UserProfileRecordBuilder> {
  _$UserProfileRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  bool _active;
  bool get active => _$this._active;
  set active(bool active) => _$this._active = active;

  String _role;
  String get role => _$this._role;
  set role(String role) => _$this._role = role;

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

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  DocumentReference<Object> _businessType;
  DocumentReference<Object> get businessType => _$this._businessType;
  set businessType(DocumentReference<Object> businessType) =>
      _$this._businessType = businessType;

  bool _accessToMulticounter;
  bool get accessToMulticounter => _$this._accessToMulticounter;
  set accessToMulticounter(bool accessToMulticounter) =>
      _$this._accessToMulticounter = accessToMulticounter;

  int _createdDate;
  int get createdDate => _$this._createdDate;
  set createdDate(int createdDate) => _$this._createdDate = createdDate;

  String _outletId;
  String get outletId => _$this._outletId;
  set outletId(String outletId) => _$this._outletId = outletId;

  ListBuilder<String> _outlets;
  ListBuilder<String> get outlets =>
      _$this._outlets ??= new ListBuilder<String>();
  set outlets(ListBuilder<String> outlets) => _$this._outlets = outlets;

  int _quickPin;
  int get quickPin => _$this._quickPin;
  set quickPin(int quickPin) => _$this._quickPin = quickPin;

  int _renewalDate;
  int get renewalDate => _$this._renewalDate;
  set renewalDate(int renewalDate) => _$this._renewalDate = renewalDate;

  String _userAccess;
  String get userAccess => _$this._userAccess;
  set userAccess(String userAccess) => _$this._userAccess = userAccess;

  String _userSettings;
  String get userSettings => _$this._userSettings;
  set userSettings(String userSettings) => _$this._userSettings = userSettings;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  UserProfileRecordBuilder() {
    UserProfileRecord._initializeBuilder(this);
  }

  UserProfileRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _active = $v.active;
      _role = $v.role;
      _address = $v.address;
      _city = $v.city;
      _state = $v.state;
      _pincode = $v.pincode;
      _email = $v.email;
      _businessType = $v.businessType;
      _accessToMulticounter = $v.accessToMulticounter;
      _createdDate = $v.createdDate;
      _outletId = $v.outletId;
      _outlets = $v.outlets?.toBuilder();
      _quickPin = $v.quickPin;
      _renewalDate = $v.renewalDate;
      _userAccess = $v.userAccess;
      _userSettings = $v.userSettings;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _displayName = $v.displayName;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserProfileRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserProfileRecord;
  }

  @override
  void update(void Function(UserProfileRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserProfileRecord build() {
    _$UserProfileRecord _$result;
    try {
      _$result = _$v ??
          new _$UserProfileRecord._(
              id: id,
              active: active,
              role: role,
              address: address,
              city: city,
              state: state,
              pincode: pincode,
              email: email,
              businessType: businessType,
              accessToMulticounter: accessToMulticounter,
              createdDate: createdDate,
              outletId: outletId,
              outlets: _outlets?.build(),
              quickPin: quickPin,
              renewalDate: renewalDate,
              userAccess: userAccess,
              userSettings: userSettings,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              displayName: displayName,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'outlets';
        _outlets?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UserProfileRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
