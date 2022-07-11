// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DeviceRecord> _$deviceRecordSerializer =
    new _$DeviceRecordSerializer();

class _$DeviceRecordSerializer implements StructuredSerializer<DeviceRecord> {
  @override
  final Iterable<Type> types = const [DeviceRecord, _$DeviceRecord];
  @override
  final String wireName = 'DeviceRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, DeviceRecord object,
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
    value = object.deviceId;
    if (value != null) {
      result
        ..add('deviceId')
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
    value = object.board;
    if (value != null) {
      result
        ..add('board')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.brand;
    if (value != null) {
      result
        ..add('brand')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.connectedToNetwork;
    if (value != null) {
      result
        ..add('connectedToNetwork')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.createdDate;
    if (value != null) {
      result
        ..add('createdDate')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.manufacture;
    if (value != null) {
      result
        ..add('manufacture')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.model;
    if (value != null) {
      result
        ..add('model')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.serial;
    if (value != null) {
      result
        ..add('serial')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.posModel;
    if (value != null) {
      result
        ..add('posModel')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.posSerial;
    if (value != null) {
      result
        ..add('posSerial')
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
    value = object.outletRef;
    if (value != null) {
      result
        ..add('outletRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.versionCode;
    if (value != null) {
      result
        ..add('versionCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.versionName;
    if (value != null) {
      result
        ..add('versionName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  DeviceRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DeviceRecordBuilder();

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
        case 'deviceId':
          result.deviceId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'active':
          result.active = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'board':
          result.board = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'brand':
          result.brand = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'connectedToNetwork':
          result.connectedToNetwork = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'createdDate':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng;
          break;
        case 'manufacture':
          result.manufacture = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'model':
          result.model = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'serial':
          result.serial = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'posModel':
          result.posModel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'posSerial':
          result.posSerial = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userRef':
          result.userRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'outletRef':
          result.outletRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'versionCode':
          result.versionCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'versionName':
          result.versionName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$DeviceRecord extends DeviceRecord {
  @override
  final String id;
  @override
  final String deviceId;
  @override
  final bool active;
  @override
  final String board;
  @override
  final String brand;
  @override
  final bool connectedToNetwork;
  @override
  final int createdDate;
  @override
  final LatLng address;
  @override
  final String manufacture;
  @override
  final String model;
  @override
  final String serial;
  @override
  final String posModel;
  @override
  final String posSerial;
  @override
  final DocumentReference<Object> userRef;
  @override
  final DocumentReference<Object> outletRef;
  @override
  final String versionCode;
  @override
  final String versionName;
  @override
  final DocumentReference<Object> createdBy;
  @override
  final DocumentReference<Object> reference;

  factory _$DeviceRecord([void Function(DeviceRecordBuilder) updates]) =>
      (new DeviceRecordBuilder()..update(updates)).build();

  _$DeviceRecord._(
      {this.id,
      this.deviceId,
      this.active,
      this.board,
      this.brand,
      this.connectedToNetwork,
      this.createdDate,
      this.address,
      this.manufacture,
      this.model,
      this.serial,
      this.posModel,
      this.posSerial,
      this.userRef,
      this.outletRef,
      this.versionCode,
      this.versionName,
      this.createdBy,
      this.reference})
      : super._();

  @override
  DeviceRecord rebuild(void Function(DeviceRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeviceRecordBuilder toBuilder() => new DeviceRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeviceRecord &&
        id == other.id &&
        deviceId == other.deviceId &&
        active == other.active &&
        board == other.board &&
        brand == other.brand &&
        connectedToNetwork == other.connectedToNetwork &&
        createdDate == other.createdDate &&
        address == other.address &&
        manufacture == other.manufacture &&
        model == other.model &&
        serial == other.serial &&
        posModel == other.posModel &&
        posSerial == other.posSerial &&
        userRef == other.userRef &&
        outletRef == other.outletRef &&
        versionCode == other.versionCode &&
        versionName == other.versionName &&
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
                                                                    $jc(
                                                                        $jc(
                                                                            $jc(
                                                                                0,
                                                                                id
                                                                                    .hashCode),
                                                                            deviceId
                                                                                .hashCode),
                                                                        active
                                                                            .hashCode),
                                                                    board
                                                                        .hashCode),
                                                                brand.hashCode),
                                                            connectedToNetwork
                                                                .hashCode),
                                                        createdDate.hashCode),
                                                    address.hashCode),
                                                manufacture.hashCode),
                                            model.hashCode),
                                        serial.hashCode),
                                    posModel.hashCode),
                                posSerial.hashCode),
                            userRef.hashCode),
                        outletRef.hashCode),
                    versionCode.hashCode),
                versionName.hashCode),
            createdBy.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DeviceRecord')
          ..add('id', id)
          ..add('deviceId', deviceId)
          ..add('active', active)
          ..add('board', board)
          ..add('brand', brand)
          ..add('connectedToNetwork', connectedToNetwork)
          ..add('createdDate', createdDate)
          ..add('address', address)
          ..add('manufacture', manufacture)
          ..add('model', model)
          ..add('serial', serial)
          ..add('posModel', posModel)
          ..add('posSerial', posSerial)
          ..add('userRef', userRef)
          ..add('outletRef', outletRef)
          ..add('versionCode', versionCode)
          ..add('versionName', versionName)
          ..add('createdBy', createdBy)
          ..add('reference', reference))
        .toString();
  }
}

class DeviceRecordBuilder
    implements Builder<DeviceRecord, DeviceRecordBuilder> {
  _$DeviceRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _deviceId;
  String get deviceId => _$this._deviceId;
  set deviceId(String deviceId) => _$this._deviceId = deviceId;

  bool _active;
  bool get active => _$this._active;
  set active(bool active) => _$this._active = active;

  String _board;
  String get board => _$this._board;
  set board(String board) => _$this._board = board;

  String _brand;
  String get brand => _$this._brand;
  set brand(String brand) => _$this._brand = brand;

  bool _connectedToNetwork;
  bool get connectedToNetwork => _$this._connectedToNetwork;
  set connectedToNetwork(bool connectedToNetwork) =>
      _$this._connectedToNetwork = connectedToNetwork;

  int _createdDate;
  int get createdDate => _$this._createdDate;
  set createdDate(int createdDate) => _$this._createdDate = createdDate;

  LatLng _address;
  LatLng get address => _$this._address;
  set address(LatLng address) => _$this._address = address;

  String _manufacture;
  String get manufacture => _$this._manufacture;
  set manufacture(String manufacture) => _$this._manufacture = manufacture;

  String _model;
  String get model => _$this._model;
  set model(String model) => _$this._model = model;

  String _serial;
  String get serial => _$this._serial;
  set serial(String serial) => _$this._serial = serial;

  String _posModel;
  String get posModel => _$this._posModel;
  set posModel(String posModel) => _$this._posModel = posModel;

  String _posSerial;
  String get posSerial => _$this._posSerial;
  set posSerial(String posSerial) => _$this._posSerial = posSerial;

  DocumentReference<Object> _userRef;
  DocumentReference<Object> get userRef => _$this._userRef;
  set userRef(DocumentReference<Object> userRef) => _$this._userRef = userRef;

  DocumentReference<Object> _outletRef;
  DocumentReference<Object> get outletRef => _$this._outletRef;
  set outletRef(DocumentReference<Object> outletRef) =>
      _$this._outletRef = outletRef;

  String _versionCode;
  String get versionCode => _$this._versionCode;
  set versionCode(String versionCode) => _$this._versionCode = versionCode;

  String _versionName;
  String get versionName => _$this._versionName;
  set versionName(String versionName) => _$this._versionName = versionName;

  DocumentReference<Object> _createdBy;
  DocumentReference<Object> get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object> createdBy) =>
      _$this._createdBy = createdBy;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  DeviceRecordBuilder() {
    DeviceRecord._initializeBuilder(this);
  }

  DeviceRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _deviceId = $v.deviceId;
      _active = $v.active;
      _board = $v.board;
      _brand = $v.brand;
      _connectedToNetwork = $v.connectedToNetwork;
      _createdDate = $v.createdDate;
      _address = $v.address;
      _manufacture = $v.manufacture;
      _model = $v.model;
      _serial = $v.serial;
      _posModel = $v.posModel;
      _posSerial = $v.posSerial;
      _userRef = $v.userRef;
      _outletRef = $v.outletRef;
      _versionCode = $v.versionCode;
      _versionName = $v.versionName;
      _createdBy = $v.createdBy;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeviceRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeviceRecord;
  }

  @override
  void update(void Function(DeviceRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DeviceRecord build() {
    final _$result = _$v ??
        new _$DeviceRecord._(
            id: id,
            deviceId: deviceId,
            active: active,
            board: board,
            brand: brand,
            connectedToNetwork: connectedToNetwork,
            createdDate: createdDate,
            address: address,
            manufacture: manufacture,
            model: model,
            serial: serial,
            posModel: posModel,
            posSerial: posSerial,
            userRef: userRef,
            outletRef: outletRef,
            versionCode: versionCode,
            versionName: versionName,
            createdBy: createdBy,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
