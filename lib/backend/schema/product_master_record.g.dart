// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_master_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductMasterRecord> _$productMasterRecordSerializer =
    new _$ProductMasterRecordSerializer();

class _$ProductMasterRecordSerializer
    implements StructuredSerializer<ProductMasterRecord> {
  @override
  final Iterable<Type> types = const [
    ProductMasterRecord,
    _$ProductMasterRecord
  ];
  @override
  final String wireName = 'ProductMasterRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ProductMasterRecord object,
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
    value = object.imageUrl;
    if (value != null) {
      result
        ..add('imageUrl')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.hsnCode;
    if (value != null) {
      result
        ..add('hsnCode')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.barcode;
    if (value != null) {
      result
        ..add('barcode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categoryRef;
    if (value != null) {
      result
        ..add('categoryRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.subCategoryRef;
    if (value != null) {
      result
        ..add('subCategoryRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  ProductMasterRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductMasterRecordBuilder();

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
        case 'imageUrl':
          result.imageUrl.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'hsnCode':
          result.hsnCode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'barcode':
          result.barcode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'categoryRef':
          result.categoryRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'subCategoryRef':
          result.subCategoryRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$ProductMasterRecord extends ProductMasterRecord {
  @override
  final String id;
  @override
  final String name;
  @override
  final BuiltList<String> imageUrl;
  @override
  final int hsnCode;
  @override
  final String barcode;
  @override
  final DocumentReference<Object> categoryRef;
  @override
  final DocumentReference<Object> subCategoryRef;
  @override
  final int code;
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

  factory _$ProductMasterRecord(
          [void Function(ProductMasterRecordBuilder) updates]) =>
      (new ProductMasterRecordBuilder()..update(updates)).build();

  _$ProductMasterRecord._(
      {this.id,
      this.name,
      this.imageUrl,
      this.hsnCode,
      this.barcode,
      this.categoryRef,
      this.subCategoryRef,
      this.code,
      this.regionalName,
      this.createdDate,
      this.createdBy,
      this.updatedDate,
      this.updatedBy,
      this.reference})
      : super._();

  @override
  ProductMasterRecord rebuild(
          void Function(ProductMasterRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductMasterRecordBuilder toBuilder() =>
      new ProductMasterRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductMasterRecord &&
        id == other.id &&
        name == other.name &&
        imageUrl == other.imageUrl &&
        hsnCode == other.hsnCode &&
        barcode == other.barcode &&
        categoryRef == other.categoryRef &&
        subCategoryRef == other.subCategoryRef &&
        code == other.code &&
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
                                            $jc(
                                                $jc(
                                                    $jc($jc(0, id.hashCode),
                                                        name.hashCode),
                                                    imageUrl.hashCode),
                                                hsnCode.hashCode),
                                            barcode.hashCode),
                                        categoryRef.hashCode),
                                    subCategoryRef.hashCode),
                                code.hashCode),
                            regionalName.hashCode),
                        createdDate.hashCode),
                    createdBy.hashCode),
                updatedDate.hashCode),
            updatedBy.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProductMasterRecord')
          ..add('id', id)
          ..add('name', name)
          ..add('imageUrl', imageUrl)
          ..add('hsnCode', hsnCode)
          ..add('barcode', barcode)
          ..add('categoryRef', categoryRef)
          ..add('subCategoryRef', subCategoryRef)
          ..add('code', code)
          ..add('regionalName', regionalName)
          ..add('createdDate', createdDate)
          ..add('createdBy', createdBy)
          ..add('updatedDate', updatedDate)
          ..add('updatedBy', updatedBy)
          ..add('reference', reference))
        .toString();
  }
}

class ProductMasterRecordBuilder
    implements Builder<ProductMasterRecord, ProductMasterRecordBuilder> {
  _$ProductMasterRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  ListBuilder<String> _imageUrl;
  ListBuilder<String> get imageUrl =>
      _$this._imageUrl ??= new ListBuilder<String>();
  set imageUrl(ListBuilder<String> imageUrl) => _$this._imageUrl = imageUrl;

  int _hsnCode;
  int get hsnCode => _$this._hsnCode;
  set hsnCode(int hsnCode) => _$this._hsnCode = hsnCode;

  String _barcode;
  String get barcode => _$this._barcode;
  set barcode(String barcode) => _$this._barcode = barcode;

  DocumentReference<Object> _categoryRef;
  DocumentReference<Object> get categoryRef => _$this._categoryRef;
  set categoryRef(DocumentReference<Object> categoryRef) =>
      _$this._categoryRef = categoryRef;

  DocumentReference<Object> _subCategoryRef;
  DocumentReference<Object> get subCategoryRef => _$this._subCategoryRef;
  set subCategoryRef(DocumentReference<Object> subCategoryRef) =>
      _$this._subCategoryRef = subCategoryRef;

  int _code;
  int get code => _$this._code;
  set code(int code) => _$this._code = code;

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

  ProductMasterRecordBuilder() {
    ProductMasterRecord._initializeBuilder(this);
  }

  ProductMasterRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _imageUrl = $v.imageUrl?.toBuilder();
      _hsnCode = $v.hsnCode;
      _barcode = $v.barcode;
      _categoryRef = $v.categoryRef;
      _subCategoryRef = $v.subCategoryRef;
      _code = $v.code;
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
  void replace(ProductMasterRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductMasterRecord;
  }

  @override
  void update(void Function(ProductMasterRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProductMasterRecord build() {
    _$ProductMasterRecord _$result;
    try {
      _$result = _$v ??
          new _$ProductMasterRecord._(
              id: id,
              name: name,
              imageUrl: _imageUrl?.build(),
              hsnCode: hsnCode,
              barcode: barcode,
              categoryRef: categoryRef,
              subCategoryRef: subCategoryRef,
              code: code,
              regionalName: regionalName,
              createdDate: createdDate,
              createdBy: createdBy,
              updatedDate: updatedDate,
              updatedBy: updatedBy,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'imageUrl';
        _imageUrl?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ProductMasterRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
