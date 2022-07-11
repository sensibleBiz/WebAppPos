// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InvoiceRecord> _$invoiceRecordSerializer =
    new _$InvoiceRecordSerializer();

class _$InvoiceRecordSerializer implements StructuredSerializer<InvoiceRecord> {
  @override
  final Iterable<Type> types = const [InvoiceRecord, _$InvoiceRecord];
  @override
  final String wireName = 'InvoiceRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, InvoiceRecord object,
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
    value = object.invoice;
    if (value != null) {
      result
        ..add('invoice')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.invoiceDate;
    if (value != null) {
      result
        ..add('invoiceDate')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.party;
    if (value != null) {
      result
        ..add('party')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paymentMode;
    if (value != null) {
      result
        ..add('paymentMode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.products;
    if (value != null) {
      result
        ..add('products')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dayId;
    if (value != null) {
      result
        ..add('dayId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.discountAmt;
    if (value != null) {
      result
        ..add('discountAmt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.discountPer;
    if (value != null) {
      result
        ..add('discountPer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.delliveryChrg;
    if (value != null) {
      result
        ..add('delliveryChrg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.taxAmt;
    if (value != null) {
      result
        ..add('taxAmt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.billAmt;
    if (value != null) {
      result
        ..add('billAmt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.finalBillAmt;
    if (value != null) {
      result
        ..add('finalBillAmt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.updateDate;
    if (value != null) {
      result
        ..add('updateDate')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.roundOff;
    if (value != null) {
      result
        ..add('roundOff')
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
  InvoiceRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InvoiceRecordBuilder();

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
        case 'invoice':
          result.invoice = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'invoiceDate':
          result.invoiceDate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'party':
          result.party = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'paymentMode':
          result.paymentMode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'products':
          result.products = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'dayId':
          result.dayId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'discountAmt':
          result.discountAmt = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'discountPer':
          result.discountPer = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'delliveryChrg':
          result.delliveryChrg = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'taxAmt':
          result.taxAmt = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'billAmt':
          result.billAmt = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'finalBillAmt':
          result.finalBillAmt = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'updateDate':
          result.updateDate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'roundOff':
          result.roundOff = serializers.deserialize(value,
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

class _$InvoiceRecord extends InvoiceRecord {
  @override
  final String id;
  @override
  final String invoice;
  @override
  final int invoiceDate;
  @override
  final String party;
  @override
  final String paymentMode;
  @override
  final String products;
  @override
  final String dayId;
  @override
  final double discountAmt;
  @override
  final double discountPer;
  @override
  final double delliveryChrg;
  @override
  final double taxAmt;
  @override
  final double billAmt;
  @override
  final double finalBillAmt;
  @override
  final int updateDate;
  @override
  final int roundOff;
  @override
  final int createdDate;
  @override
  final DocumentReference<Object> createdBy;
  @override
  final DocumentReference<Object> reference;

  factory _$InvoiceRecord([void Function(InvoiceRecordBuilder) updates]) =>
      (new InvoiceRecordBuilder()..update(updates)).build();

  _$InvoiceRecord._(
      {this.id,
      this.invoice,
      this.invoiceDate,
      this.party,
      this.paymentMode,
      this.products,
      this.dayId,
      this.discountAmt,
      this.discountPer,
      this.delliveryChrg,
      this.taxAmt,
      this.billAmt,
      this.finalBillAmt,
      this.updateDate,
      this.roundOff,
      this.createdDate,
      this.createdBy,
      this.reference})
      : super._();

  @override
  InvoiceRecord rebuild(void Function(InvoiceRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InvoiceRecordBuilder toBuilder() => new InvoiceRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InvoiceRecord &&
        id == other.id &&
        invoice == other.invoice &&
        invoiceDate == other.invoiceDate &&
        party == other.party &&
        paymentMode == other.paymentMode &&
        products == other.products &&
        dayId == other.dayId &&
        discountAmt == other.discountAmt &&
        discountPer == other.discountPer &&
        delliveryChrg == other.delliveryChrg &&
        taxAmt == other.taxAmt &&
        billAmt == other.billAmt &&
        finalBillAmt == other.finalBillAmt &&
        updateDate == other.updateDate &&
        roundOff == other.roundOff &&
        createdDate == other.createdDate &&
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
                                                                            0,
                                                                            id
                                                                                .hashCode),
                                                                        invoice
                                                                            .hashCode),
                                                                    invoiceDate
                                                                        .hashCode),
                                                                party.hashCode),
                                                            paymentMode
                                                                .hashCode),
                                                        products.hashCode),
                                                    dayId.hashCode),
                                                discountAmt.hashCode),
                                            discountPer.hashCode),
                                        delliveryChrg.hashCode),
                                    taxAmt.hashCode),
                                billAmt.hashCode),
                            finalBillAmt.hashCode),
                        updateDate.hashCode),
                    roundOff.hashCode),
                createdDate.hashCode),
            createdBy.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InvoiceRecord')
          ..add('id', id)
          ..add('invoice', invoice)
          ..add('invoiceDate', invoiceDate)
          ..add('party', party)
          ..add('paymentMode', paymentMode)
          ..add('products', products)
          ..add('dayId', dayId)
          ..add('discountAmt', discountAmt)
          ..add('discountPer', discountPer)
          ..add('delliveryChrg', delliveryChrg)
          ..add('taxAmt', taxAmt)
          ..add('billAmt', billAmt)
          ..add('finalBillAmt', finalBillAmt)
          ..add('updateDate', updateDate)
          ..add('roundOff', roundOff)
          ..add('createdDate', createdDate)
          ..add('createdBy', createdBy)
          ..add('reference', reference))
        .toString();
  }
}

class InvoiceRecordBuilder
    implements Builder<InvoiceRecord, InvoiceRecordBuilder> {
  _$InvoiceRecord _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _invoice;
  String get invoice => _$this._invoice;
  set invoice(String invoice) => _$this._invoice = invoice;

  int _invoiceDate;
  int get invoiceDate => _$this._invoiceDate;
  set invoiceDate(int invoiceDate) => _$this._invoiceDate = invoiceDate;

  String _party;
  String get party => _$this._party;
  set party(String party) => _$this._party = party;

  String _paymentMode;
  String get paymentMode => _$this._paymentMode;
  set paymentMode(String paymentMode) => _$this._paymentMode = paymentMode;

  String _products;
  String get products => _$this._products;
  set products(String products) => _$this._products = products;

  String _dayId;
  String get dayId => _$this._dayId;
  set dayId(String dayId) => _$this._dayId = dayId;

  double _discountAmt;
  double get discountAmt => _$this._discountAmt;
  set discountAmt(double discountAmt) => _$this._discountAmt = discountAmt;

  double _discountPer;
  double get discountPer => _$this._discountPer;
  set discountPer(double discountPer) => _$this._discountPer = discountPer;

  double _delliveryChrg;
  double get delliveryChrg => _$this._delliveryChrg;
  set delliveryChrg(double delliveryChrg) =>
      _$this._delliveryChrg = delliveryChrg;

  double _taxAmt;
  double get taxAmt => _$this._taxAmt;
  set taxAmt(double taxAmt) => _$this._taxAmt = taxAmt;

  double _billAmt;
  double get billAmt => _$this._billAmt;
  set billAmt(double billAmt) => _$this._billAmt = billAmt;

  double _finalBillAmt;
  double get finalBillAmt => _$this._finalBillAmt;
  set finalBillAmt(double finalBillAmt) => _$this._finalBillAmt = finalBillAmt;

  int _updateDate;
  int get updateDate => _$this._updateDate;
  set updateDate(int updateDate) => _$this._updateDate = updateDate;

  int _roundOff;
  int get roundOff => _$this._roundOff;
  set roundOff(int roundOff) => _$this._roundOff = roundOff;

  int _createdDate;
  int get createdDate => _$this._createdDate;
  set createdDate(int createdDate) => _$this._createdDate = createdDate;

  DocumentReference<Object> _createdBy;
  DocumentReference<Object> get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object> createdBy) =>
      _$this._createdBy = createdBy;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  InvoiceRecordBuilder() {
    InvoiceRecord._initializeBuilder(this);
  }

  InvoiceRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _invoice = $v.invoice;
      _invoiceDate = $v.invoiceDate;
      _party = $v.party;
      _paymentMode = $v.paymentMode;
      _products = $v.products;
      _dayId = $v.dayId;
      _discountAmt = $v.discountAmt;
      _discountPer = $v.discountPer;
      _delliveryChrg = $v.delliveryChrg;
      _taxAmt = $v.taxAmt;
      _billAmt = $v.billAmt;
      _finalBillAmt = $v.finalBillAmt;
      _updateDate = $v.updateDate;
      _roundOff = $v.roundOff;
      _createdDate = $v.createdDate;
      _createdBy = $v.createdBy;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InvoiceRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InvoiceRecord;
  }

  @override
  void update(void Function(InvoiceRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InvoiceRecord build() {
    final _$result = _$v ??
        new _$InvoiceRecord._(
            id: id,
            invoice: invoice,
            invoiceDate: invoiceDate,
            party: party,
            paymentMode: paymentMode,
            products: products,
            dayId: dayId,
            discountAmt: discountAmt,
            discountPer: discountPer,
            delliveryChrg: delliveryChrg,
            taxAmt: taxAmt,
            billAmt: billAmt,
            finalBillAmt: finalBillAmt,
            updateDate: updateDate,
            roundOff: roundOff,
            createdDate: createdDate,
            createdBy: createdBy,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
