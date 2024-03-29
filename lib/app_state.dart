import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _logedInUserRef =
          prefs.getString('ff_logedInUserRef')?.ref ?? _logedInUserRef;
    });
    _safeInit(() {
      _CompanyDetailsRef =
          prefs.getString('ff_CompanyDetailsRef')?.ref ?? _CompanyDetailsRef;
    });
    _safeInit(() {
      _bMDocRef = prefs.getString('ff_bMDocRef')?.ref ?? _bMDocRef;
    });
    _safeInit(() {
      _outletRef = prefs.getString('ff_outletRef')?.ref ?? _outletRef;
    });
    _safeInit(() {
      _catCodeLength = prefs.getString('ff_catCodeLength') ?? _catCodeLength;
    });
    _safeInit(() {
      _setCategoryMasterName =
          prefs.getString('ff_setCategoryMasterName') ?? _setCategoryMasterName;
    });
    _safeInit(() {
      _selectCategoryMasterRef =
          prefs.getString('ff_selectCategoryMasterRef')?.ref ??
              _selectCategoryMasterRef;
    });
    _safeInit(() {
      _catCodeLengtH = prefs.getInt('ff_catCodeLengtH') ?? _catCodeLengtH;
    });
    _safeInit(() {
      _premisesCodeLength =
          prefs.getInt('ff_premisesCodeLength') ?? _premisesCodeLength;
    });
    _safeInit(() {
      _setPremisesName =
          prefs.getString('ff_setPremisesName') ?? _setPremisesName;
    });
    _safeInit(() {
      _selectPremiseRef =
          prefs.getString('ff_selectPremiseRef')?.ref ?? _selectPremiseRef;
    });
    _safeInit(() {
      _catCodeLengthPremises =
          prefs.getInt('ff_catCodeLengthPremises') ?? _catCodeLengthPremises;
    });
    _safeInit(() {
      _servicePointOutletCodeLength =
          prefs.getInt('ff_servicePointOutletCodeLength') ??
              _servicePointOutletCodeLength;
    });
    _safeInit(() {
      _userAccountCatCodeLength = prefs.getInt('ff_userAccountCatCodeLength') ??
          _userAccountCatCodeLength;
    });
    _safeInit(() {
      _outletId = prefs.getString('ff_outletId') ?? _outletId;
    });
    _safeInit(() {
      _shift = prefs.getString('ff_shift') ?? _shift;
    });
    _safeInit(() {
      _deviceId = prefs.getString('ff_deviceId') ?? _deviceId;
    });
    _safeInit(() {
      _Bill = prefs.getString('ff_Bill') ?? _Bill;
    });
    _safeInit(() {
      _delete = prefs.getBool('ff_delete') ?? _delete;
    });
    _safeInit(() {
      _currentMobile = prefs.getString('ff_currentMobile') ?? _currentMobile;
    });
    _safeInit(() {
      _currentEmail = prefs.getString('ff_currentEmail') ?? _currentEmail;
    });
    _safeInit(() {
      _itemCartList = prefs.getStringList('ff_itemCartList')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _itemCartList;
    });
    _safeInit(() {
      _comboSellingPrice =
          prefs.getDouble('ff_comboSellingPrice') ?? _comboSellingPrice;
    });
    _safeInit(() {
      _comboMRPPrice = prefs.getDouble('ff_comboMRPPrice') ?? _comboMRPPrice;
    });
    _safeInit(() {
      _comboPurchasePrice =
          prefs.getDouble('ff_comboPurchasePrice') ?? _comboPurchasePrice;
    });
    _safeInit(() {
      _comboCategoryRef =
          prefs.getString('ff_comboCategoryRef')?.ref ?? _comboCategoryRef;
    });
    _safeInit(() {
      _comboTaxRef = prefs.getString('ff_comboTaxRef')?.ref ?? _comboTaxRef;
    });
    _safeInit(() {
      _comboUnitRef = prefs.getString('ff_comboUnitRef')?.ref ?? _comboUnitRef;
    });
    _safeInit(() {
      _comboSubCategoryRef = prefs.getString('ff_comboSubCategoryRef')?.ref ??
          _comboSubCategoryRef;
    });
    _safeInit(() {
      _comboProductMasterRef =
          prefs.getString('ff_comboProductMasterRef')?.ref ??
              _comboProductMasterRef;
    });
    _safeInit(() {
      _setProductName = prefs.getString('ff_setProductName') ?? _setProductName;
    });
    _safeInit(() {
      _BMDocId = prefs.getString('ff_BMDocId') ?? _BMDocId;
    });
    _safeInit(() {
      _setBMcolor = prefs.getString('ff_setBMcolor') ?? _setBMcolor;
    });
    _safeInit(() {
      _loggedInUser = prefs.getStringList('ff_loggedInUser')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _loggedInUser;
    });
    _safeInit(() {
      _codeUpdate =
          prefs.getStringList('ff_codeUpdate')?.map(int.parse).toList() ??
              _codeUpdate;
    });
    _safeInit(() {
      _showList2 = prefs.getBool('ff_showList2') ?? _showList2;
    });
    _safeInit(() {
      _rawCatRef = prefs.getString('ff_rawCatRef') ?? _rawCatRef;
    });
    _safeInit(() {
      _totalQuantity = prefs.getDouble('ff_totalQuantity') ?? _totalQuantity;
    });
    _safeInit(() {
      _resultList = prefs.getStringList('ff_resultList')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _resultList;
    });
    _safeInit(() {
      _filtervalue = prefs.getString('ff_filtervalue') ?? _filtervalue;
    });
    _safeInit(() {
      _filterDate = prefs.getString('ff_filterDate') ?? _filterDate;
    });
    _safeInit(() {
      _selectStartDate = prefs.getInt('ff_selectStartDate') ?? _selectStartDate;
    });
    _safeInit(() {
      _selectEndDate = prefs.getInt('ff_selectEndDate') ?? _selectEndDate;
    });
    _safeInit(() {
      _outletIdRef = prefs.getString('ff_outletIdRef')?.ref ?? _outletIdRef;
    });
    _safeInit(() {
      _todaysTotal = prefs.getStringList('ff_todaysTotal')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _todaysTotal;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_summaryJSON')) {
        try {
          _summaryJSON = jsonDecode(prefs.getString('ff_summaryJSON') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _selectedDayId = prefs.getString('ff_selectedDayId') ?? _selectedDayId;
    });
    _safeInit(() {
      _shiftBill = prefs.getBool('ff_shiftBill') ?? _shiftBill;
    });
    _safeInit(() {
      _hide = prefs.getBool('ff_hide') ?? _hide;
    });
    _safeInit(() {
      _showList = prefs.getBool('ff_showList') ?? _showList;
    });
    _safeInit(() {
      _reportData = prefs.getStringList('ff_reportData')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _reportData;
    });
    _safeInit(() {
      _allLeads = prefs.getStringList('ff_allLeads')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _allLeads;
    });
    _safeInit(() {
      _assignedExec = prefs.getBool('ff_assignedExec') ?? _assignedExec;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_productData')) {
        try {
          _productData = jsonDecode(prefs.getString('ff_productData') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _assignLead = prefs.getString('ff_assignLead') ?? _assignLead;
    });
    _safeInit(() {
      _leadStatus = prefs.getString('ff_leadStatus') ?? _leadStatus;
    });
    _safeInit(() {
      _followUpDate = prefs.getInt('ff_followUpDate') ?? _followUpDate;
    });
    _safeInit(() {
      _followUpTime = prefs.getInt('ff_followUpTime') ?? _followUpTime;
    });
    _safeInit(() {
      _leadCreateValue =
          prefs.getString('ff_leadCreateValue') ?? _leadCreateValue;
    });
    _safeInit(() {
      _nleads = _colorFromIntValue(prefs.getInt('ff_nleads')) ?? _nleads;
    });
    _safeInit(() {
      _aleads = _colorFromIntValue(prefs.getInt('ff_aleads')) ?? _aleads;
    });
    _safeInit(() {
      _fLeads = _colorFromIntValue(prefs.getInt('ff_fLeads')) ?? _fLeads;
    });
    _safeInit(() {
      _cLeads = _colorFromIntValue(prefs.getInt('ff_cLeads')) ?? _cLeads;
    });
    _safeInit(() {
      _containerFillColor =
          _colorFromIntValue(prefs.getInt('ff_containerFillColor')) ??
              _containerFillColor;
    });
    _safeInit(() {
      _leadtagCode = prefs.getInt('ff_leadtagCode') ?? _leadtagCode;
    });
    _safeInit(() {
      _tagIsDeleted = prefs.getBool('ff_tagIsDeleted') ?? _tagIsDeleted;
    });
    _safeInit(() {
      _tagSearch = prefs.getBool('ff_tagSearch') ?? _tagSearch;
    });
    _safeInit(() {
      _tagList = prefs.getStringList('ff_tagList')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _tagList;
    });
    _safeInit(() {
      _newLead = prefs.getBool('ff_newLead') ?? _newLead;
    });
    _safeInit(() {
      _tagListDemo = prefs.getStringList('ff_tagListDemo')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _tagListDemo;
    });
    _safeInit(() {
      _demoRef = prefs.getString('ff_demoRef')?.ref ?? _demoRef;
    });
    _safeInit(() {
      _selectedUserDemo =
          prefs.getString('ff_selectedUserDemo') ?? _selectedUserDemo;
    });
    _safeInit(() {
      _userDemoList = prefs.getBool('ff_userDemoList') ?? _userDemoList;
    });
    _safeInit(() {
      _dLead = _colorFromIntValue(prefs.getInt('ff_dLead')) ?? _dLead;
    });
    _safeInit(() {
      _isVisible = prefs.getBool('ff_isVisible') ?? _isVisible;
    });
    _safeInit(() {
      _demoListDate = prefs.getString('ff_demoListDate') ?? _demoListDate;
    });
    _safeInit(() {
      _newLeadCounts = prefs.getStringList('ff_newLeadCounts')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _newLeadCounts;
    });
    _safeInit(() {
      _assignedLeadCount =
          prefs.getStringList('ff_assignedLeadCount')?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _assignedLeadCount;
    });
    _safeInit(() {
      _followUpLeadCount =
          prefs.getStringList('ff_followUpLeadCount')?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _followUpLeadCount;
    });
    _safeInit(() {
      _completedLeadCount =
          prefs.getStringList('ff_completedLeadCount')?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _completedLeadCount;
    });
    _safeInit(() {
      _lostLeadCount = prefs.getStringList('ff_lostLeadCount')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _lostLeadCount;
    });
    _safeInit(() {
      _lostLeadIcon = prefs.getBool('ff_lostLeadIcon') ?? _lostLeadIcon;
    });
    _safeInit(() {
      _lostLeadReason = prefs.getString('ff_lostLeadReason') ?? _lostLeadReason;
    });
    _safeInit(() {
      _startDate = prefs.getInt('ff_startDate') ?? _startDate;
    });
    _safeInit(() {
      _endDate = prefs.getInt('ff_endDate') ?? _endDate;
    });
    _safeInit(() {
      _tagName = prefs.getString('ff_tagName') ?? _tagName;
    });
    _safeInit(() {
      _leadTagList = prefs.getStringList('ff_leadTagList')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _leadTagList;
    });
    _safeInit(() {
      _dropDownStatus = prefs.getString('ff_dropDownStatus') ?? _dropDownStatus;
    });
    _safeInit(() {
      _showStatus = prefs.getBool('ff_showStatus') ?? _showStatus;
    });
    _safeInit(() {
      _cDemoDone =
          _colorFromIntValue(prefs.getInt('ff_cDemoDone')) ?? _cDemoDone;
    });
    _safeInit(() {
      _cDemoResch =
          _colorFromIntValue(prefs.getInt('ff_cDemoResch')) ?? _cDemoResch;
    });
    _safeInit(() {
      _cHold = _colorFromIntValue(prefs.getInt('ff_cHold')) ?? _cHold;
    });
    _safeInit(() {
      _cFollowUp =
          _colorFromIntValue(prefs.getInt('ff_cFollowUp')) ?? _cFollowUp;
    });
    _safeInit(() {
      _cInstallation = _colorFromIntValue(prefs.getInt('ff_cInstallation')) ??
          _cInstallation;
    });
    _safeInit(() {
      _cLost = _colorFromIntValue(prefs.getInt('ff_cLost')) ?? _cLost;
    });
    _safeInit(() {
      _cAll = _colorFromIntValue(prefs.getInt('ff_cAll')) ?? _cAll;
    });
    _safeInit(() {
      _selectedDateFollowUpList =
          prefs.getString('ff_selectedDateFollowUpList') ??
              _selectedDateFollowUpList;
    });
    _safeInit(() {
      _selectedTag = prefs.getString('ff_selectedTag') ?? _selectedTag;
    });
    _safeInit(() {
      _allLostLead = prefs.getBool('ff_allLostLead') ?? _allLostLead;
    });
    _safeInit(() {
      _tagColor = prefs.getString('ff_tagColor') ?? _tagColor;
    });
    _safeInit(() {
      _allTagBtn =
          _colorFromIntValue(prefs.getInt('ff_allTagBtn')) ?? _allTagBtn;
    });
    _safeInit(() {
      _comboServicepointoutlet =
          prefs.getString('ff_comboServicepointoutlet')?.ref ??
              _comboServicepointoutlet;
    });
    _safeInit(() {
      _selectedDate = prefs.getInt('ff_selectedDate') ?? _selectedDate;
    });
    _safeInit(() {
      _dateForReport = prefs.getString('ff_dateForReport') ?? _dateForReport;
    });
    _safeInit(() {
      _outletLead = prefs.getBool('ff_outletLead') ?? _outletLead;
    });
    _safeInit(() {
      _stage = prefs.getString('ff_stage') ?? _stage;
    });
    _safeInit(() {
      _superAdmin = prefs.getString('ff_superAdmin') ?? _superAdmin;
    });
    _safeInit(() {
      _superAdminPassword =
          prefs.getString('ff_superAdminPassword') ?? _superAdminPassword;
    });
    _safeInit(() {
      _selectedDealer = prefs.getString('ff_selectedDealer') ?? _selectedDealer;
    });
    _safeInit(() {
      _searchHide = prefs.getBool('ff_searchHide') ?? _searchHide;
    });
    _safeInit(() {
      _lleads = _colorFromIntValue(prefs.getInt('ff_lleads')) ?? _lleads;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _regionalNames = [];
  List<String> get regionalNames => _regionalNames;
  set regionalNames(List<String> _value) {
    _regionalNames = _value;
  }

  void addToRegionalNames(String _value) {
    _regionalNames.add(_value);
  }

  void removeFromRegionalNames(String _value) {
    _regionalNames.remove(_value);
  }

  void removeAtIndexFromRegionalNames(int _index) {
    _regionalNames.removeAt(_index);
  }

  void updateRegionalNamesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _regionalNames[_index] = updateFn(_regionalNames[_index]);
  }

  void insertAtIndexInRegionalNames(int _index, String _value) {
    _regionalNames.insert(_index, _value);
  }

  bool _catRefField = false;
  bool get catRefField => _catRefField;
  set catRefField(bool _value) {
    _catRefField = _value;
  }

  String _regName = '';
  String get regName => _regName;
  set regName(String _value) {
    _regName = _value;
  }

  List<dynamic> _names = [];
  List<dynamic> get names => _names;
  set names(List<dynamic> _value) {
    _names = _value;
  }

  void addToNames(dynamic _value) {
    _names.add(_value);
  }

  void removeFromNames(dynamic _value) {
    _names.remove(_value);
  }

  void removeAtIndexFromNames(int _index) {
    _names.removeAt(_index);
  }

  void updateNamesAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _names[_index] = updateFn(_names[_index]);
  }

  void insertAtIndexInNames(int _index, dynamic _value) {
    _names.insert(_index, _value);
  }

  dynamic _regionalValue;
  dynamic get regionalValue => _regionalValue;
  set regionalValue(dynamic _value) {
    _regionalValue = _value;
  }

  bool _showNameList = false;
  bool get showNameList => _showNameList;
  set showNameList(bool _value) {
    _showNameList = _value;
  }

  double _subscriptionAmount = 0.0;
  double get subscriptionAmount => _subscriptionAmount;
  set subscriptionAmount(double _value) {
    _subscriptionAmount = _value;
  }

  bool _activeInactiveFlag = false;
  bool get activeInactiveFlag => _activeInactiveFlag;
  set activeInactiveFlag(bool _value) {
    _activeInactiveFlag = _value;
  }

  DocumentReference? _logedInUserRef;
  DocumentReference? get logedInUserRef => _logedInUserRef;
  set logedInUserRef(DocumentReference? _value) {
    _logedInUserRef = _value;
    _value != null
        ? prefs.setString('ff_logedInUserRef', _value.path)
        : prefs.remove('ff_logedInUserRef');
  }

  DocumentReference? _CompanyDetailsRef =
      FirebaseFirestore.instance.doc('/COMPANY_DETAILS/aM3jgmben7TH7V9QKNqa');
  DocumentReference? get CompanyDetailsRef => _CompanyDetailsRef;
  set CompanyDetailsRef(DocumentReference? _value) {
    _CompanyDetailsRef = _value;
    _value != null
        ? prefs.setString('ff_CompanyDetailsRef', _value.path)
        : prefs.remove('ff_CompanyDetailsRef');
  }

  DocumentReference? _bMDocRef;
  DocumentReference? get bMDocRef => _bMDocRef;
  set bMDocRef(DocumentReference? _value) {
    _bMDocRef = _value;
    _value != null
        ? prefs.setString('ff_bMDocRef', _value.path)
        : prefs.remove('ff_bMDocRef');
  }

  DocumentReference? _outletRef;
  DocumentReference? get outletRef => _outletRef;
  set outletRef(DocumentReference? _value) {
    _outletRef = _value;
    _value != null
        ? prefs.setString('ff_outletRef', _value.path)
        : prefs.remove('ff_outletRef');
  }

  String _catCodeLength = '';
  String get catCodeLength => _catCodeLength;
  set catCodeLength(String _value) {
    _catCodeLength = _value;
    prefs.setString('ff_catCodeLength', _value);
  }

  String _setCategoryMasterName = '';
  String get setCategoryMasterName => _setCategoryMasterName;
  set setCategoryMasterName(String _value) {
    _setCategoryMasterName = _value;
    prefs.setString('ff_setCategoryMasterName', _value);
  }

  DocumentReference? _selectCategoryMasterRef;
  DocumentReference? get selectCategoryMasterRef => _selectCategoryMasterRef;
  set selectCategoryMasterRef(DocumentReference? _value) {
    _selectCategoryMasterRef = _value;
    _value != null
        ? prefs.setString('ff_selectCategoryMasterRef', _value.path)
        : prefs.remove('ff_selectCategoryMasterRef');
  }

  int _catCodeLengtH = 0;
  int get catCodeLengtH => _catCodeLengtH;
  set catCodeLengtH(int _value) {
    _catCodeLengtH = _value;
    prefs.setInt('ff_catCodeLengtH', _value);
  }

  bool _isFullListShown = true;
  bool get isFullListShown => _isFullListShown;
  set isFullListShown(bool _value) {
    _isFullListShown = _value;
  }

  int _premisesCodeLength = 0;
  int get premisesCodeLength => _premisesCodeLength;
  set premisesCodeLength(int _value) {
    _premisesCodeLength = _value;
    prefs.setInt('ff_premisesCodeLength', _value);
  }

  String _setPremisesName = '';
  String get setPremisesName => _setPremisesName;
  set setPremisesName(String _value) {
    _setPremisesName = _value;
    prefs.setString('ff_setPremisesName', _value);
  }

  DocumentReference? _selectPremiseRef;
  DocumentReference? get selectPremiseRef => _selectPremiseRef;
  set selectPremiseRef(DocumentReference? _value) {
    _selectPremiseRef = _value;
    _value != null
        ? prefs.setString('ff_selectPremiseRef', _value.path)
        : prefs.remove('ff_selectPremiseRef');
  }

  int _catCodeLengthPremises = 0;
  int get catCodeLengthPremises => _catCodeLengthPremises;
  set catCodeLengthPremises(int _value) {
    _catCodeLengthPremises = _value;
    prefs.setInt('ff_catCodeLengthPremises', _value);
  }

  int _servicePointOutletCodeLength = 0;
  int get servicePointOutletCodeLength => _servicePointOutletCodeLength;
  set servicePointOutletCodeLength(int _value) {
    _servicePointOutletCodeLength = _value;
    prefs.setInt('ff_servicePointOutletCodeLength', _value);
  }

  int _userAccountCatCodeLength = 0;
  int get userAccountCatCodeLength => _userAccountCatCodeLength;
  set userAccountCatCodeLength(int _value) {
    _userAccountCatCodeLength = _value;
    prefs.setInt('ff_userAccountCatCodeLength', _value);
  }

  String _outletId = '';
  String get outletId => _outletId;
  set outletId(String _value) {
    _outletId = _value;
    prefs.setString('ff_outletId', _value);
  }

  String _shift = '';
  String get shift => _shift;
  set shift(String _value) {
    _shift = _value;
    prefs.setString('ff_shift', _value);
  }

  String _deviceId = '';
  String get deviceId => _deviceId;
  set deviceId(String _value) {
    _deviceId = _value;
    prefs.setString('ff_deviceId', _value);
  }

  String _Bill = '';
  String get Bill => _Bill;
  set Bill(String _value) {
    _Bill = _value;
    prefs.setString('ff_Bill', _value);
  }

  bool _delete = false;
  bool get delete => _delete;
  set delete(bool _value) {
    _delete = _value;
    prefs.setBool('ff_delete', _value);
  }

  String _currentMobile = '';
  String get currentMobile => _currentMobile;
  set currentMobile(String _value) {
    _currentMobile = _value;
    prefs.setString('ff_currentMobile', _value);
  }

  DocumentReference? _docRef;
  DocumentReference? get docRef => _docRef;
  set docRef(DocumentReference? _value) {
    _docRef = _value;
  }

  String _currentEmail = '';
  String get currentEmail => _currentEmail;
  set currentEmail(String _value) {
    _currentEmail = _value;
    prefs.setString('ff_currentEmail', _value);
  }

  List<dynamic> _itemCartList = [];
  List<dynamic> get itemCartList => _itemCartList;
  set itemCartList(List<dynamic> _value) {
    _itemCartList = _value;
    prefs.setStringList(
        'ff_itemCartList', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToItemCartList(dynamic _value) {
    _itemCartList.add(_value);
    prefs.setStringList(
        'ff_itemCartList', _itemCartList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromItemCartList(dynamic _value) {
    _itemCartList.remove(_value);
    prefs.setStringList(
        'ff_itemCartList', _itemCartList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromItemCartList(int _index) {
    _itemCartList.removeAt(_index);
    prefs.setStringList(
        'ff_itemCartList', _itemCartList.map((x) => jsonEncode(x)).toList());
  }

  void updateItemCartListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _itemCartList[_index] = updateFn(_itemCartList[_index]);
    prefs.setStringList(
        'ff_itemCartList', _itemCartList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInItemCartList(int _index, dynamic _value) {
    _itemCartList.insert(_index, _value);
    prefs.setStringList(
        'ff_itemCartList', _itemCartList.map((x) => jsonEncode(x)).toList());
  }

  double _comboSellingPrice = 0.0;
  double get comboSellingPrice => _comboSellingPrice;
  set comboSellingPrice(double _value) {
    _comboSellingPrice = _value;
    prefs.setDouble('ff_comboSellingPrice', _value);
  }

  double _comboMRPPrice = 0.0;
  double get comboMRPPrice => _comboMRPPrice;
  set comboMRPPrice(double _value) {
    _comboMRPPrice = _value;
    prefs.setDouble('ff_comboMRPPrice', _value);
  }

  double _comboPurchasePrice = 0.0;
  double get comboPurchasePrice => _comboPurchasePrice;
  set comboPurchasePrice(double _value) {
    _comboPurchasePrice = _value;
    prefs.setDouble('ff_comboPurchasePrice', _value);
  }

  DocumentReference? _comboCategoryRef =
      FirebaseFirestore.instance.doc('/CATEGORY/xRc31dWaYKkucwug5dCm');
  DocumentReference? get comboCategoryRef => _comboCategoryRef;
  set comboCategoryRef(DocumentReference? _value) {
    _comboCategoryRef = _value;
    _value != null
        ? prefs.setString('ff_comboCategoryRef', _value.path)
        : prefs.remove('ff_comboCategoryRef');
  }

  DocumentReference? _comboTaxRef =
      FirebaseFirestore.instance.doc('/TAX_MASTER/FTLkVGa55IBCbvwKmioA');
  DocumentReference? get comboTaxRef => _comboTaxRef;
  set comboTaxRef(DocumentReference? _value) {
    _comboTaxRef = _value;
    _value != null
        ? prefs.setString('ff_comboTaxRef', _value.path)
        : prefs.remove('ff_comboTaxRef');
  }

  DocumentReference? _comboUnitRef =
      FirebaseFirestore.instance.doc('/UNIT_TYPE/kVHgDo7iBFC7ecCeRmr0');
  DocumentReference? get comboUnitRef => _comboUnitRef;
  set comboUnitRef(DocumentReference? _value) {
    _comboUnitRef = _value;
    _value != null
        ? prefs.setString('ff_comboUnitRef', _value.path)
        : prefs.remove('ff_comboUnitRef');
  }

  DocumentReference? _comboSubCategoryRef =
      FirebaseFirestore.instance.doc('/SUB_CATEGORY/jelwkw5tJA7I8AhjrCX4');
  DocumentReference? get comboSubCategoryRef => _comboSubCategoryRef;
  set comboSubCategoryRef(DocumentReference? _value) {
    _comboSubCategoryRef = _value;
    _value != null
        ? prefs.setString('ff_comboSubCategoryRef', _value.path)
        : prefs.remove('ff_comboSubCategoryRef');
  }

  DocumentReference? _comboProductMasterRef =
      FirebaseFirestore.instance.doc('/PRODUCT_MASTER/7PVD9JFkMooK03qunQPY');
  DocumentReference? get comboProductMasterRef => _comboProductMasterRef;
  set comboProductMasterRef(DocumentReference? _value) {
    _comboProductMasterRef = _value;
    _value != null
        ? prefs.setString('ff_comboProductMasterRef', _value.path)
        : prefs.remove('ff_comboProductMasterRef');
  }

  String _setProductName = '';
  String get setProductName => _setProductName;
  set setProductName(String _value) {
    _setProductName = _value;
    prefs.setString('ff_setProductName', _value);
  }

  String _BMDocId = '';
  String get BMDocId => _BMDocId;
  set BMDocId(String _value) {
    _BMDocId = _value;
    prefs.setString('ff_BMDocId', _value);
  }

  String _setBMcolor = '';
  String get setBMcolor => _setBMcolor;
  set setBMcolor(String _value) {
    _setBMcolor = _value;
    prefs.setString('ff_setBMcolor', _value);
  }

  List<dynamic> _loggedInUser = [];
  List<dynamic> get loggedInUser => _loggedInUser;
  set loggedInUser(List<dynamic> _value) {
    _loggedInUser = _value;
    prefs.setStringList(
        'ff_loggedInUser', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToLoggedInUser(dynamic _value) {
    _loggedInUser.add(_value);
    prefs.setStringList(
        'ff_loggedInUser', _loggedInUser.map((x) => jsonEncode(x)).toList());
  }

  void removeFromLoggedInUser(dynamic _value) {
    _loggedInUser.remove(_value);
    prefs.setStringList(
        'ff_loggedInUser', _loggedInUser.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromLoggedInUser(int _index) {
    _loggedInUser.removeAt(_index);
    prefs.setStringList(
        'ff_loggedInUser', _loggedInUser.map((x) => jsonEncode(x)).toList());
  }

  void updateLoggedInUserAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _loggedInUser[_index] = updateFn(_loggedInUser[_index]);
    prefs.setStringList(
        'ff_loggedInUser', _loggedInUser.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInLoggedInUser(int _index, dynamic _value) {
    _loggedInUser.insert(_index, _value);
    prefs.setStringList(
        'ff_loggedInUser', _loggedInUser.map((x) => jsonEncode(x)).toList());
  }

  List<int> _codeUpdate = [];
  List<int> get codeUpdate => _codeUpdate;
  set codeUpdate(List<int> _value) {
    _codeUpdate = _value;
    prefs.setStringList(
        'ff_codeUpdate', _value.map((x) => x.toString()).toList());
  }

  void addToCodeUpdate(int _value) {
    _codeUpdate.add(_value);
    prefs.setStringList(
        'ff_codeUpdate', _codeUpdate.map((x) => x.toString()).toList());
  }

  void removeFromCodeUpdate(int _value) {
    _codeUpdate.remove(_value);
    prefs.setStringList(
        'ff_codeUpdate', _codeUpdate.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromCodeUpdate(int _index) {
    _codeUpdate.removeAt(_index);
    prefs.setStringList(
        'ff_codeUpdate', _codeUpdate.map((x) => x.toString()).toList());
  }

  void updateCodeUpdateAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _codeUpdate[_index] = updateFn(_codeUpdate[_index]);
    prefs.setStringList(
        'ff_codeUpdate', _codeUpdate.map((x) => x.toString()).toList());
  }

  void insertAtIndexInCodeUpdate(int _index, int _value) {
    _codeUpdate.insert(_index, _value);
    prefs.setStringList(
        'ff_codeUpdate', _codeUpdate.map((x) => x.toString()).toList());
  }

  String _barcode = '';
  String get barcode => _barcode;
  set barcode(String _value) {
    _barcode = _value;
  }

  double _progr = 60.0;
  double get progr => _progr;
  set progr(double _value) {
    _progr = _value;
  }

  bool _dropdown = false;
  bool get dropdown => _dropdown;
  set dropdown(bool _value) {
    _dropdown = _value;
  }

  bool _dropdown1 = false;
  bool get dropdown1 => _dropdown1;
  set dropdown1(bool _value) {
    _dropdown1 = _value;
  }

  double _finalAmt = 0.0;
  double get finalAmt => _finalAmt;
  set finalAmt(double _value) {
    _finalAmt = _value;
  }

  int _roundOff = 0;
  int get roundOff => _roundOff;
  set roundOff(int _value) {
    _roundOff = _value;
  }

  double _balAmt = 0.0;
  double get balAmt => _balAmt;
  set balAmt(double _value) {
    _balAmt = _value;
  }

  bool _showList2 = true;
  bool get showList2 => _showList2;
  set showList2(bool _value) {
    _showList2 = _value;
    prefs.setBool('ff_showList2', _value);
  }

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;
  set totalPrice(double _value) {
    _totalPrice = _value;
  }

  double _discountPer = 0.0;
  double get discountPer => _discountPer;
  set discountPer(double _value) {
    _discountPer = _value;
  }

  double _gstRate = 0.0;
  double get gstRate => _gstRate;
  set gstRate(double _value) {
    _gstRate = _value;
  }

  double _disAmt = 0.0;
  double get disAmt => _disAmt;
  set disAmt(double _value) {
    _disAmt = _value;
  }

  String _rawCatRef = '';
  String get rawCatRef => _rawCatRef;
  set rawCatRef(String _value) {
    _rawCatRef = _value;
    prefs.setString('ff_rawCatRef', _value);
  }

  double _totalQuantity = 0.0;
  double get totalQuantity => _totalQuantity;
  set totalQuantity(double _value) {
    _totalQuantity = _value;
    prefs.setDouble('ff_totalQuantity', _value);
  }

  bool _isFullList = false;
  bool get isFullList => _isFullList;
  set isFullList(bool _value) {
    _isFullList = _value;
  }

  List<dynamic> _resultList = [];
  List<dynamic> get resultList => _resultList;
  set resultList(List<dynamic> _value) {
    _resultList = _value;
    prefs.setStringList(
        'ff_resultList', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToResultList(dynamic _value) {
    _resultList.add(_value);
    prefs.setStringList(
        'ff_resultList', _resultList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromResultList(dynamic _value) {
    _resultList.remove(_value);
    prefs.setStringList(
        'ff_resultList', _resultList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromResultList(int _index) {
    _resultList.removeAt(_index);
    prefs.setStringList(
        'ff_resultList', _resultList.map((x) => jsonEncode(x)).toList());
  }

  void updateResultListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _resultList[_index] = updateFn(_resultList[_index]);
    prefs.setStringList(
        'ff_resultList', _resultList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInResultList(int _index, dynamic _value) {
    _resultList.insert(_index, _value);
    prefs.setStringList(
        'ff_resultList', _resultList.map((x) => jsonEncode(x)).toList());
  }

  String _filtervalue = '';
  String get filtervalue => _filtervalue;
  set filtervalue(String _value) {
    _filtervalue = _value;
    prefs.setString('ff_filtervalue', _value);
  }

  String _filterDate = '';
  String get filterDate => _filterDate;
  set filterDate(String _value) {
    _filterDate = _value;
    prefs.setString('ff_filterDate', _value);
  }

  int _selectStartDate = 0;
  int get selectStartDate => _selectStartDate;
  set selectStartDate(int _value) {
    _selectStartDate = _value;
    prefs.setInt('ff_selectStartDate', _value);
  }

  int _selectEndDate = 0;
  int get selectEndDate => _selectEndDate;
  set selectEndDate(int _value) {
    _selectEndDate = _value;
    prefs.setInt('ff_selectEndDate', _value);
  }

  DocumentReference? _outletIdRef;
  DocumentReference? get outletIdRef => _outletIdRef;
  set outletIdRef(DocumentReference? _value) {
    _outletIdRef = _value;
    _value != null
        ? prefs.setString('ff_outletIdRef', _value.path)
        : prefs.remove('ff_outletIdRef');
  }

  List<dynamic> _todaysTotal = [];
  List<dynamic> get todaysTotal => _todaysTotal;
  set todaysTotal(List<dynamic> _value) {
    _todaysTotal = _value;
    prefs.setStringList(
        'ff_todaysTotal', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToTodaysTotal(dynamic _value) {
    _todaysTotal.add(_value);
    prefs.setStringList(
        'ff_todaysTotal', _todaysTotal.map((x) => jsonEncode(x)).toList());
  }

  void removeFromTodaysTotal(dynamic _value) {
    _todaysTotal.remove(_value);
    prefs.setStringList(
        'ff_todaysTotal', _todaysTotal.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromTodaysTotal(int _index) {
    _todaysTotal.removeAt(_index);
    prefs.setStringList(
        'ff_todaysTotal', _todaysTotal.map((x) => jsonEncode(x)).toList());
  }

  void updateTodaysTotalAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _todaysTotal[_index] = updateFn(_todaysTotal[_index]);
    prefs.setStringList(
        'ff_todaysTotal', _todaysTotal.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInTodaysTotal(int _index, dynamic _value) {
    _todaysTotal.insert(_index, _value);
    prefs.setStringList(
        'ff_todaysTotal', _todaysTotal.map((x) => jsonEncode(x)).toList());
  }

  dynamic _summaryJSON;
  dynamic get summaryJSON => _summaryJSON;
  set summaryJSON(dynamic _value) {
    _summaryJSON = _value;
    prefs.setString('ff_summaryJSON', jsonEncode(_value));
  }

  String _selectedDayId = '';
  String get selectedDayId => _selectedDayId;
  set selectedDayId(String _value) {
    _selectedDayId = _value;
    prefs.setString('ff_selectedDayId', _value);
  }

  bool _shiftBill = false;
  bool get shiftBill => _shiftBill;
  set shiftBill(bool _value) {
    _shiftBill = _value;
    prefs.setBool('ff_shiftBill', _value);
  }

  bool _hide = false;
  bool get hide => _hide;
  set hide(bool _value) {
    _hide = _value;
    prefs.setBool('ff_hide', _value);
  }

  bool _showList = true;
  bool get showList => _showList;
  set showList(bool _value) {
    _showList = _value;
    prefs.setBool('ff_showList', _value);
  }

  List<dynamic> _reportData = [];
  List<dynamic> get reportData => _reportData;
  set reportData(List<dynamic> _value) {
    _reportData = _value;
    prefs.setStringList(
        'ff_reportData', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToReportData(dynamic _value) {
    _reportData.add(_value);
    prefs.setStringList(
        'ff_reportData', _reportData.map((x) => jsonEncode(x)).toList());
  }

  void removeFromReportData(dynamic _value) {
    _reportData.remove(_value);
    prefs.setStringList(
        'ff_reportData', _reportData.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromReportData(int _index) {
    _reportData.removeAt(_index);
    prefs.setStringList(
        'ff_reportData', _reportData.map((x) => jsonEncode(x)).toList());
  }

  void updateReportDataAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _reportData[_index] = updateFn(_reportData[_index]);
    prefs.setStringList(
        'ff_reportData', _reportData.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInReportData(int _index, dynamic _value) {
    _reportData.insert(_index, _value);
    prefs.setStringList(
        'ff_reportData', _reportData.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _allLeads = [];
  List<dynamic> get allLeads => _allLeads;
  set allLeads(List<dynamic> _value) {
    _allLeads = _value;
    prefs.setStringList(
        'ff_allLeads', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToAllLeads(dynamic _value) {
    _allLeads.add(_value);
    prefs.setStringList(
        'ff_allLeads', _allLeads.map((x) => jsonEncode(x)).toList());
  }

  void removeFromAllLeads(dynamic _value) {
    _allLeads.remove(_value);
    prefs.setStringList(
        'ff_allLeads', _allLeads.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromAllLeads(int _index) {
    _allLeads.removeAt(_index);
    prefs.setStringList(
        'ff_allLeads', _allLeads.map((x) => jsonEncode(x)).toList());
  }

  void updateAllLeadsAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _allLeads[_index] = updateFn(_allLeads[_index]);
    prefs.setStringList(
        'ff_allLeads', _allLeads.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInAllLeads(int _index, dynamic _value) {
    _allLeads.insert(_index, _value);
    prefs.setStringList(
        'ff_allLeads', _allLeads.map((x) => jsonEncode(x)).toList());
  }

  bool _assignedExec = false;
  bool get assignedExec => _assignedExec;
  set assignedExec(bool _value) {
    _assignedExec = _value;
    prefs.setBool('ff_assignedExec', _value);
  }

  dynamic _productData;
  dynamic get productData => _productData;
  set productData(dynamic _value) {
    _productData = _value;
    prefs.setString('ff_productData', jsonEncode(_value));
  }

  String _assignLead = '';
  String get assignLead => _assignLead;
  set assignLead(String _value) {
    _assignLead = _value;
    prefs.setString('ff_assignLead', _value);
  }

  String _leadStatus = '';
  String get leadStatus => _leadStatus;
  set leadStatus(String _value) {
    _leadStatus = _value;
    prefs.setString('ff_leadStatus', _value);
  }

  int _followUpDate = 0;
  int get followUpDate => _followUpDate;
  set followUpDate(int _value) {
    _followUpDate = _value;
    prefs.setInt('ff_followUpDate', _value);
  }

  int _followUpTime = 0;
  int get followUpTime => _followUpTime;
  set followUpTime(int _value) {
    _followUpTime = _value;
    prefs.setInt('ff_followUpTime', _value);
  }

  String _leadCreateValue = '';
  String get leadCreateValue => _leadCreateValue;
  set leadCreateValue(String _value) {
    _leadCreateValue = _value;
    prefs.setString('ff_leadCreateValue', _value);
  }

  Color _nleads = Colors.transparent;
  Color get nleads => _nleads;
  set nleads(Color _value) {
    _nleads = _value;
    prefs.setInt('ff_nleads', _value.value);
  }

  Color _aleads = Colors.transparent;
  Color get aleads => _aleads;
  set aleads(Color _value) {
    _aleads = _value;
    prefs.setInt('ff_aleads', _value.value);
  }

  Color _fLeads = Colors.transparent;
  Color get fLeads => _fLeads;
  set fLeads(Color _value) {
    _fLeads = _value;
    prefs.setInt('ff_fLeads', _value.value);
  }

  Color _cLeads = Colors.transparent;
  Color get cLeads => _cLeads;
  set cLeads(Color _value) {
    _cLeads = _value;
    prefs.setInt('ff_cLeads', _value.value);
  }

  Color _containerFillColor = Colors.transparent;
  Color get containerFillColor => _containerFillColor;
  set containerFillColor(Color _value) {
    _containerFillColor = _value;
    prefs.setInt('ff_containerFillColor', _value.value);
  }

  int _leadtagCode = 0;
  int get leadtagCode => _leadtagCode;
  set leadtagCode(int _value) {
    _leadtagCode = _value;
    prefs.setInt('ff_leadtagCode', _value);
  }

  bool _tagIsDeleted = false;
  bool get tagIsDeleted => _tagIsDeleted;
  set tagIsDeleted(bool _value) {
    _tagIsDeleted = _value;
    prefs.setBool('ff_tagIsDeleted', _value);
  }

  bool _tagSearch = false;
  bool get tagSearch => _tagSearch;
  set tagSearch(bool _value) {
    _tagSearch = _value;
    prefs.setBool('ff_tagSearch', _value);
  }

  List<dynamic> _tagList = [];
  List<dynamic> get tagList => _tagList;
  set tagList(List<dynamic> _value) {
    _tagList = _value;
    prefs.setStringList(
        'ff_tagList', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToTagList(dynamic _value) {
    _tagList.add(_value);
    prefs.setStringList(
        'ff_tagList', _tagList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromTagList(dynamic _value) {
    _tagList.remove(_value);
    prefs.setStringList(
        'ff_tagList', _tagList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromTagList(int _index) {
    _tagList.removeAt(_index);
    prefs.setStringList(
        'ff_tagList', _tagList.map((x) => jsonEncode(x)).toList());
  }

  void updateTagListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _tagList[_index] = updateFn(_tagList[_index]);
    prefs.setStringList(
        'ff_tagList', _tagList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInTagList(int _index, dynamic _value) {
    _tagList.insert(_index, _value);
    prefs.setStringList(
        'ff_tagList', _tagList.map((x) => jsonEncode(x)).toList());
  }

  List<String> _testDrop = ['Hello World 1', 'Hello World 2', 'Hello World 3'];
  List<String> get testDrop => _testDrop;
  set testDrop(List<String> _value) {
    _testDrop = _value;
  }

  void addToTestDrop(String _value) {
    _testDrop.add(_value);
  }

  void removeFromTestDrop(String _value) {
    _testDrop.remove(_value);
  }

  void removeAtIndexFromTestDrop(int _index) {
    _testDrop.removeAt(_index);
  }

  void updateTestDropAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _testDrop[_index] = updateFn(_testDrop[_index]);
  }

  void insertAtIndexInTestDrop(int _index, String _value) {
    _testDrop.insert(_index, _value);
  }

  bool _newLead = false;
  bool get newLead => _newLead;
  set newLead(bool _value) {
    _newLead = _value;
    prefs.setBool('ff_newLead', _value);
  }

  List<dynamic> _tagListDemo = [];
  List<dynamic> get tagListDemo => _tagListDemo;
  set tagListDemo(List<dynamic> _value) {
    _tagListDemo = _value;
    prefs.setStringList(
        'ff_tagListDemo', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToTagListDemo(dynamic _value) {
    _tagListDemo.add(_value);
    prefs.setStringList(
        'ff_tagListDemo', _tagListDemo.map((x) => jsonEncode(x)).toList());
  }

  void removeFromTagListDemo(dynamic _value) {
    _tagListDemo.remove(_value);
    prefs.setStringList(
        'ff_tagListDemo', _tagListDemo.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromTagListDemo(int _index) {
    _tagListDemo.removeAt(_index);
    prefs.setStringList(
        'ff_tagListDemo', _tagListDemo.map((x) => jsonEncode(x)).toList());
  }

  void updateTagListDemoAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _tagListDemo[_index] = updateFn(_tagListDemo[_index]);
    prefs.setStringList(
        'ff_tagListDemo', _tagListDemo.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInTagListDemo(int _index, dynamic _value) {
    _tagListDemo.insert(_index, _value);
    prefs.setStringList(
        'ff_tagListDemo', _tagListDemo.map((x) => jsonEncode(x)).toList());
  }

  DocumentReference? _demoRef;
  DocumentReference? get demoRef => _demoRef;
  set demoRef(DocumentReference? _value) {
    _demoRef = _value;
    _value != null
        ? prefs.setString('ff_demoRef', _value.path)
        : prefs.remove('ff_demoRef');
  }

  String _selectedUserDemo = '';
  String get selectedUserDemo => _selectedUserDemo;
  set selectedUserDemo(String _value) {
    _selectedUserDemo = _value;
    prefs.setString('ff_selectedUserDemo', _value);
  }

  bool _userDemoList = false;
  bool get userDemoList => _userDemoList;
  set userDemoList(bool _value) {
    _userDemoList = _value;
    prefs.setBool('ff_userDemoList', _value);
  }

  Color _dLead = Colors.transparent;
  Color get dLead => _dLead;
  set dLead(Color _value) {
    _dLead = _value;
    prefs.setInt('ff_dLead', _value.value);
  }

  List<dynamic> _dashProductList = [];
  List<dynamic> get dashProductList => _dashProductList;
  set dashProductList(List<dynamic> _value) {
    _dashProductList = _value;
  }

  void addToDashProductList(dynamic _value) {
    _dashProductList.add(_value);
  }

  void removeFromDashProductList(dynamic _value) {
    _dashProductList.remove(_value);
  }

  void removeAtIndexFromDashProductList(int _index) {
    _dashProductList.removeAt(_index);
  }

  void updateDashProductListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _dashProductList[_index] = updateFn(_dashProductList[_index]);
  }

  void insertAtIndexInDashProductList(int _index, dynamic _value) {
    _dashProductList.insert(_index, _value);
  }

  bool _isVisible = false;
  bool get isVisible => _isVisible;
  set isVisible(bool _value) {
    _isVisible = _value;
    prefs.setBool('ff_isVisible', _value);
  }

  String _demoListDate = '';
  String get demoListDate => _demoListDate;
  set demoListDate(String _value) {
    _demoListDate = _value;
    prefs.setString('ff_demoListDate', _value);
  }

  List<dynamic> _newLeadCounts = [];
  List<dynamic> get newLeadCounts => _newLeadCounts;
  set newLeadCounts(List<dynamic> _value) {
    _newLeadCounts = _value;
    prefs.setStringList(
        'ff_newLeadCounts', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToNewLeadCounts(dynamic _value) {
    _newLeadCounts.add(_value);
    prefs.setStringList(
        'ff_newLeadCounts', _newLeadCounts.map((x) => jsonEncode(x)).toList());
  }

  void removeFromNewLeadCounts(dynamic _value) {
    _newLeadCounts.remove(_value);
    prefs.setStringList(
        'ff_newLeadCounts', _newLeadCounts.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromNewLeadCounts(int _index) {
    _newLeadCounts.removeAt(_index);
    prefs.setStringList(
        'ff_newLeadCounts', _newLeadCounts.map((x) => jsonEncode(x)).toList());
  }

  void updateNewLeadCountsAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _newLeadCounts[_index] = updateFn(_newLeadCounts[_index]);
    prefs.setStringList(
        'ff_newLeadCounts', _newLeadCounts.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInNewLeadCounts(int _index, dynamic _value) {
    _newLeadCounts.insert(_index, _value);
    prefs.setStringList(
        'ff_newLeadCounts', _newLeadCounts.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _assignedLeadCount = [];
  List<dynamic> get assignedLeadCount => _assignedLeadCount;
  set assignedLeadCount(List<dynamic> _value) {
    _assignedLeadCount = _value;
    prefs.setStringList(
        'ff_assignedLeadCount', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToAssignedLeadCount(dynamic _value) {
    _assignedLeadCount.add(_value);
    prefs.setStringList('ff_assignedLeadCount',
        _assignedLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void removeFromAssignedLeadCount(dynamic _value) {
    _assignedLeadCount.remove(_value);
    prefs.setStringList('ff_assignedLeadCount',
        _assignedLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromAssignedLeadCount(int _index) {
    _assignedLeadCount.removeAt(_index);
    prefs.setStringList('ff_assignedLeadCount',
        _assignedLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void updateAssignedLeadCountAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _assignedLeadCount[_index] = updateFn(_assignedLeadCount[_index]);
    prefs.setStringList('ff_assignedLeadCount',
        _assignedLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInAssignedLeadCount(int _index, dynamic _value) {
    _assignedLeadCount.insert(_index, _value);
    prefs.setStringList('ff_assignedLeadCount',
        _assignedLeadCount.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _followUpLeadCount = [];
  List<dynamic> get followUpLeadCount => _followUpLeadCount;
  set followUpLeadCount(List<dynamic> _value) {
    _followUpLeadCount = _value;
    prefs.setStringList(
        'ff_followUpLeadCount', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToFollowUpLeadCount(dynamic _value) {
    _followUpLeadCount.add(_value);
    prefs.setStringList('ff_followUpLeadCount',
        _followUpLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void removeFromFollowUpLeadCount(dynamic _value) {
    _followUpLeadCount.remove(_value);
    prefs.setStringList('ff_followUpLeadCount',
        _followUpLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromFollowUpLeadCount(int _index) {
    _followUpLeadCount.removeAt(_index);
    prefs.setStringList('ff_followUpLeadCount',
        _followUpLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void updateFollowUpLeadCountAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _followUpLeadCount[_index] = updateFn(_followUpLeadCount[_index]);
    prefs.setStringList('ff_followUpLeadCount',
        _followUpLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInFollowUpLeadCount(int _index, dynamic _value) {
    _followUpLeadCount.insert(_index, _value);
    prefs.setStringList('ff_followUpLeadCount',
        _followUpLeadCount.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _completedLeadCount = [];
  List<dynamic> get completedLeadCount => _completedLeadCount;
  set completedLeadCount(List<dynamic> _value) {
    _completedLeadCount = _value;
    prefs.setStringList(
        'ff_completedLeadCount', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToCompletedLeadCount(dynamic _value) {
    _completedLeadCount.add(_value);
    prefs.setStringList('ff_completedLeadCount',
        _completedLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void removeFromCompletedLeadCount(dynamic _value) {
    _completedLeadCount.remove(_value);
    prefs.setStringList('ff_completedLeadCount',
        _completedLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromCompletedLeadCount(int _index) {
    _completedLeadCount.removeAt(_index);
    prefs.setStringList('ff_completedLeadCount',
        _completedLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void updateCompletedLeadCountAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _completedLeadCount[_index] = updateFn(_completedLeadCount[_index]);
    prefs.setStringList('ff_completedLeadCount',
        _completedLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInCompletedLeadCount(int _index, dynamic _value) {
    _completedLeadCount.insert(_index, _value);
    prefs.setStringList('ff_completedLeadCount',
        _completedLeadCount.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _lostLeadCount = [];
  List<dynamic> get lostLeadCount => _lostLeadCount;
  set lostLeadCount(List<dynamic> _value) {
    _lostLeadCount = _value;
    prefs.setStringList(
        'ff_lostLeadCount', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToLostLeadCount(dynamic _value) {
    _lostLeadCount.add(_value);
    prefs.setStringList(
        'ff_lostLeadCount', _lostLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void removeFromLostLeadCount(dynamic _value) {
    _lostLeadCount.remove(_value);
    prefs.setStringList(
        'ff_lostLeadCount', _lostLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromLostLeadCount(int _index) {
    _lostLeadCount.removeAt(_index);
    prefs.setStringList(
        'ff_lostLeadCount', _lostLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void updateLostLeadCountAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _lostLeadCount[_index] = updateFn(_lostLeadCount[_index]);
    prefs.setStringList(
        'ff_lostLeadCount', _lostLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInLostLeadCount(int _index, dynamic _value) {
    _lostLeadCount.insert(_index, _value);
    prefs.setStringList(
        'ff_lostLeadCount', _lostLeadCount.map((x) => jsonEncode(x)).toList());
  }

  bool _lostLeadIcon = false;
  bool get lostLeadIcon => _lostLeadIcon;
  set lostLeadIcon(bool _value) {
    _lostLeadIcon = _value;
    prefs.setBool('ff_lostLeadIcon', _value);
  }

  String _lostLeadReason = '';
  String get lostLeadReason => _lostLeadReason;
  set lostLeadReason(String _value) {
    _lostLeadReason = _value;
    prefs.setString('ff_lostLeadReason', _value);
  }

  int _startDate = 0;
  int get startDate => _startDate;
  set startDate(int _value) {
    _startDate = _value;
    prefs.setInt('ff_startDate', _value);
  }

  int _endDate = 0;
  int get endDate => _endDate;
  set endDate(int _value) {
    _endDate = _value;
    prefs.setInt('ff_endDate', _value);
  }

  String _filePath = '';
  String get filePath => _filePath;
  set filePath(String _value) {
    _filePath = _value;
  }

  String _tagName = '';
  String get tagName => _tagName;
  set tagName(String _value) {
    _tagName = _value;
    prefs.setString('ff_tagName', _value);
  }

  List<dynamic> _leadTagList = [];
  List<dynamic> get leadTagList => _leadTagList;
  set leadTagList(List<dynamic> _value) {
    _leadTagList = _value;
    prefs.setStringList(
        'ff_leadTagList', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToLeadTagList(dynamic _value) {
    _leadTagList.add(_value);
    prefs.setStringList(
        'ff_leadTagList', _leadTagList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromLeadTagList(dynamic _value) {
    _leadTagList.remove(_value);
    prefs.setStringList(
        'ff_leadTagList', _leadTagList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromLeadTagList(int _index) {
    _leadTagList.removeAt(_index);
    prefs.setStringList(
        'ff_leadTagList', _leadTagList.map((x) => jsonEncode(x)).toList());
  }

  void updateLeadTagListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _leadTagList[_index] = updateFn(_leadTagList[_index]);
    prefs.setStringList(
        'ff_leadTagList', _leadTagList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInLeadTagList(int _index, dynamic _value) {
    _leadTagList.insert(_index, _value);
    prefs.setStringList(
        'ff_leadTagList', _leadTagList.map((x) => jsonEncode(x)).toList());
  }

  int _defaultCheckOut = 0;
  int get defaultCheckOut => _defaultCheckOut;
  set defaultCheckOut(int _value) {
    _defaultCheckOut = _value;
  }

  LatLng? _defaultCheckOutLoc = LatLng(0, 0);
  LatLng? get defaultCheckOutLoc => _defaultCheckOutLoc;
  set defaultCheckOutLoc(LatLng? _value) {
    _defaultCheckOutLoc = _value;
  }

  String _dropDownStatus = '';
  String get dropDownStatus => _dropDownStatus;
  set dropDownStatus(String _value) {
    _dropDownStatus = _value;
    prefs.setString('ff_dropDownStatus', _value);
  }

  bool _showStatus = false;
  bool get showStatus => _showStatus;
  set showStatus(bool _value) {
    _showStatus = _value;
    prefs.setBool('ff_showStatus', _value);
  }

  Color _cDemoDone = Colors.transparent;
  Color get cDemoDone => _cDemoDone;
  set cDemoDone(Color _value) {
    _cDemoDone = _value;
    prefs.setInt('ff_cDemoDone', _value.value);
  }

  Color _cDemoResch = Colors.transparent;
  Color get cDemoResch => _cDemoResch;
  set cDemoResch(Color _value) {
    _cDemoResch = _value;
    prefs.setInt('ff_cDemoResch', _value.value);
  }

  Color _cHold = Colors.transparent;
  Color get cHold => _cHold;
  set cHold(Color _value) {
    _cHold = _value;
    prefs.setInt('ff_cHold', _value.value);
  }

  Color _cFollowUp = Colors.transparent;
  Color get cFollowUp => _cFollowUp;
  set cFollowUp(Color _value) {
    _cFollowUp = _value;
    prefs.setInt('ff_cFollowUp', _value.value);
  }

  Color _cInstallation = Colors.transparent;
  Color get cInstallation => _cInstallation;
  set cInstallation(Color _value) {
    _cInstallation = _value;
    prefs.setInt('ff_cInstallation', _value.value);
  }

  Color _cLost = Colors.transparent;
  Color get cLost => _cLost;
  set cLost(Color _value) {
    _cLost = _value;
    prefs.setInt('ff_cLost', _value.value);
  }

  Color _cAll = Colors.transparent;
  Color get cAll => _cAll;
  set cAll(Color _value) {
    _cAll = _value;
    prefs.setInt('ff_cAll', _value.value);
  }

  String _selectedDateFollowUpList = '';
  String get selectedDateFollowUpList => _selectedDateFollowUpList;
  set selectedDateFollowUpList(String _value) {
    _selectedDateFollowUpList = _value;
    prefs.setString('ff_selectedDateFollowUpList', _value);
  }

  String _selectedTag = '';
  String get selectedTag => _selectedTag;
  set selectedTag(String _value) {
    _selectedTag = _value;
    prefs.setString('ff_selectedTag', _value);
  }

  bool _allLostLead = false;
  bool get allLostLead => _allLostLead;
  set allLostLead(bool _value) {
    _allLostLead = _value;
    prefs.setBool('ff_allLostLead', _value);
  }

  String _tagColor = '';
  String get tagColor => _tagColor;
  set tagColor(String _value) {
    _tagColor = _value;
    prefs.setString('ff_tagColor', _value);
  }

  Color _allTagBtn = Color(4292855973);
  Color get allTagBtn => _allTagBtn;
  set allTagBtn(Color _value) {
    _allTagBtn = _value;
    prefs.setInt('ff_allTagBtn', _value.value);
  }

  DocumentReference? _comboServicepointoutlet;
  DocumentReference? get comboServicepointoutlet => _comboServicepointoutlet;
  set comboServicepointoutlet(DocumentReference? _value) {
    _comboServicepointoutlet = _value;
    _value != null
        ? prefs.setString('ff_comboServicepointoutlet', _value.path)
        : prefs.remove('ff_comboServicepointoutlet');
  }

  int _selectedDate = 0;
  int get selectedDate => _selectedDate;
  set selectedDate(int _value) {
    _selectedDate = _value;
    prefs.setInt('ff_selectedDate', _value);
  }

  String _dateForReport = '';
  String get dateForReport => _dateForReport;
  set dateForReport(String _value) {
    _dateForReport = _value;
    prefs.setString('ff_dateForReport', _value);
  }

  bool _outletLead = false;
  bool get outletLead => _outletLead;
  set outletLead(bool _value) {
    _outletLead = _value;
    prefs.setBool('ff_outletLead', _value);
  }

  String _stage = '';
  String get stage => _stage;
  set stage(String _value) {
    _stage = _value;
    prefs.setString('ff_stage', _value);
  }

  String _selectedAssignTo = '';
  String get selectedAssignTo => _selectedAssignTo;
  set selectedAssignTo(String _value) {
    _selectedAssignTo = _value;
  }

  String _superAdmin = 'sensible.admin@sensibleconnect.com';
  String get superAdmin => _superAdmin;
  set superAdmin(String _value) {
    _superAdmin = _value;
    prefs.setString('ff_superAdmin', _value);
  }

  String _superAdminPassword = 'Sensible@2023';
  String get superAdminPassword => _superAdminPassword;
  set superAdminPassword(String _value) {
    _superAdminPassword = _value;
    prefs.setString('ff_superAdminPassword', _value);
  }

  String _qrToken = '';
  String get qrToken => _qrToken;
  set qrToken(String _value) {
    _qrToken = _value;
  }

  bool _duplicateMobileBoolean = false;
  bool get duplicateMobileBoolean => _duplicateMobileBoolean;
  set duplicateMobileBoolean(bool _value) {
    _duplicateMobileBoolean = _value;
  }

  dynamic _addAssignTest;
  dynamic get addAssignTest => _addAssignTest;
  set addAssignTest(dynamic _value) {
    _addAssignTest = _value;
  }

  String _userMobileNumberAddDealer = '';
  String get userMobileNumberAddDealer => _userMobileNumberAddDealer;
  set userMobileNumberAddDealer(String _value) {
    _userMobileNumberAddDealer = _value;
  }

  bool _changeAssignedFlag = false;
  bool get changeAssignedFlag => _changeAssignedFlag;
  set changeAssignedFlag(bool _value) {
    _changeAssignedFlag = _value;
  }

  String _selectedDealer = '';
  String get selectedDealer => _selectedDealer;
  set selectedDealer(String _value) {
    _selectedDealer = _value;
    prefs.setString('ff_selectedDealer', _value);
  }

  bool _BackButtonRole = false;
  bool get BackButtonRole => _BackButtonRole;
  set BackButtonRole(bool _value) {
    _BackButtonRole = _value;
  }

  int _selectedDemoDate = 0;
  int get selectedDemoDate => _selectedDemoDate;
  set selectedDemoDate(int _value) {
    _selectedDemoDate = _value;
  }

  List<String> _steps = [];
  List<String> get steps => _steps;
  set steps(List<String> _value) {
    _steps = _value;
  }

  void addToSteps(String _value) {
    _steps.add(_value);
  }

  void removeFromSteps(String _value) {
    _steps.remove(_value);
  }

  void removeAtIndexFromSteps(int _index) {
    _steps.removeAt(_index);
  }

  void updateStepsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _steps[_index] = updateFn(_steps[_index]);
  }

  void insertAtIndexInSteps(int _index, String _value) {
    _steps.insert(_index, _value);
  }

  String _selectedHeader = '';
  String get selectedHeader => _selectedHeader;
  set selectedHeader(String _value) {
    _selectedHeader = _value;
  }

  String _selectedSubHeader = '';
  String get selectedSubHeader => _selectedSubHeader;
  set selectedSubHeader(String _value) {
    _selectedSubHeader = _value;
  }

  DocumentReference? _subHeaderRef;
  DocumentReference? get subHeaderRef => _subHeaderRef;
  set subHeaderRef(DocumentReference? _value) {
    _subHeaderRef = _value;
  }

  List<String> _imgUrl = [];
  List<String> get imgUrl => _imgUrl;
  set imgUrl(List<String> _value) {
    _imgUrl = _value;
  }

  void addToImgUrl(String _value) {
    _imgUrl.add(_value);
  }

  void removeFromImgUrl(String _value) {
    _imgUrl.remove(_value);
  }

  void removeAtIndexFromImgUrl(int _index) {
    _imgUrl.removeAt(_index);
  }

  void updateImgUrlAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _imgUrl[_index] = updateFn(_imgUrl[_index]);
  }

  void insertAtIndexInImgUrl(int _index, String _value) {
    _imgUrl.insert(_index, _value);
  }

  List<String> _imgList = [];
  List<String> get imgList => _imgList;
  set imgList(List<String> _value) {
    _imgList = _value;
  }

  void addToImgList(String _value) {
    _imgList.add(_value);
  }

  void removeFromImgList(String _value) {
    _imgList.remove(_value);
  }

  void removeAtIndexFromImgList(int _index) {
    _imgList.removeAt(_index);
  }

  void updateImgListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _imgList[_index] = updateFn(_imgList[_index]);
  }

  void insertAtIndexInImgList(int _index, String _value) {
    _imgList.insert(_index, _value);
  }

  String _headLine = '';
  String get headLine => _headLine;
  set headLine(String _value) {
    _headLine = _value;
  }

  String _vidurl = '';
  String get vidurl => _vidurl;
  set vidurl(String _value) {
    _vidurl = _value;
  }

  String _headerId = '';
  String get headerId => _headerId;
  set headerId(String _value) {
    _headerId = _value;
  }

  String _subHeaderId = '';
  String get subHeaderId => _subHeaderId;
  set subHeaderId(String _value) {
    _subHeaderId = _value;
  }

  DocumentReference? _selectedSubHeaderRef;
  DocumentReference? get selectedSubHeaderRef => _selectedSubHeaderRef;
  set selectedSubHeaderRef(DocumentReference? _value) {
    _selectedSubHeaderRef = _value;
  }

  String _userId = '';
  String get userId => _userId;
  set userId(String _value) {
    _userId = _value;
  }

  String _role = '';
  String get role => _role;
  set role(String _value) {
    _role = _value;
  }

  bool _isPresentInSearch = false;
  bool get isPresentInSearch => _isPresentInSearch;
  set isPresentInSearch(bool _value) {
    _isPresentInSearch = _value;
  }

  int _upiTotal = 0;
  int get upiTotal => _upiTotal;
  set upiTotal(int _value) {
    _upiTotal = _value;
  }

  bool _usermanBackFlag = false;
  bool get usermanBackFlag => _usermanBackFlag;
  set usermanBackFlag(bool _value) {
    _usermanBackFlag = _value;
  }

  dynamic _leadChartData = jsonDecode('null');
  dynamic get leadChartData => _leadChartData;
  set leadChartData(dynamic _value) {
    _leadChartData = _value;
  }

  DocumentReference? _userProfileRef;
  DocumentReference? get userProfileRef => _userProfileRef;
  set userProfileRef(DocumentReference? _value) {
    _userProfileRef = _value;
  }

  List<dynamic> _leadPermission = [
    jsonDecode('{\"title\":\"Leads\",\"value\":1}'),
    jsonDecode('{\"title\":\"Leads\",\"value\":2}'),
    jsonDecode('{\"title\":\"Leads\",\"value\":3}'),
    jsonDecode('{\"title\":\"Leads\",\"value\":4}')
  ];
  List<dynamic> get leadPermission => _leadPermission;
  set leadPermission(List<dynamic> _value) {
    _leadPermission = _value;
  }

  void addToLeadPermission(dynamic _value) {
    _leadPermission.add(_value);
  }

  void removeFromLeadPermission(dynamic _value) {
    _leadPermission.remove(_value);
  }

  void removeAtIndexFromLeadPermission(int _index) {
    _leadPermission.removeAt(_index);
  }

  void updateLeadPermissionAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _leadPermission[_index] = updateFn(_leadPermission[_index]);
  }

  void insertAtIndexInLeadPermission(int _index, dynamic _value) {
    _leadPermission.insert(_index, _value);
  }

  bool _searchHide = false;
  bool get searchHide => _searchHide;
  set searchHide(bool _value) {
    _searchHide = _value;
    prefs.setBool('ff_searchHide', _value);
  }

  String _image = '';
  String get image => _image;
  set image(String _value) {
    _image = _value;
  }

  bool _mode = false;
  bool get mode => _mode;
  set mode(bool _value) {
    _mode = _value;
  }

  DateTime? _startDate1;
  DateTime? get startDate1 => _startDate1;
  set startDate1(DateTime? _value) {
    _startDate1 = _value;
  }

  DateTime? _endDate1;
  DateTime? get endDate1 => _endDate1;
  set endDate1(DateTime? _value) {
    _endDate1 = _value;
  }

  DateTime? _endDateShow;
  DateTime? get endDateShow => _endDateShow;
  set endDateShow(DateTime? _value) {
    _endDateShow = _value;
  }

  Color _lleads = Colors.transparent;
  Color get lleads => _lleads;
  set lleads(Color _value) {
    _lleads = _value;
    prefs.setInt('ff_lleads', _value.value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
