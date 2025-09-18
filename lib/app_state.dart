import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
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
    _safeInit(() {
      _rawCartList = prefs.getStringList('ff_rawCartList')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _rawCartList;
    });
    _safeInit(() {
      _rawCartList2 = prefs.getStringList('ff_rawCartList2')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _rawCartList2;
    });
    _safeInit(() {
      _subTotal = prefs.getDouble('ff_subTotal') ?? _subTotal;
    });
    _safeInit(() {
      _tempPartyList = prefs.getStringList('ff_tempPartyList')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _tempPartyList;
    });
    _safeInit(() {
      _isDealer = prefs.getBool('ff_isDealer') ?? _isDealer;
    });
    _safeInit(() {
      _rawCode = prefs.getInt('ff_rawCode') ?? _rawCode;
    });
    _safeInit(() {
      _selectedStatus = prefs.getInt('ff_selectedStatus') ?? _selectedStatus;
    });
    _safeInit(() {
      _zone = prefs.getString('ff_zone') ?? _zone;
    });
    _safeInit(() {
      _currentUserRole =
          prefs.getString('ff_currentUserRole') ?? _currentUserRole;
    });
    _safeInit(() {
      _loggedInUserPermisions = prefs
              .getStringList('ff_loggedInUserPermisions')
              ?.map((x) {
                try {
                  return UserAccesCStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _loggedInUserPermisions;
    });
    _safeInit(() {
      _currentUserZoneList =
          prefs.getStringList('ff_currentUserZoneList') ?? _currentUserZoneList;
    });
    _safeInit(() {
      _readOnlyAccess = prefs.getBool('ff_readOnlyAccess') ?? _readOnlyAccess;
    });
    _safeInit(() {
      _stageListPermissionState = prefs
              .getStringList('ff_stageListPermissionState')
              ?.map((x) {
                try {
                  return StageAccessDataTypeStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _stageListPermissionState;
    });
    _safeInit(() {
      _cities = prefs
              .getStringList('ff_cities')
              ?.map((x) {
                try {
                  return CityListStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _cities;
    });
    _safeInit(() {
      _states = prefs
              .getStringList('ff_states')
              ?.map((x) {
                try {
                  return StatesStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _states;
    });
    _safeInit(() {
      _productsList = prefs
              .getStringList('ff_productsList')
              ?.map((x) {
                try {
                  return ProductDataTypeStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _productsList;
    });
    _safeInit(() {
      _categoryList = prefs
              .getStringList('ff_categoryList')
              ?.map((x) {
                try {
                  return CategoryDataTypeStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _categoryList;
    });
    _safeInit(() {
      _TeamTreeUsers = prefs
              .getStringList('ff_TeamTreeUsers')
              ?.map((x) {
                try {
                  return TeamTreeDatatypeStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _TeamTreeUsers;
    });
    _safeInit(() {
      _curUserName = prefs.getString('ff_curUserName') ?? _curUserName;
    });
    _safeInit(() {
      _isLoggedIn = prefs.getBool('ff_isLoggedIn') ?? _isLoggedIn;
    });
    _safeInit(() {
      _roleInZone = prefs.getString('ff_roleInZone') ?? _roleInZone;
    });
    _safeInit(() {
      _currentLoggedInUserId =
          prefs.getString('ff_currentLoggedInUserId') ?? _currentLoggedInUserId;
    });
    _safeInit(() {
      _demoOutlet = prefs.getString('ff_demoOutlet')?.ref ?? _demoOutlet;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _regionalNames = [];
  List<String> get regionalNames => _regionalNames;
  set regionalNames(List<String> value) {
    _regionalNames = value;
  }

  void addToRegionalNames(String value) {
    regionalNames.add(value);
  }

  void removeFromRegionalNames(String value) {
    regionalNames.remove(value);
  }

  void removeAtIndexFromRegionalNames(int index) {
    regionalNames.removeAt(index);
  }

  void updateRegionalNamesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    regionalNames[index] = updateFn(_regionalNames[index]);
  }

  void insertAtIndexInRegionalNames(int index, String value) {
    regionalNames.insert(index, value);
  }

  bool _catRefField = false;
  bool get catRefField => _catRefField;
  set catRefField(bool value) {
    _catRefField = value;
  }

  String _regName = '';
  String get regName => _regName;
  set regName(String value) {
    _regName = value;
  }

  List<dynamic> _names = [];
  List<dynamic> get names => _names;
  set names(List<dynamic> value) {
    _names = value;
  }

  void addToNames(dynamic value) {
    names.add(value);
  }

  void removeFromNames(dynamic value) {
    names.remove(value);
  }

  void removeAtIndexFromNames(int index) {
    names.removeAt(index);
  }

  void updateNamesAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    names[index] = updateFn(_names[index]);
  }

  void insertAtIndexInNames(int index, dynamic value) {
    names.insert(index, value);
  }

  dynamic _regionalValue;
  dynamic get regionalValue => _regionalValue;
  set regionalValue(dynamic value) {
    _regionalValue = value;
  }

  bool _showNameList = false;
  bool get showNameList => _showNameList;
  set showNameList(bool value) {
    _showNameList = value;
  }

  double _subscriptionAmount = 0.0;
  double get subscriptionAmount => _subscriptionAmount;
  set subscriptionAmount(double value) {
    _subscriptionAmount = value;
  }

  bool _activeInactiveFlag = false;
  bool get activeInactiveFlag => _activeInactiveFlag;
  set activeInactiveFlag(bool value) {
    _activeInactiveFlag = value;
  }

  DocumentReference? _logedInUserRef;
  DocumentReference? get logedInUserRef => _logedInUserRef;
  set logedInUserRef(DocumentReference? value) {
    _logedInUserRef = value;
    value != null
        ? prefs.setString('ff_logedInUserRef', value.path)
        : prefs.remove('ff_logedInUserRef');
  }

  DocumentReference? _CompanyDetailsRef =
      FirebaseFirestore.instance.doc('/COMPANY_DETAILS/aM3jgmben7TH7V9QKNqa');
  DocumentReference? get CompanyDetailsRef => _CompanyDetailsRef;
  set CompanyDetailsRef(DocumentReference? value) {
    _CompanyDetailsRef = value;
    value != null
        ? prefs.setString('ff_CompanyDetailsRef', value.path)
        : prefs.remove('ff_CompanyDetailsRef');
  }

  DocumentReference? _bMDocRef;
  DocumentReference? get bMDocRef => _bMDocRef;
  set bMDocRef(DocumentReference? value) {
    _bMDocRef = value;
    value != null
        ? prefs.setString('ff_bMDocRef', value.path)
        : prefs.remove('ff_bMDocRef');
  }

  DocumentReference? _outletRef;
  DocumentReference? get outletRef => _outletRef;
  set outletRef(DocumentReference? value) {
    _outletRef = value;
    value != null
        ? prefs.setString('ff_outletRef', value.path)
        : prefs.remove('ff_outletRef');
  }

  String _catCodeLength = '';
  String get catCodeLength => _catCodeLength;
  set catCodeLength(String value) {
    _catCodeLength = value;
    prefs.setString('ff_catCodeLength', value);
  }

  String _setCategoryMasterName = '';
  String get setCategoryMasterName => _setCategoryMasterName;
  set setCategoryMasterName(String value) {
    _setCategoryMasterName = value;
    prefs.setString('ff_setCategoryMasterName', value);
  }

  DocumentReference? _selectCategoryMasterRef;
  DocumentReference? get selectCategoryMasterRef => _selectCategoryMasterRef;
  set selectCategoryMasterRef(DocumentReference? value) {
    _selectCategoryMasterRef = value;
    value != null
        ? prefs.setString('ff_selectCategoryMasterRef', value.path)
        : prefs.remove('ff_selectCategoryMasterRef');
  }

  int _catCodeLengtH = 0;
  int get catCodeLengtH => _catCodeLengtH;
  set catCodeLengtH(int value) {
    _catCodeLengtH = value;
    prefs.setInt('ff_catCodeLengtH', value);
  }

  bool _isFullListShown = true;
  bool get isFullListShown => _isFullListShown;
  set isFullListShown(bool value) {
    _isFullListShown = value;
  }

  int _premisesCodeLength = 0;
  int get premisesCodeLength => _premisesCodeLength;
  set premisesCodeLength(int value) {
    _premisesCodeLength = value;
    prefs.setInt('ff_premisesCodeLength', value);
  }

  String _setPremisesName = '';
  String get setPremisesName => _setPremisesName;
  set setPremisesName(String value) {
    _setPremisesName = value;
    prefs.setString('ff_setPremisesName', value);
  }

  DocumentReference? _selectPremiseRef;
  DocumentReference? get selectPremiseRef => _selectPremiseRef;
  set selectPremiseRef(DocumentReference? value) {
    _selectPremiseRef = value;
    value != null
        ? prefs.setString('ff_selectPremiseRef', value.path)
        : prefs.remove('ff_selectPremiseRef');
  }

  int _catCodeLengthPremises = 0;
  int get catCodeLengthPremises => _catCodeLengthPremises;
  set catCodeLengthPremises(int value) {
    _catCodeLengthPremises = value;
    prefs.setInt('ff_catCodeLengthPremises', value);
  }

  int _servicePointOutletCodeLength = 0;
  int get servicePointOutletCodeLength => _servicePointOutletCodeLength;
  set servicePointOutletCodeLength(int value) {
    _servicePointOutletCodeLength = value;
    prefs.setInt('ff_servicePointOutletCodeLength', value);
  }

  int _userAccountCatCodeLength = 0;
  int get userAccountCatCodeLength => _userAccountCatCodeLength;
  set userAccountCatCodeLength(int value) {
    _userAccountCatCodeLength = value;
    prefs.setInt('ff_userAccountCatCodeLength', value);
  }

  String _outletId = '';
  String get outletId => _outletId;
  set outletId(String value) {
    _outletId = value;
    prefs.setString('ff_outletId', value);
  }

  String _shift = '';
  String get shift => _shift;
  set shift(String value) {
    _shift = value;
    prefs.setString('ff_shift', value);
  }

  String _deviceId = '';
  String get deviceId => _deviceId;
  set deviceId(String value) {
    _deviceId = value;
    prefs.setString('ff_deviceId', value);
  }

  String _Bill = '';
  String get Bill => _Bill;
  set Bill(String value) {
    _Bill = value;
    prefs.setString('ff_Bill', value);
  }

  bool _delete = false;
  bool get delete => _delete;
  set delete(bool value) {
    _delete = value;
    prefs.setBool('ff_delete', value);
  }

  String _currentMobile = '';
  String get currentMobile => _currentMobile;
  set currentMobile(String value) {
    _currentMobile = value;
    prefs.setString('ff_currentMobile', value);
  }

  DocumentReference? _docRef;
  DocumentReference? get docRef => _docRef;
  set docRef(DocumentReference? value) {
    _docRef = value;
  }

  String _currentEmail = '';
  String get currentEmail => _currentEmail;
  set currentEmail(String value) {
    _currentEmail = value;
    prefs.setString('ff_currentEmail', value);
  }

  List<dynamic> _itemCartList = [];
  List<dynamic> get itemCartList => _itemCartList;
  set itemCartList(List<dynamic> value) {
    _itemCartList = value;
    prefs.setStringList(
        'ff_itemCartList', value.map((x) => jsonEncode(x)).toList());
  }

  void addToItemCartList(dynamic value) {
    itemCartList.add(value);
    prefs.setStringList(
        'ff_itemCartList', _itemCartList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromItemCartList(dynamic value) {
    itemCartList.remove(value);
    prefs.setStringList(
        'ff_itemCartList', _itemCartList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromItemCartList(int index) {
    itemCartList.removeAt(index);
    prefs.setStringList(
        'ff_itemCartList', _itemCartList.map((x) => jsonEncode(x)).toList());
  }

  void updateItemCartListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    itemCartList[index] = updateFn(_itemCartList[index]);
    prefs.setStringList(
        'ff_itemCartList', _itemCartList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInItemCartList(int index, dynamic value) {
    itemCartList.insert(index, value);
    prefs.setStringList(
        'ff_itemCartList', _itemCartList.map((x) => jsonEncode(x)).toList());
  }

  double _comboSellingPrice = 0.0;
  double get comboSellingPrice => _comboSellingPrice;
  set comboSellingPrice(double value) {
    _comboSellingPrice = value;
    prefs.setDouble('ff_comboSellingPrice', value);
  }

  double _comboMRPPrice = 0.0;
  double get comboMRPPrice => _comboMRPPrice;
  set comboMRPPrice(double value) {
    _comboMRPPrice = value;
    prefs.setDouble('ff_comboMRPPrice', value);
  }

  double _comboPurchasePrice = 0.0;
  double get comboPurchasePrice => _comboPurchasePrice;
  set comboPurchasePrice(double value) {
    _comboPurchasePrice = value;
    prefs.setDouble('ff_comboPurchasePrice', value);
  }

  DocumentReference? _comboCategoryRef =
      FirebaseFirestore.instance.doc('/CATEGORY/xRc31dWaYKkucwug5dCm');
  DocumentReference? get comboCategoryRef => _comboCategoryRef;
  set comboCategoryRef(DocumentReference? value) {
    _comboCategoryRef = value;
    value != null
        ? prefs.setString('ff_comboCategoryRef', value.path)
        : prefs.remove('ff_comboCategoryRef');
  }

  DocumentReference? _comboTaxRef =
      FirebaseFirestore.instance.doc('/TAX_MASTER/FTLkVGa55IBCbvwKmioA');
  DocumentReference? get comboTaxRef => _comboTaxRef;
  set comboTaxRef(DocumentReference? value) {
    _comboTaxRef = value;
    value != null
        ? prefs.setString('ff_comboTaxRef', value.path)
        : prefs.remove('ff_comboTaxRef');
  }

  DocumentReference? _comboUnitRef =
      FirebaseFirestore.instance.doc('/UNIT_TYPE/kVHgDo7iBFC7ecCeRmr0');
  DocumentReference? get comboUnitRef => _comboUnitRef;
  set comboUnitRef(DocumentReference? value) {
    _comboUnitRef = value;
    value != null
        ? prefs.setString('ff_comboUnitRef', value.path)
        : prefs.remove('ff_comboUnitRef');
  }

  DocumentReference? _comboSubCategoryRef =
      FirebaseFirestore.instance.doc('/SUB_CATEGORY/jelwkw5tJA7I8AhjrCX4');
  DocumentReference? get comboSubCategoryRef => _comboSubCategoryRef;
  set comboSubCategoryRef(DocumentReference? value) {
    _comboSubCategoryRef = value;
    value != null
        ? prefs.setString('ff_comboSubCategoryRef', value.path)
        : prefs.remove('ff_comboSubCategoryRef');
  }

  DocumentReference? _comboProductMasterRef =
      FirebaseFirestore.instance.doc('/PRODUCT_MASTER/7PVD9JFkMooK03qunQPY');
  DocumentReference? get comboProductMasterRef => _comboProductMasterRef;
  set comboProductMasterRef(DocumentReference? value) {
    _comboProductMasterRef = value;
    value != null
        ? prefs.setString('ff_comboProductMasterRef', value.path)
        : prefs.remove('ff_comboProductMasterRef');
  }

  String _setProductName = '';
  String get setProductName => _setProductName;
  set setProductName(String value) {
    _setProductName = value;
    prefs.setString('ff_setProductName', value);
  }

  String _BMDocId = '';
  String get BMDocId => _BMDocId;
  set BMDocId(String value) {
    _BMDocId = value;
    prefs.setString('ff_BMDocId', value);
  }

  String _setBMcolor = '';
  String get setBMcolor => _setBMcolor;
  set setBMcolor(String value) {
    _setBMcolor = value;
    prefs.setString('ff_setBMcolor', value);
  }

  List<dynamic> _loggedInUser = [];
  List<dynamic> get loggedInUser => _loggedInUser;
  set loggedInUser(List<dynamic> value) {
    _loggedInUser = value;
    prefs.setStringList(
        'ff_loggedInUser', value.map((x) => jsonEncode(x)).toList());
  }

  void addToLoggedInUser(dynamic value) {
    loggedInUser.add(value);
    prefs.setStringList(
        'ff_loggedInUser', _loggedInUser.map((x) => jsonEncode(x)).toList());
  }

  void removeFromLoggedInUser(dynamic value) {
    loggedInUser.remove(value);
    prefs.setStringList(
        'ff_loggedInUser', _loggedInUser.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromLoggedInUser(int index) {
    loggedInUser.removeAt(index);
    prefs.setStringList(
        'ff_loggedInUser', _loggedInUser.map((x) => jsonEncode(x)).toList());
  }

  void updateLoggedInUserAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    loggedInUser[index] = updateFn(_loggedInUser[index]);
    prefs.setStringList(
        'ff_loggedInUser', _loggedInUser.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInLoggedInUser(int index, dynamic value) {
    loggedInUser.insert(index, value);
    prefs.setStringList(
        'ff_loggedInUser', _loggedInUser.map((x) => jsonEncode(x)).toList());
  }

  List<int> _codeUpdate = [];
  List<int> get codeUpdate => _codeUpdate;
  set codeUpdate(List<int> value) {
    _codeUpdate = value;
    prefs.setStringList(
        'ff_codeUpdate', value.map((x) => x.toString()).toList());
  }

  void addToCodeUpdate(int value) {
    codeUpdate.add(value);
    prefs.setStringList(
        'ff_codeUpdate', _codeUpdate.map((x) => x.toString()).toList());
  }

  void removeFromCodeUpdate(int value) {
    codeUpdate.remove(value);
    prefs.setStringList(
        'ff_codeUpdate', _codeUpdate.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromCodeUpdate(int index) {
    codeUpdate.removeAt(index);
    prefs.setStringList(
        'ff_codeUpdate', _codeUpdate.map((x) => x.toString()).toList());
  }

  void updateCodeUpdateAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    codeUpdate[index] = updateFn(_codeUpdate[index]);
    prefs.setStringList(
        'ff_codeUpdate', _codeUpdate.map((x) => x.toString()).toList());
  }

  void insertAtIndexInCodeUpdate(int index, int value) {
    codeUpdate.insert(index, value);
    prefs.setStringList(
        'ff_codeUpdate', _codeUpdate.map((x) => x.toString()).toList());
  }

  String _barcode = '';
  String get barcode => _barcode;
  set barcode(String value) {
    _barcode = value;
  }

  double _progr = 60.0;
  double get progr => _progr;
  set progr(double value) {
    _progr = value;
  }

  bool _dropdown = false;
  bool get dropdown => _dropdown;
  set dropdown(bool value) {
    _dropdown = value;
  }

  bool _dropdown1 = false;
  bool get dropdown1 => _dropdown1;
  set dropdown1(bool value) {
    _dropdown1 = value;
  }

  double _finalAmt = 0.0;
  double get finalAmt => _finalAmt;
  set finalAmt(double value) {
    _finalAmt = value;
  }

  int _roundOff = 0;
  int get roundOff => _roundOff;
  set roundOff(int value) {
    _roundOff = value;
  }

  double _balAmt = 0.0;
  double get balAmt => _balAmt;
  set balAmt(double value) {
    _balAmt = value;
  }

  bool _showList2 = true;
  bool get showList2 => _showList2;
  set showList2(bool value) {
    _showList2 = value;
    prefs.setBool('ff_showList2', value);
  }

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;
  set totalPrice(double value) {
    _totalPrice = value;
  }

  double _discountPer = 0.0;
  double get discountPer => _discountPer;
  set discountPer(double value) {
    _discountPer = value;
  }

  double _gstRate = 0.0;
  double get gstRate => _gstRate;
  set gstRate(double value) {
    _gstRate = value;
  }

  double _disAmt = 0.0;
  double get disAmt => _disAmt;
  set disAmt(double value) {
    _disAmt = value;
  }

  String _rawCatRef = '';
  String get rawCatRef => _rawCatRef;
  set rawCatRef(String value) {
    _rawCatRef = value;
    prefs.setString('ff_rawCatRef', value);
  }

  double _totalQuantity = 0.0;
  double get totalQuantity => _totalQuantity;
  set totalQuantity(double value) {
    _totalQuantity = value;
    prefs.setDouble('ff_totalQuantity', value);
  }

  bool _isFullList = false;
  bool get isFullList => _isFullList;
  set isFullList(bool value) {
    _isFullList = value;
  }

  List<dynamic> _resultList = [];
  List<dynamic> get resultList => _resultList;
  set resultList(List<dynamic> value) {
    _resultList = value;
    prefs.setStringList(
        'ff_resultList', value.map((x) => jsonEncode(x)).toList());
  }

  void addToResultList(dynamic value) {
    resultList.add(value);
    prefs.setStringList(
        'ff_resultList', _resultList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromResultList(dynamic value) {
    resultList.remove(value);
    prefs.setStringList(
        'ff_resultList', _resultList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromResultList(int index) {
    resultList.removeAt(index);
    prefs.setStringList(
        'ff_resultList', _resultList.map((x) => jsonEncode(x)).toList());
  }

  void updateResultListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    resultList[index] = updateFn(_resultList[index]);
    prefs.setStringList(
        'ff_resultList', _resultList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInResultList(int index, dynamic value) {
    resultList.insert(index, value);
    prefs.setStringList(
        'ff_resultList', _resultList.map((x) => jsonEncode(x)).toList());
  }

  String _filtervalue = '';
  String get filtervalue => _filtervalue;
  set filtervalue(String value) {
    _filtervalue = value;
    prefs.setString('ff_filtervalue', value);
  }

  String _filterDate = '';
  String get filterDate => _filterDate;
  set filterDate(String value) {
    _filterDate = value;
    prefs.setString('ff_filterDate', value);
  }

  int _selectStartDate = 0;
  int get selectStartDate => _selectStartDate;
  set selectStartDate(int value) {
    _selectStartDate = value;
    prefs.setInt('ff_selectStartDate', value);
  }

  int _selectEndDate = 0;
  int get selectEndDate => _selectEndDate;
  set selectEndDate(int value) {
    _selectEndDate = value;
    prefs.setInt('ff_selectEndDate', value);
  }

  DocumentReference? _outletIdRef;
  DocumentReference? get outletIdRef => _outletIdRef;
  set outletIdRef(DocumentReference? value) {
    _outletIdRef = value;
    value != null
        ? prefs.setString('ff_outletIdRef', value.path)
        : prefs.remove('ff_outletIdRef');
  }

  List<dynamic> _todaysTotal = [];
  List<dynamic> get todaysTotal => _todaysTotal;
  set todaysTotal(List<dynamic> value) {
    _todaysTotal = value;
    prefs.setStringList(
        'ff_todaysTotal', value.map((x) => jsonEncode(x)).toList());
  }

  void addToTodaysTotal(dynamic value) {
    todaysTotal.add(value);
    prefs.setStringList(
        'ff_todaysTotal', _todaysTotal.map((x) => jsonEncode(x)).toList());
  }

  void removeFromTodaysTotal(dynamic value) {
    todaysTotal.remove(value);
    prefs.setStringList(
        'ff_todaysTotal', _todaysTotal.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromTodaysTotal(int index) {
    todaysTotal.removeAt(index);
    prefs.setStringList(
        'ff_todaysTotal', _todaysTotal.map((x) => jsonEncode(x)).toList());
  }

  void updateTodaysTotalAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    todaysTotal[index] = updateFn(_todaysTotal[index]);
    prefs.setStringList(
        'ff_todaysTotal', _todaysTotal.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInTodaysTotal(int index, dynamic value) {
    todaysTotal.insert(index, value);
    prefs.setStringList(
        'ff_todaysTotal', _todaysTotal.map((x) => jsonEncode(x)).toList());
  }

  dynamic _summaryJSON;
  dynamic get summaryJSON => _summaryJSON;
  set summaryJSON(dynamic value) {
    _summaryJSON = value;
    prefs.setString('ff_summaryJSON', jsonEncode(value));
  }

  String _selectedDayId = '';
  String get selectedDayId => _selectedDayId;
  set selectedDayId(String value) {
    _selectedDayId = value;
    prefs.setString('ff_selectedDayId', value);
  }

  bool _shiftBill = false;
  bool get shiftBill => _shiftBill;
  set shiftBill(bool value) {
    _shiftBill = value;
    prefs.setBool('ff_shiftBill', value);
  }

  bool _hide = false;
  bool get hide => _hide;
  set hide(bool value) {
    _hide = value;
    prefs.setBool('ff_hide', value);
  }

  bool _showList = true;
  bool get showList => _showList;
  set showList(bool value) {
    _showList = value;
    prefs.setBool('ff_showList', value);
  }

  List<dynamic> _reportData = [];
  List<dynamic> get reportData => _reportData;
  set reportData(List<dynamic> value) {
    _reportData = value;
    prefs.setStringList(
        'ff_reportData', value.map((x) => jsonEncode(x)).toList());
  }

  void addToReportData(dynamic value) {
    reportData.add(value);
    prefs.setStringList(
        'ff_reportData', _reportData.map((x) => jsonEncode(x)).toList());
  }

  void removeFromReportData(dynamic value) {
    reportData.remove(value);
    prefs.setStringList(
        'ff_reportData', _reportData.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromReportData(int index) {
    reportData.removeAt(index);
    prefs.setStringList(
        'ff_reportData', _reportData.map((x) => jsonEncode(x)).toList());
  }

  void updateReportDataAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    reportData[index] = updateFn(_reportData[index]);
    prefs.setStringList(
        'ff_reportData', _reportData.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInReportData(int index, dynamic value) {
    reportData.insert(index, value);
    prefs.setStringList(
        'ff_reportData', _reportData.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _allLeads = [];
  List<dynamic> get allLeads => _allLeads;
  set allLeads(List<dynamic> value) {
    _allLeads = value;
    prefs.setStringList(
        'ff_allLeads', value.map((x) => jsonEncode(x)).toList());
  }

  void addToAllLeads(dynamic value) {
    allLeads.add(value);
    prefs.setStringList(
        'ff_allLeads', _allLeads.map((x) => jsonEncode(x)).toList());
  }

  void removeFromAllLeads(dynamic value) {
    allLeads.remove(value);
    prefs.setStringList(
        'ff_allLeads', _allLeads.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromAllLeads(int index) {
    allLeads.removeAt(index);
    prefs.setStringList(
        'ff_allLeads', _allLeads.map((x) => jsonEncode(x)).toList());
  }

  void updateAllLeadsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    allLeads[index] = updateFn(_allLeads[index]);
    prefs.setStringList(
        'ff_allLeads', _allLeads.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInAllLeads(int index, dynamic value) {
    allLeads.insert(index, value);
    prefs.setStringList(
        'ff_allLeads', _allLeads.map((x) => jsonEncode(x)).toList());
  }

  bool _assignedExec = false;
  bool get assignedExec => _assignedExec;
  set assignedExec(bool value) {
    _assignedExec = value;
    prefs.setBool('ff_assignedExec', value);
  }

  dynamic _productData;
  dynamic get productData => _productData;
  set productData(dynamic value) {
    _productData = value;
    prefs.setString('ff_productData', jsonEncode(value));
  }

  String _assignLead = '';
  String get assignLead => _assignLead;
  set assignLead(String value) {
    _assignLead = value;
    prefs.setString('ff_assignLead', value);
  }

  String _leadStatus = '';
  String get leadStatus => _leadStatus;
  set leadStatus(String value) {
    _leadStatus = value;
    prefs.setString('ff_leadStatus', value);
  }

  int _followUpDate = 0;
  int get followUpDate => _followUpDate;
  set followUpDate(int value) {
    _followUpDate = value;
    prefs.setInt('ff_followUpDate', value);
  }

  int _followUpTime = 0;
  int get followUpTime => _followUpTime;
  set followUpTime(int value) {
    _followUpTime = value;
    prefs.setInt('ff_followUpTime', value);
  }

  String _leadCreateValue = '';
  String get leadCreateValue => _leadCreateValue;
  set leadCreateValue(String value) {
    _leadCreateValue = value;
    prefs.setString('ff_leadCreateValue', value);
  }

  Color _nleads = Colors.transparent;
  Color get nleads => _nleads;
  set nleads(Color value) {
    _nleads = value;
    prefs.setInt('ff_nleads', value.value);
  }

  Color _aleads = Colors.transparent;
  Color get aleads => _aleads;
  set aleads(Color value) {
    _aleads = value;
    prefs.setInt('ff_aleads', value.value);
  }

  Color _fLeads = Colors.transparent;
  Color get fLeads => _fLeads;
  set fLeads(Color value) {
    _fLeads = value;
    prefs.setInt('ff_fLeads', value.value);
  }

  Color _cLeads = Colors.transparent;
  Color get cLeads => _cLeads;
  set cLeads(Color value) {
    _cLeads = value;
    prefs.setInt('ff_cLeads', value.value);
  }

  Color _containerFillColor = Colors.transparent;
  Color get containerFillColor => _containerFillColor;
  set containerFillColor(Color value) {
    _containerFillColor = value;
    prefs.setInt('ff_containerFillColor', value.value);
  }

  int _leadtagCode = 0;
  int get leadtagCode => _leadtagCode;
  set leadtagCode(int value) {
    _leadtagCode = value;
    prefs.setInt('ff_leadtagCode', value);
  }

  bool _tagIsDeleted = false;
  bool get tagIsDeleted => _tagIsDeleted;
  set tagIsDeleted(bool value) {
    _tagIsDeleted = value;
    prefs.setBool('ff_tagIsDeleted', value);
  }

  bool _tagSearch = false;
  bool get tagSearch => _tagSearch;
  set tagSearch(bool value) {
    _tagSearch = value;
    prefs.setBool('ff_tagSearch', value);
  }

  List<dynamic> _tagList = [];
  List<dynamic> get tagList => _tagList;
  set tagList(List<dynamic> value) {
    _tagList = value;
    prefs.setStringList('ff_tagList', value.map((x) => jsonEncode(x)).toList());
  }

  void addToTagList(dynamic value) {
    tagList.add(value);
    prefs.setStringList(
        'ff_tagList', _tagList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromTagList(dynamic value) {
    tagList.remove(value);
    prefs.setStringList(
        'ff_tagList', _tagList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromTagList(int index) {
    tagList.removeAt(index);
    prefs.setStringList(
        'ff_tagList', _tagList.map((x) => jsonEncode(x)).toList());
  }

  void updateTagListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    tagList[index] = updateFn(_tagList[index]);
    prefs.setStringList(
        'ff_tagList', _tagList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInTagList(int index, dynamic value) {
    tagList.insert(index, value);
    prefs.setStringList(
        'ff_tagList', _tagList.map((x) => jsonEncode(x)).toList());
  }

  List<String> _testDrop = ['Hello World 1', 'Hello World 2', 'Hello World 3'];
  List<String> get testDrop => _testDrop;
  set testDrop(List<String> value) {
    _testDrop = value;
  }

  void addToTestDrop(String value) {
    testDrop.add(value);
  }

  void removeFromTestDrop(String value) {
    testDrop.remove(value);
  }

  void removeAtIndexFromTestDrop(int index) {
    testDrop.removeAt(index);
  }

  void updateTestDropAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    testDrop[index] = updateFn(_testDrop[index]);
  }

  void insertAtIndexInTestDrop(int index, String value) {
    testDrop.insert(index, value);
  }

  bool _newLead = false;
  bool get newLead => _newLead;
  set newLead(bool value) {
    _newLead = value;
    prefs.setBool('ff_newLead', value);
  }

  List<dynamic> _tagListDemo = [];
  List<dynamic> get tagListDemo => _tagListDemo;
  set tagListDemo(List<dynamic> value) {
    _tagListDemo = value;
    prefs.setStringList(
        'ff_tagListDemo', value.map((x) => jsonEncode(x)).toList());
  }

  void addToTagListDemo(dynamic value) {
    tagListDemo.add(value);
    prefs.setStringList(
        'ff_tagListDemo', _tagListDemo.map((x) => jsonEncode(x)).toList());
  }

  void removeFromTagListDemo(dynamic value) {
    tagListDemo.remove(value);
    prefs.setStringList(
        'ff_tagListDemo', _tagListDemo.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromTagListDemo(int index) {
    tagListDemo.removeAt(index);
    prefs.setStringList(
        'ff_tagListDemo', _tagListDemo.map((x) => jsonEncode(x)).toList());
  }

  void updateTagListDemoAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    tagListDemo[index] = updateFn(_tagListDemo[index]);
    prefs.setStringList(
        'ff_tagListDemo', _tagListDemo.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInTagListDemo(int index, dynamic value) {
    tagListDemo.insert(index, value);
    prefs.setStringList(
        'ff_tagListDemo', _tagListDemo.map((x) => jsonEncode(x)).toList());
  }

  DocumentReference? _demoRef;
  DocumentReference? get demoRef => _demoRef;
  set demoRef(DocumentReference? value) {
    _demoRef = value;
    value != null
        ? prefs.setString('ff_demoRef', value.path)
        : prefs.remove('ff_demoRef');
  }

  String _selectedUserDemo = '';
  String get selectedUserDemo => _selectedUserDemo;
  set selectedUserDemo(String value) {
    _selectedUserDemo = value;
    prefs.setString('ff_selectedUserDemo', value);
  }

  bool _userDemoList = false;
  bool get userDemoList => _userDemoList;
  set userDemoList(bool value) {
    _userDemoList = value;
    prefs.setBool('ff_userDemoList', value);
  }

  Color _dLead = Colors.transparent;
  Color get dLead => _dLead;
  set dLead(Color value) {
    _dLead = value;
    prefs.setInt('ff_dLead', value.value);
  }

  List<dynamic> _dashProductList = [];
  List<dynamic> get dashProductList => _dashProductList;
  set dashProductList(List<dynamic> value) {
    _dashProductList = value;
  }

  void addToDashProductList(dynamic value) {
    dashProductList.add(value);
  }

  void removeFromDashProductList(dynamic value) {
    dashProductList.remove(value);
  }

  void removeAtIndexFromDashProductList(int index) {
    dashProductList.removeAt(index);
  }

  void updateDashProductListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    dashProductList[index] = updateFn(_dashProductList[index]);
  }

  void insertAtIndexInDashProductList(int index, dynamic value) {
    dashProductList.insert(index, value);
  }

  bool _isVisible = false;
  bool get isVisible => _isVisible;
  set isVisible(bool value) {
    _isVisible = value;
    prefs.setBool('ff_isVisible', value);
  }

  String _demoListDate = '';
  String get demoListDate => _demoListDate;
  set demoListDate(String value) {
    _demoListDate = value;
    prefs.setString('ff_demoListDate', value);
  }

  List<dynamic> _newLeadCounts = [];
  List<dynamic> get newLeadCounts => _newLeadCounts;
  set newLeadCounts(List<dynamic> value) {
    _newLeadCounts = value;
    prefs.setStringList(
        'ff_newLeadCounts', value.map((x) => jsonEncode(x)).toList());
  }

  void addToNewLeadCounts(dynamic value) {
    newLeadCounts.add(value);
    prefs.setStringList(
        'ff_newLeadCounts', _newLeadCounts.map((x) => jsonEncode(x)).toList());
  }

  void removeFromNewLeadCounts(dynamic value) {
    newLeadCounts.remove(value);
    prefs.setStringList(
        'ff_newLeadCounts', _newLeadCounts.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromNewLeadCounts(int index) {
    newLeadCounts.removeAt(index);
    prefs.setStringList(
        'ff_newLeadCounts', _newLeadCounts.map((x) => jsonEncode(x)).toList());
  }

  void updateNewLeadCountsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    newLeadCounts[index] = updateFn(_newLeadCounts[index]);
    prefs.setStringList(
        'ff_newLeadCounts', _newLeadCounts.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInNewLeadCounts(int index, dynamic value) {
    newLeadCounts.insert(index, value);
    prefs.setStringList(
        'ff_newLeadCounts', _newLeadCounts.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _assignedLeadCount = [];
  List<dynamic> get assignedLeadCount => _assignedLeadCount;
  set assignedLeadCount(List<dynamic> value) {
    _assignedLeadCount = value;
    prefs.setStringList(
        'ff_assignedLeadCount', value.map((x) => jsonEncode(x)).toList());
  }

  void addToAssignedLeadCount(dynamic value) {
    assignedLeadCount.add(value);
    prefs.setStringList('ff_assignedLeadCount',
        _assignedLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void removeFromAssignedLeadCount(dynamic value) {
    assignedLeadCount.remove(value);
    prefs.setStringList('ff_assignedLeadCount',
        _assignedLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromAssignedLeadCount(int index) {
    assignedLeadCount.removeAt(index);
    prefs.setStringList('ff_assignedLeadCount',
        _assignedLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void updateAssignedLeadCountAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    assignedLeadCount[index] = updateFn(_assignedLeadCount[index]);
    prefs.setStringList('ff_assignedLeadCount',
        _assignedLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInAssignedLeadCount(int index, dynamic value) {
    assignedLeadCount.insert(index, value);
    prefs.setStringList('ff_assignedLeadCount',
        _assignedLeadCount.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _followUpLeadCount = [];
  List<dynamic> get followUpLeadCount => _followUpLeadCount;
  set followUpLeadCount(List<dynamic> value) {
    _followUpLeadCount = value;
    prefs.setStringList(
        'ff_followUpLeadCount', value.map((x) => jsonEncode(x)).toList());
  }

  void addToFollowUpLeadCount(dynamic value) {
    followUpLeadCount.add(value);
    prefs.setStringList('ff_followUpLeadCount',
        _followUpLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void removeFromFollowUpLeadCount(dynamic value) {
    followUpLeadCount.remove(value);
    prefs.setStringList('ff_followUpLeadCount',
        _followUpLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromFollowUpLeadCount(int index) {
    followUpLeadCount.removeAt(index);
    prefs.setStringList('ff_followUpLeadCount',
        _followUpLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void updateFollowUpLeadCountAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    followUpLeadCount[index] = updateFn(_followUpLeadCount[index]);
    prefs.setStringList('ff_followUpLeadCount',
        _followUpLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInFollowUpLeadCount(int index, dynamic value) {
    followUpLeadCount.insert(index, value);
    prefs.setStringList('ff_followUpLeadCount',
        _followUpLeadCount.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _completedLeadCount = [];
  List<dynamic> get completedLeadCount => _completedLeadCount;
  set completedLeadCount(List<dynamic> value) {
    _completedLeadCount = value;
    prefs.setStringList(
        'ff_completedLeadCount', value.map((x) => jsonEncode(x)).toList());
  }

  void addToCompletedLeadCount(dynamic value) {
    completedLeadCount.add(value);
    prefs.setStringList('ff_completedLeadCount',
        _completedLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void removeFromCompletedLeadCount(dynamic value) {
    completedLeadCount.remove(value);
    prefs.setStringList('ff_completedLeadCount',
        _completedLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromCompletedLeadCount(int index) {
    completedLeadCount.removeAt(index);
    prefs.setStringList('ff_completedLeadCount',
        _completedLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void updateCompletedLeadCountAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    completedLeadCount[index] = updateFn(_completedLeadCount[index]);
    prefs.setStringList('ff_completedLeadCount',
        _completedLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInCompletedLeadCount(int index, dynamic value) {
    completedLeadCount.insert(index, value);
    prefs.setStringList('ff_completedLeadCount',
        _completedLeadCount.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _lostLeadCount = [];
  List<dynamic> get lostLeadCount => _lostLeadCount;
  set lostLeadCount(List<dynamic> value) {
    _lostLeadCount = value;
    prefs.setStringList(
        'ff_lostLeadCount', value.map((x) => jsonEncode(x)).toList());
  }

  void addToLostLeadCount(dynamic value) {
    lostLeadCount.add(value);
    prefs.setStringList(
        'ff_lostLeadCount', _lostLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void removeFromLostLeadCount(dynamic value) {
    lostLeadCount.remove(value);
    prefs.setStringList(
        'ff_lostLeadCount', _lostLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromLostLeadCount(int index) {
    lostLeadCount.removeAt(index);
    prefs.setStringList(
        'ff_lostLeadCount', _lostLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void updateLostLeadCountAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    lostLeadCount[index] = updateFn(_lostLeadCount[index]);
    prefs.setStringList(
        'ff_lostLeadCount', _lostLeadCount.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInLostLeadCount(int index, dynamic value) {
    lostLeadCount.insert(index, value);
    prefs.setStringList(
        'ff_lostLeadCount', _lostLeadCount.map((x) => jsonEncode(x)).toList());
  }

  bool _lostLeadIcon = false;
  bool get lostLeadIcon => _lostLeadIcon;
  set lostLeadIcon(bool value) {
    _lostLeadIcon = value;
    prefs.setBool('ff_lostLeadIcon', value);
  }

  String _lostLeadReason = '';
  String get lostLeadReason => _lostLeadReason;
  set lostLeadReason(String value) {
    _lostLeadReason = value;
    prefs.setString('ff_lostLeadReason', value);
  }

  int _startDate = 0;
  int get startDate => _startDate;
  set startDate(int value) {
    _startDate = value;
    prefs.setInt('ff_startDate', value);
  }

  int _endDate = 0;
  int get endDate => _endDate;
  set endDate(int value) {
    _endDate = value;
    prefs.setInt('ff_endDate', value);
  }

  String _filePath = '';
  String get filePath => _filePath;
  set filePath(String value) {
    _filePath = value;
  }

  String _tagName = '';
  String get tagName => _tagName;
  set tagName(String value) {
    _tagName = value;
    prefs.setString('ff_tagName', value);
  }

  List<dynamic> _leadTagList = [];
  List<dynamic> get leadTagList => _leadTagList;
  set leadTagList(List<dynamic> value) {
    _leadTagList = value;
    prefs.setStringList(
        'ff_leadTagList', value.map((x) => jsonEncode(x)).toList());
  }

  void addToLeadTagList(dynamic value) {
    leadTagList.add(value);
    prefs.setStringList(
        'ff_leadTagList', _leadTagList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromLeadTagList(dynamic value) {
    leadTagList.remove(value);
    prefs.setStringList(
        'ff_leadTagList', _leadTagList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromLeadTagList(int index) {
    leadTagList.removeAt(index);
    prefs.setStringList(
        'ff_leadTagList', _leadTagList.map((x) => jsonEncode(x)).toList());
  }

  void updateLeadTagListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    leadTagList[index] = updateFn(_leadTagList[index]);
    prefs.setStringList(
        'ff_leadTagList', _leadTagList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInLeadTagList(int index, dynamic value) {
    leadTagList.insert(index, value);
    prefs.setStringList(
        'ff_leadTagList', _leadTagList.map((x) => jsonEncode(x)).toList());
  }

  int _defaultCheckOut = 0;
  int get defaultCheckOut => _defaultCheckOut;
  set defaultCheckOut(int value) {
    _defaultCheckOut = value;
  }

  LatLng? _defaultCheckOutLoc = LatLng(0, 0);
  LatLng? get defaultCheckOutLoc => _defaultCheckOutLoc;
  set defaultCheckOutLoc(LatLng? value) {
    _defaultCheckOutLoc = value;
  }

  String _dropDownStatus = '';
  String get dropDownStatus => _dropDownStatus;
  set dropDownStatus(String value) {
    _dropDownStatus = value;
    prefs.setString('ff_dropDownStatus', value);
  }

  bool _showStatus = false;
  bool get showStatus => _showStatus;
  set showStatus(bool value) {
    _showStatus = value;
    prefs.setBool('ff_showStatus', value);
  }

  Color _cDemoDone = Colors.transparent;
  Color get cDemoDone => _cDemoDone;
  set cDemoDone(Color value) {
    _cDemoDone = value;
    prefs.setInt('ff_cDemoDone', value.value);
  }

  Color _cDemoResch = Colors.transparent;
  Color get cDemoResch => _cDemoResch;
  set cDemoResch(Color value) {
    _cDemoResch = value;
    prefs.setInt('ff_cDemoResch', value.value);
  }

  Color _cHold = Colors.transparent;
  Color get cHold => _cHold;
  set cHold(Color value) {
    _cHold = value;
    prefs.setInt('ff_cHold', value.value);
  }

  Color _cFollowUp = Colors.transparent;
  Color get cFollowUp => _cFollowUp;
  set cFollowUp(Color value) {
    _cFollowUp = value;
    prefs.setInt('ff_cFollowUp', value.value);
  }

  Color _cInstallation = Colors.transparent;
  Color get cInstallation => _cInstallation;
  set cInstallation(Color value) {
    _cInstallation = value;
    prefs.setInt('ff_cInstallation', value.value);
  }

  Color _cLost = Colors.transparent;
  Color get cLost => _cLost;
  set cLost(Color value) {
    _cLost = value;
    prefs.setInt('ff_cLost', value.value);
  }

  Color _cAll = Colors.transparent;
  Color get cAll => _cAll;
  set cAll(Color value) {
    _cAll = value;
    prefs.setInt('ff_cAll', value.value);
  }

  String _selectedDateFollowUpList = '';
  String get selectedDateFollowUpList => _selectedDateFollowUpList;
  set selectedDateFollowUpList(String value) {
    _selectedDateFollowUpList = value;
    prefs.setString('ff_selectedDateFollowUpList', value);
  }

  String _selectedTag = '';
  String get selectedTag => _selectedTag;
  set selectedTag(String value) {
    _selectedTag = value;
    prefs.setString('ff_selectedTag', value);
  }

  bool _allLostLead = false;
  bool get allLostLead => _allLostLead;
  set allLostLead(bool value) {
    _allLostLead = value;
    prefs.setBool('ff_allLostLead', value);
  }

  String _tagColor = '';
  String get tagColor => _tagColor;
  set tagColor(String value) {
    _tagColor = value;
    prefs.setString('ff_tagColor', value);
  }

  Color _allTagBtn = Color(4292855973);
  Color get allTagBtn => _allTagBtn;
  set allTagBtn(Color value) {
    _allTagBtn = value;
    prefs.setInt('ff_allTagBtn', value.value);
  }

  DocumentReference? _comboServicepointoutlet;
  DocumentReference? get comboServicepointoutlet => _comboServicepointoutlet;
  set comboServicepointoutlet(DocumentReference? value) {
    _comboServicepointoutlet = value;
    value != null
        ? prefs.setString('ff_comboServicepointoutlet', value.path)
        : prefs.remove('ff_comboServicepointoutlet');
  }

  int _selectedDate = 0;
  int get selectedDate => _selectedDate;
  set selectedDate(int value) {
    _selectedDate = value;
    prefs.setInt('ff_selectedDate', value);
  }

  String _dateForReport = '';
  String get dateForReport => _dateForReport;
  set dateForReport(String value) {
    _dateForReport = value;
    prefs.setString('ff_dateForReport', value);
  }

  bool _outletLead = false;
  bool get outletLead => _outletLead;
  set outletLead(bool value) {
    _outletLead = value;
    prefs.setBool('ff_outletLead', value);
  }

  String _stage = '';
  String get stage => _stage;
  set stage(String value) {
    _stage = value;
    prefs.setString('ff_stage', value);
  }

  String _selectedAssignTo = '';
  String get selectedAssignTo => _selectedAssignTo;
  set selectedAssignTo(String value) {
    _selectedAssignTo = value;
  }

  String _superAdmin = 'sensible.admin@sensibleconnect.com';
  String get superAdmin => _superAdmin;
  set superAdmin(String value) {
    _superAdmin = value;
    prefs.setString('ff_superAdmin', value);
  }

  String _superAdminPassword = 'Sensible@2023';
  String get superAdminPassword => _superAdminPassword;
  set superAdminPassword(String value) {
    _superAdminPassword = value;
    prefs.setString('ff_superAdminPassword', value);
  }

  String _qrToken = '';
  String get qrToken => _qrToken;
  set qrToken(String value) {
    _qrToken = value;
  }

  bool _duplicateMobileBoolean = false;
  bool get duplicateMobileBoolean => _duplicateMobileBoolean;
  set duplicateMobileBoolean(bool value) {
    _duplicateMobileBoolean = value;
  }

  dynamic _addAssignTest;
  dynamic get addAssignTest => _addAssignTest;
  set addAssignTest(dynamic value) {
    _addAssignTest = value;
  }

  String _userMobileNumberAddDealer = '';
  String get userMobileNumberAddDealer => _userMobileNumberAddDealer;
  set userMobileNumberAddDealer(String value) {
    _userMobileNumberAddDealer = value;
  }

  bool _changeAssignedFlag = false;
  bool get changeAssignedFlag => _changeAssignedFlag;
  set changeAssignedFlag(bool value) {
    _changeAssignedFlag = value;
  }

  String _selectedDealer = '';
  String get selectedDealer => _selectedDealer;
  set selectedDealer(String value) {
    _selectedDealer = value;
    prefs.setString('ff_selectedDealer', value);
  }

  bool _BackButtonRole = false;
  bool get BackButtonRole => _BackButtonRole;
  set BackButtonRole(bool value) {
    _BackButtonRole = value;
  }

  int _selectedDemoDate = 0;
  int get selectedDemoDate => _selectedDemoDate;
  set selectedDemoDate(int value) {
    _selectedDemoDate = value;
  }

  List<String> _steps = [];
  List<String> get steps => _steps;
  set steps(List<String> value) {
    _steps = value;
  }

  void addToSteps(String value) {
    steps.add(value);
  }

  void removeFromSteps(String value) {
    steps.remove(value);
  }

  void removeAtIndexFromSteps(int index) {
    steps.removeAt(index);
  }

  void updateStepsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    steps[index] = updateFn(_steps[index]);
  }

  void insertAtIndexInSteps(int index, String value) {
    steps.insert(index, value);
  }

  String _selectedHeader = '';
  String get selectedHeader => _selectedHeader;
  set selectedHeader(String value) {
    _selectedHeader = value;
  }

  String _selectedSubHeader = '';
  String get selectedSubHeader => _selectedSubHeader;
  set selectedSubHeader(String value) {
    _selectedSubHeader = value;
  }

  DocumentReference? _subHeaderRef;
  DocumentReference? get subHeaderRef => _subHeaderRef;
  set subHeaderRef(DocumentReference? value) {
    _subHeaderRef = value;
  }

  List<String> _imgUrl = [];
  List<String> get imgUrl => _imgUrl;
  set imgUrl(List<String> value) {
    _imgUrl = value;
  }

  void addToImgUrl(String value) {
    imgUrl.add(value);
  }

  void removeFromImgUrl(String value) {
    imgUrl.remove(value);
  }

  void removeAtIndexFromImgUrl(int index) {
    imgUrl.removeAt(index);
  }

  void updateImgUrlAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    imgUrl[index] = updateFn(_imgUrl[index]);
  }

  void insertAtIndexInImgUrl(int index, String value) {
    imgUrl.insert(index, value);
  }

  List<String> _imgList = [];
  List<String> get imgList => _imgList;
  set imgList(List<String> value) {
    _imgList = value;
  }

  void addToImgList(String value) {
    imgList.add(value);
  }

  void removeFromImgList(String value) {
    imgList.remove(value);
  }

  void removeAtIndexFromImgList(int index) {
    imgList.removeAt(index);
  }

  void updateImgListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    imgList[index] = updateFn(_imgList[index]);
  }

  void insertAtIndexInImgList(int index, String value) {
    imgList.insert(index, value);
  }

  String _headLine = '';
  String get headLine => _headLine;
  set headLine(String value) {
    _headLine = value;
  }

  String _vidurl = '';
  String get vidurl => _vidurl;
  set vidurl(String value) {
    _vidurl = value;
  }

  String _headerId = '';
  String get headerId => _headerId;
  set headerId(String value) {
    _headerId = value;
  }

  String _subHeaderId = '';
  String get subHeaderId => _subHeaderId;
  set subHeaderId(String value) {
    _subHeaderId = value;
  }

  DocumentReference? _selectedSubHeaderRef;
  DocumentReference? get selectedSubHeaderRef => _selectedSubHeaderRef;
  set selectedSubHeaderRef(DocumentReference? value) {
    _selectedSubHeaderRef = value;
  }

  String _userId = '';
  String get userId => _userId;
  set userId(String value) {
    _userId = value;
  }

  String _role = '';
  String get role => _role;
  set role(String value) {
    _role = value;
  }

  bool _isPresentInSearch = false;
  bool get isPresentInSearch => _isPresentInSearch;
  set isPresentInSearch(bool value) {
    _isPresentInSearch = value;
  }

  int _upiTotal = 0;
  int get upiTotal => _upiTotal;
  set upiTotal(int value) {
    _upiTotal = value;
  }

  bool _usermanBackFlag = false;
  bool get usermanBackFlag => _usermanBackFlag;
  set usermanBackFlag(bool value) {
    _usermanBackFlag = value;
  }

  dynamic _leadChartData = jsonDecode('null');
  dynamic get leadChartData => _leadChartData;
  set leadChartData(dynamic value) {
    _leadChartData = value;
  }

  DocumentReference? _userProfileRef;
  DocumentReference? get userProfileRef => _userProfileRef;
  set userProfileRef(DocumentReference? value) {
    _userProfileRef = value;
  }

  List<dynamic> _leadPermission = [
    jsonDecode('{\"title\":\"Leads\",\"value\":1}'),
    jsonDecode('{\"title\":\"Leads\",\"value\":2}'),
    jsonDecode('{\"title\":\"Leads\",\"value\":3}'),
    jsonDecode('{\"title\":\"Leads\",\"value\":4}')
  ];
  List<dynamic> get leadPermission => _leadPermission;
  set leadPermission(List<dynamic> value) {
    _leadPermission = value;
  }

  void addToLeadPermission(dynamic value) {
    leadPermission.add(value);
  }

  void removeFromLeadPermission(dynamic value) {
    leadPermission.remove(value);
  }

  void removeAtIndexFromLeadPermission(int index) {
    leadPermission.removeAt(index);
  }

  void updateLeadPermissionAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    leadPermission[index] = updateFn(_leadPermission[index]);
  }

  void insertAtIndexInLeadPermission(int index, dynamic value) {
    leadPermission.insert(index, value);
  }

  bool _searchHide = false;
  bool get searchHide => _searchHide;
  set searchHide(bool value) {
    _searchHide = value;
    prefs.setBool('ff_searchHide', value);
  }

  String _image = '';
  String get image => _image;
  set image(String value) {
    _image = value;
  }

  bool _mode = false;
  bool get mode => _mode;
  set mode(bool value) {
    _mode = value;
  }

  DateTime? _startDate1;
  DateTime? get startDate1 => _startDate1;
  set startDate1(DateTime? value) {
    _startDate1 = value;
  }

  DateTime? _endDate1;
  DateTime? get endDate1 => _endDate1;
  set endDate1(DateTime? value) {
    _endDate1 = value;
  }

  DateTime? _endDateShow;
  DateTime? get endDateShow => _endDateShow;
  set endDateShow(DateTime? value) {
    _endDateShow = value;
  }

  Color _lleads = Colors.transparent;
  Color get lleads => _lleads;
  set lleads(Color value) {
    _lleads = value;
    prefs.setInt('ff_lleads', value.value);
  }

  List<int> _leadValues = [1, 2, 3, 4];
  List<int> get leadValues => _leadValues;
  set leadValues(List<int> value) {
    _leadValues = value;
  }

  void addToLeadValues(int value) {
    leadValues.add(value);
  }

  void removeFromLeadValues(int value) {
    leadValues.remove(value);
  }

  void removeAtIndexFromLeadValues(int index) {
    leadValues.removeAt(index);
  }

  void updateLeadValuesAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    leadValues[index] = updateFn(_leadValues[index]);
  }

  void insertAtIndexInLeadValues(int index, int value) {
    leadValues.insert(index, value);
  }

  List<dynamic> _leadCount = [];
  List<dynamic> get leadCount => _leadCount;
  set leadCount(List<dynamic> value) {
    _leadCount = value;
  }

  void addToLeadCount(dynamic value) {
    leadCount.add(value);
  }

  void removeFromLeadCount(dynamic value) {
    leadCount.remove(value);
  }

  void removeAtIndexFromLeadCount(int index) {
    leadCount.removeAt(index);
  }

  void updateLeadCountAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    leadCount[index] = updateFn(_leadCount[index]);
  }

  void insertAtIndexInLeadCount(int index, dynamic value) {
    leadCount.insert(index, value);
  }

  String _uploadedFileUrl = '';
  String get uploadedFileUrl => _uploadedFileUrl;
  set uploadedFileUrl(String value) {
    _uploadedFileUrl = value;
  }

  String _dealerId = '';
  String get dealerId => _dealerId;
  set dealerId(String value) {
    _dealerId = value;
  }

  List<String> _userMobileNumbers = [];
  List<String> get userMobileNumbers => _userMobileNumbers;
  set userMobileNumbers(List<String> value) {
    _userMobileNumbers = value;
  }

  void addToUserMobileNumbers(String value) {
    userMobileNumbers.add(value);
  }

  void removeFromUserMobileNumbers(String value) {
    userMobileNumbers.remove(value);
  }

  void removeAtIndexFromUserMobileNumbers(int index) {
    userMobileNumbers.removeAt(index);
  }

  void updateUserMobileNumbersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    userMobileNumbers[index] = updateFn(_userMobileNumbers[index]);
  }

  void insertAtIndexInUserMobileNumbers(int index, String value) {
    userMobileNumbers.insert(index, value);
  }

  bool _show = false;
  bool get show => _show;
  set show(bool value) {
    _show = value;
  }

  bool _isSearching = false;
  bool get isSearching => _isSearching;
  set isSearching(bool value) {
    _isSearching = value;
  }

  List<dynamic> _rawCartList = [];
  List<dynamic> get rawCartList => _rawCartList;
  set rawCartList(List<dynamic> value) {
    _rawCartList = value;
    prefs.setStringList(
        'ff_rawCartList', value.map((x) => jsonEncode(x)).toList());
  }

  void addToRawCartList(dynamic value) {
    rawCartList.add(value);
    prefs.setStringList(
        'ff_rawCartList', _rawCartList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromRawCartList(dynamic value) {
    rawCartList.remove(value);
    prefs.setStringList(
        'ff_rawCartList', _rawCartList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromRawCartList(int index) {
    rawCartList.removeAt(index);
    prefs.setStringList(
        'ff_rawCartList', _rawCartList.map((x) => jsonEncode(x)).toList());
  }

  void updateRawCartListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    rawCartList[index] = updateFn(_rawCartList[index]);
    prefs.setStringList(
        'ff_rawCartList', _rawCartList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInRawCartList(int index, dynamic value) {
    rawCartList.insert(index, value);
    prefs.setStringList(
        'ff_rawCartList', _rawCartList.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _rawCartList2 = [];
  List<dynamic> get rawCartList2 => _rawCartList2;
  set rawCartList2(List<dynamic> value) {
    _rawCartList2 = value;
    prefs.setStringList(
        'ff_rawCartList2', value.map((x) => jsonEncode(x)).toList());
  }

  void addToRawCartList2(dynamic value) {
    rawCartList2.add(value);
    prefs.setStringList(
        'ff_rawCartList2', _rawCartList2.map((x) => jsonEncode(x)).toList());
  }

  void removeFromRawCartList2(dynamic value) {
    rawCartList2.remove(value);
    prefs.setStringList(
        'ff_rawCartList2', _rawCartList2.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromRawCartList2(int index) {
    rawCartList2.removeAt(index);
    prefs.setStringList(
        'ff_rawCartList2', _rawCartList2.map((x) => jsonEncode(x)).toList());
  }

  void updateRawCartList2AtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    rawCartList2[index] = updateFn(_rawCartList2[index]);
    prefs.setStringList(
        'ff_rawCartList2', _rawCartList2.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInRawCartList2(int index, dynamic value) {
    rawCartList2.insert(index, value);
    prefs.setStringList(
        'ff_rawCartList2', _rawCartList2.map((x) => jsonEncode(x)).toList());
  }

  dynamic _selectedSale;
  dynamic get selectedSale => _selectedSale;
  set selectedSale(dynamic value) {
    _selectedSale = value;
  }

  dynamic _selectedPurchase;
  dynamic get selectedPurchase => _selectedPurchase;
  set selectedPurchase(dynamic value) {
    _selectedPurchase = value;
  }

  List<String> _imagePathh = [];
  List<String> get imagePathh => _imagePathh;
  set imagePathh(List<String> value) {
    _imagePathh = value;
  }

  void addToImagePathh(String value) {
    imagePathh.add(value);
  }

  void removeFromImagePathh(String value) {
    imagePathh.remove(value);
  }

  void removeAtIndexFromImagePathh(int index) {
    imagePathh.removeAt(index);
  }

  void updateImagePathhAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    imagePathh[index] = updateFn(_imagePathh[index]);
  }

  void insertAtIndexInImagePathh(int index, String value) {
    imagePathh.insert(index, value);
  }

  int _count = 0;
  int get count => _count;
  set count(int value) {
    _count = value;
  }

  double _subTotal = 0.0;
  double get subTotal => _subTotal;
  set subTotal(double value) {
    _subTotal = value;
    prefs.setDouble('ff_subTotal', value);
  }

  List<dynamic> _tempPartyList = [];
  List<dynamic> get tempPartyList => _tempPartyList;
  set tempPartyList(List<dynamic> value) {
    _tempPartyList = value;
    prefs.setStringList(
        'ff_tempPartyList', value.map((x) => jsonEncode(x)).toList());
  }

  void addToTempPartyList(dynamic value) {
    tempPartyList.add(value);
    prefs.setStringList(
        'ff_tempPartyList', _tempPartyList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromTempPartyList(dynamic value) {
    tempPartyList.remove(value);
    prefs.setStringList(
        'ff_tempPartyList', _tempPartyList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromTempPartyList(int index) {
    tempPartyList.removeAt(index);
    prefs.setStringList(
        'ff_tempPartyList', _tempPartyList.map((x) => jsonEncode(x)).toList());
  }

  void updateTempPartyListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    tempPartyList[index] = updateFn(_tempPartyList[index]);
    prefs.setStringList(
        'ff_tempPartyList', _tempPartyList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInTempPartyList(int index, dynamic value) {
    tempPartyList.insert(index, value);
    prefs.setStringList(
        'ff_tempPartyList', _tempPartyList.map((x) => jsonEncode(x)).toList());
  }

  double _percentageDis = 0.0;
  double get percentageDis => _percentageDis;
  set percentageDis(double value) {
    _percentageDis = value;
  }

  double _totalPriceEdit = 0.0;
  double get totalPriceEdit => _totalPriceEdit;
  set totalPriceEdit(double value) {
    _totalPriceEdit = value;
  }

  dynamic _jsonrawcart;
  dynamic get jsonrawcart => _jsonrawcart;
  set jsonrawcart(dynamic value) {
    _jsonrawcart = value;
  }

  double _textDisAmt = 0.0;
  double get textDisAmt => _textDisAmt;
  set textDisAmt(double value) {
    _textDisAmt = value;
  }

  bool _gstsale = false;
  bool get gstsale => _gstsale;
  set gstsale(bool value) {
    _gstsale = value;
  }

  String _kioskProductImageUrl = '';
  String get kioskProductImageUrl => _kioskProductImageUrl;
  set kioskProductImageUrl(String value) {
    _kioskProductImageUrl = value;
  }

  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  set tabIndex(int value) {
    _tabIndex = value;
  }

  String _categoryId = '';
  String get categoryId => _categoryId;
  set categoryId(String value) {
    _categoryId = value;
  }

  bool _allinclusive = true;
  bool get allinclusive => _allinclusive;
  set allinclusive(bool value) {
    _allinclusive = value;
  }

  double _gstAmt = 0.0;
  double get gstAmt => _gstAmt;
  set gstAmt(double value) {
    _gstAmt = value;
  }

  bool _isDealer = false;
  bool get isDealer => _isDealer;
  set isDealer(bool value) {
    _isDealer = value;
    prefs.setBool('ff_isDealer', value);
  }

  int _rawCode = 0;
  int get rawCode => _rawCode;
  set rawCode(int value) {
    _rawCode = value;
    prefs.setInt('ff_rawCode', value);
  }

  int _SalesCount = 0;
  int get SalesCount => _SalesCount;
  set SalesCount(int value) {
    _SalesCount = value;
  }

  List<dynamic> _leadJsonForChart = [];
  List<dynamic> get leadJsonForChart => _leadJsonForChart;
  set leadJsonForChart(List<dynamic> value) {
    _leadJsonForChart = value;
  }

  void addToLeadJsonForChart(dynamic value) {
    leadJsonForChart.add(value);
  }

  void removeFromLeadJsonForChart(dynamic value) {
    leadJsonForChart.remove(value);
  }

  void removeAtIndexFromLeadJsonForChart(int index) {
    leadJsonForChart.removeAt(index);
  }

  void updateLeadJsonForChartAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    leadJsonForChart[index] = updateFn(_leadJsonForChart[index]);
  }

  void insertAtIndexInLeadJsonForChart(int index, dynamic value) {
    leadJsonForChart.insert(index, value);
  }

  int _selectedStatus = 0;
  int get selectedStatus => _selectedStatus;
  set selectedStatus(int value) {
    _selectedStatus = value;
    prefs.setInt('ff_selectedStatus', value);
  }

  String _billingType = '';
  String get billingType => _billingType;
  set billingType(String value) {
    _billingType = value;
  }

  String _zone = '';
  String get zone => _zone;
  set zone(String value) {
    _zone = value;
    prefs.setString('ff_zone', value);
  }

  String _emailForReport = '';
  String get emailForReport => _emailForReport;
  set emailForReport(String value) {
    _emailForReport = value;
  }

  String _currentUserRole = '';
  String get currentUserRole => _currentUserRole;
  set currentUserRole(String value) {
    _currentUserRole = value;
    prefs.setString('ff_currentUserRole', value);
  }

  DocumentReference? _deyeOutletId =
      FirebaseFirestore.instance.doc('/OUTLET/Ab8jsMVOOA1bEUqju7uM');
  DocumentReference? get deyeOutletId => _deyeOutletId;
  set deyeOutletId(DocumentReference? value) {
    _deyeOutletId = value;
  }

  List<UserAccesCStruct> _loggedInUserPermisions = [
    UserAccesCStruct.fromSerializableMap(
        jsonDecode('{\"title\":\"Hello World\",\"value\":\"0\"}'))
  ];
  List<UserAccesCStruct> get loggedInUserPermisions => _loggedInUserPermisions;
  set loggedInUserPermisions(List<UserAccesCStruct> value) {
    _loggedInUserPermisions = value;
    prefs.setStringList(
        'ff_loggedInUserPermisions', value.map((x) => x.serialize()).toList());
  }

  void addToLoggedInUserPermisions(UserAccesCStruct value) {
    loggedInUserPermisions.add(value);
    prefs.setStringList('ff_loggedInUserPermisions',
        _loggedInUserPermisions.map((x) => x.serialize()).toList());
  }

  void removeFromLoggedInUserPermisions(UserAccesCStruct value) {
    loggedInUserPermisions.remove(value);
    prefs.setStringList('ff_loggedInUserPermisions',
        _loggedInUserPermisions.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromLoggedInUserPermisions(int index) {
    loggedInUserPermisions.removeAt(index);
    prefs.setStringList('ff_loggedInUserPermisions',
        _loggedInUserPermisions.map((x) => x.serialize()).toList());
  }

  void updateLoggedInUserPermisionsAtIndex(
    int index,
    UserAccesCStruct Function(UserAccesCStruct) updateFn,
  ) {
    loggedInUserPermisions[index] = updateFn(_loggedInUserPermisions[index]);
    prefs.setStringList('ff_loggedInUserPermisions',
        _loggedInUserPermisions.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInLoggedInUserPermisions(
      int index, UserAccesCStruct value) {
    loggedInUserPermisions.insert(index, value);
    prefs.setStringList('ff_loggedInUserPermisions',
        _loggedInUserPermisions.map((x) => x.serialize()).toList());
  }

  List<String> _currentUserZoneList = [];
  List<String> get currentUserZoneList => _currentUserZoneList;
  set currentUserZoneList(List<String> value) {
    _currentUserZoneList = value;
    prefs.setStringList('ff_currentUserZoneList', value);
  }

  void addToCurrentUserZoneList(String value) {
    currentUserZoneList.add(value);
    prefs.setStringList('ff_currentUserZoneList', _currentUserZoneList);
  }

  void removeFromCurrentUserZoneList(String value) {
    currentUserZoneList.remove(value);
    prefs.setStringList('ff_currentUserZoneList', _currentUserZoneList);
  }

  void removeAtIndexFromCurrentUserZoneList(int index) {
    currentUserZoneList.removeAt(index);
    prefs.setStringList('ff_currentUserZoneList', _currentUserZoneList);
  }

  void updateCurrentUserZoneListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    currentUserZoneList[index] = updateFn(_currentUserZoneList[index]);
    prefs.setStringList('ff_currentUserZoneList', _currentUserZoneList);
  }

  void insertAtIndexInCurrentUserZoneList(int index, String value) {
    currentUserZoneList.insert(index, value);
    prefs.setStringList('ff_currentUserZoneList', _currentUserZoneList);
  }

  bool _readOnlyAccess = false;
  bool get readOnlyAccess => _readOnlyAccess;
  set readOnlyAccess(bool value) {
    _readOnlyAccess = value;
    prefs.setBool('ff_readOnlyAccess', value);
  }

  List<StageAccessDataTypeStruct> _stageListState = [];
  List<StageAccessDataTypeStruct> get stageListState => _stageListState;
  set stageListState(List<StageAccessDataTypeStruct> value) {
    _stageListState = value;
  }

  void addToStageListState(StageAccessDataTypeStruct value) {
    stageListState.add(value);
  }

  void removeFromStageListState(StageAccessDataTypeStruct value) {
    stageListState.remove(value);
  }

  void removeAtIndexFromStageListState(int index) {
    stageListState.removeAt(index);
  }

  void updateStageListStateAtIndex(
    int index,
    StageAccessDataTypeStruct Function(StageAccessDataTypeStruct) updateFn,
  ) {
    stageListState[index] = updateFn(_stageListState[index]);
  }

  void insertAtIndexInStageListState(
      int index, StageAccessDataTypeStruct value) {
    stageListState.insert(index, value);
  }

  List<StageAccessDataTypeStruct> _stageListPermissionState = [];
  List<StageAccessDataTypeStruct> get stageListPermissionState =>
      _stageListPermissionState;
  set stageListPermissionState(List<StageAccessDataTypeStruct> value) {
    _stageListPermissionState = value;
    prefs.setStringList('ff_stageListPermissionState',
        value.map((x) => x.serialize()).toList());
  }

  void addToStageListPermissionState(StageAccessDataTypeStruct value) {
    stageListPermissionState.add(value);
    prefs.setStringList('ff_stageListPermissionState',
        _stageListPermissionState.map((x) => x.serialize()).toList());
  }

  void removeFromStageListPermissionState(StageAccessDataTypeStruct value) {
    stageListPermissionState.remove(value);
    prefs.setStringList('ff_stageListPermissionState',
        _stageListPermissionState.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromStageListPermissionState(int index) {
    stageListPermissionState.removeAt(index);
    prefs.setStringList('ff_stageListPermissionState',
        _stageListPermissionState.map((x) => x.serialize()).toList());
  }

  void updateStageListPermissionStateAtIndex(
    int index,
    StageAccessDataTypeStruct Function(StageAccessDataTypeStruct) updateFn,
  ) {
    stageListPermissionState[index] =
        updateFn(_stageListPermissionState[index]);
    prefs.setStringList('ff_stageListPermissionState',
        _stageListPermissionState.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInStageListPermissionState(
      int index, StageAccessDataTypeStruct value) {
    stageListPermissionState.insert(index, value);
    prefs.setStringList('ff_stageListPermissionState',
        _stageListPermissionState.map((x) => x.serialize()).toList());
  }

  List<String> _emptyList = [];
  List<String> get emptyList => _emptyList;
  set emptyList(List<String> value) {
    _emptyList = value;
  }

  void addToEmptyList(String value) {
    emptyList.add(value);
  }

  void removeFromEmptyList(String value) {
    emptyList.remove(value);
  }

  void removeAtIndexFromEmptyList(int index) {
    emptyList.removeAt(index);
  }

  void updateEmptyListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    emptyList[index] = updateFn(_emptyList[index]);
  }

  void insertAtIndexInEmptyList(int index, String value) {
    emptyList.insert(index, value);
  }

  String _selectedItem = '';
  String get selectedItem => _selectedItem;
  set selectedItem(String value) {
    _selectedItem = value;
  }

  List<CustFeedbackStruct> _emptyFeedbackList = [];
  List<CustFeedbackStruct> get emptyFeedbackList => _emptyFeedbackList;
  set emptyFeedbackList(List<CustFeedbackStruct> value) {
    _emptyFeedbackList = value;
  }

  void addToEmptyFeedbackList(CustFeedbackStruct value) {
    emptyFeedbackList.add(value);
  }

  void removeFromEmptyFeedbackList(CustFeedbackStruct value) {
    emptyFeedbackList.remove(value);
  }

  void removeAtIndexFromEmptyFeedbackList(int index) {
    emptyFeedbackList.removeAt(index);
  }

  void updateEmptyFeedbackListAtIndex(
    int index,
    CustFeedbackStruct Function(CustFeedbackStruct) updateFn,
  ) {
    emptyFeedbackList[index] = updateFn(_emptyFeedbackList[index]);
  }

  void insertAtIndexInEmptyFeedbackList(int index, CustFeedbackStruct value) {
    emptyFeedbackList.insert(index, value);
  }

  double _avgRating = 0.0;
  double get avgRating => _avgRating;
  set avgRating(double value) {
    _avgRating = value;
  }

  String _stateZone = '';
  String get stateZone => _stateZone;
  set stateZone(String value) {
    _stateZone = value;
  }

  List<CityListStruct> _cities = [];
  List<CityListStruct> get cities => _cities;
  set cities(List<CityListStruct> value) {
    _cities = value;
    prefs.setStringList('ff_cities', value.map((x) => x.serialize()).toList());
  }

  void addToCities(CityListStruct value) {
    cities.add(value);
    prefs.setStringList(
        'ff_cities', _cities.map((x) => x.serialize()).toList());
  }

  void removeFromCities(CityListStruct value) {
    cities.remove(value);
    prefs.setStringList(
        'ff_cities', _cities.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCities(int index) {
    cities.removeAt(index);
    prefs.setStringList(
        'ff_cities', _cities.map((x) => x.serialize()).toList());
  }

  void updateCitiesAtIndex(
    int index,
    CityListStruct Function(CityListStruct) updateFn,
  ) {
    cities[index] = updateFn(_cities[index]);
    prefs.setStringList(
        'ff_cities', _cities.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCities(int index, CityListStruct value) {
    cities.insert(index, value);
    prefs.setStringList(
        'ff_cities', _cities.map((x) => x.serialize()).toList());
  }

  List<StatesStruct> _states = [];
  List<StatesStruct> get states => _states;
  set states(List<StatesStruct> value) {
    _states = value;
    prefs.setStringList('ff_states', value.map((x) => x.serialize()).toList());
  }

  void addToStates(StatesStruct value) {
    states.add(value);
    prefs.setStringList(
        'ff_states', _states.map((x) => x.serialize()).toList());
  }

  void removeFromStates(StatesStruct value) {
    states.remove(value);
    prefs.setStringList(
        'ff_states', _states.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromStates(int index) {
    states.removeAt(index);
    prefs.setStringList(
        'ff_states', _states.map((x) => x.serialize()).toList());
  }

  void updateStatesAtIndex(
    int index,
    StatesStruct Function(StatesStruct) updateFn,
  ) {
    states[index] = updateFn(_states[index]);
    prefs.setStringList(
        'ff_states', _states.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInStates(int index, StatesStruct value) {
    states.insert(index, value);
    prefs.setStringList(
        'ff_states', _states.map((x) => x.serialize()).toList());
  }

  List<ProductDataTypeStruct> _productsList = [];
  List<ProductDataTypeStruct> get productsList => _productsList;
  set productsList(List<ProductDataTypeStruct> value) {
    _productsList = value;
    prefs.setStringList(
        'ff_productsList', value.map((x) => x.serialize()).toList());
  }

  void addToProductsList(ProductDataTypeStruct value) {
    productsList.add(value);
    prefs.setStringList(
        'ff_productsList', _productsList.map((x) => x.serialize()).toList());
  }

  void removeFromProductsList(ProductDataTypeStruct value) {
    productsList.remove(value);
    prefs.setStringList(
        'ff_productsList', _productsList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromProductsList(int index) {
    productsList.removeAt(index);
    prefs.setStringList(
        'ff_productsList', _productsList.map((x) => x.serialize()).toList());
  }

  void updateProductsListAtIndex(
    int index,
    ProductDataTypeStruct Function(ProductDataTypeStruct) updateFn,
  ) {
    productsList[index] = updateFn(_productsList[index]);
    prefs.setStringList(
        'ff_productsList', _productsList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInProductsList(int index, ProductDataTypeStruct value) {
    productsList.insert(index, value);
    prefs.setStringList(
        'ff_productsList', _productsList.map((x) => x.serialize()).toList());
  }

  List<CategoryDataTypeStruct> _categoryList = [];
  List<CategoryDataTypeStruct> get categoryList => _categoryList;
  set categoryList(List<CategoryDataTypeStruct> value) {
    _categoryList = value;
    prefs.setStringList(
        'ff_categoryList', value.map((x) => x.serialize()).toList());
  }

  void addToCategoryList(CategoryDataTypeStruct value) {
    categoryList.add(value);
    prefs.setStringList(
        'ff_categoryList', _categoryList.map((x) => x.serialize()).toList());
  }

  void removeFromCategoryList(CategoryDataTypeStruct value) {
    categoryList.remove(value);
    prefs.setStringList(
        'ff_categoryList', _categoryList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCategoryList(int index) {
    categoryList.removeAt(index);
    prefs.setStringList(
        'ff_categoryList', _categoryList.map((x) => x.serialize()).toList());
  }

  void updateCategoryListAtIndex(
    int index,
    CategoryDataTypeStruct Function(CategoryDataTypeStruct) updateFn,
  ) {
    categoryList[index] = updateFn(_categoryList[index]);
    prefs.setStringList(
        'ff_categoryList', _categoryList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCategoryList(int index, CategoryDataTypeStruct value) {
    categoryList.insert(index, value);
    prefs.setStringList(
        'ff_categoryList', _categoryList.map((x) => x.serialize()).toList());
  }

  List<TeamTreeDatatypeStruct> _TeamTreeUsers = [];
  List<TeamTreeDatatypeStruct> get TeamTreeUsers => _TeamTreeUsers;
  set TeamTreeUsers(List<TeamTreeDatatypeStruct> value) {
    _TeamTreeUsers = value;
    prefs.setStringList(
        'ff_TeamTreeUsers', value.map((x) => x.serialize()).toList());
  }

  void addToTeamTreeUsers(TeamTreeDatatypeStruct value) {
    TeamTreeUsers.add(value);
    prefs.setStringList(
        'ff_TeamTreeUsers', _TeamTreeUsers.map((x) => x.serialize()).toList());
  }

  void removeFromTeamTreeUsers(TeamTreeDatatypeStruct value) {
    TeamTreeUsers.remove(value);
    prefs.setStringList(
        'ff_TeamTreeUsers', _TeamTreeUsers.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTeamTreeUsers(int index) {
    TeamTreeUsers.removeAt(index);
    prefs.setStringList(
        'ff_TeamTreeUsers', _TeamTreeUsers.map((x) => x.serialize()).toList());
  }

  void updateTeamTreeUsersAtIndex(
    int index,
    TeamTreeDatatypeStruct Function(TeamTreeDatatypeStruct) updateFn,
  ) {
    TeamTreeUsers[index] = updateFn(_TeamTreeUsers[index]);
    prefs.setStringList(
        'ff_TeamTreeUsers', _TeamTreeUsers.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTeamTreeUsers(int index, TeamTreeDatatypeStruct value) {
    TeamTreeUsers.insert(index, value);
    prefs.setStringList(
        'ff_TeamTreeUsers', _TeamTreeUsers.map((x) => x.serialize()).toList());
  }

  String _curUserName = '';
  String get curUserName => _curUserName;
  set curUserName(String value) {
    _curUserName = value;
    prefs.setString('ff_curUserName', value);
  }

  int _TotalLostLeads = 0;
  int get TotalLostLeads => _TotalLostLeads;
  set TotalLostLeads(int value) {
    _TotalLostLeads = value;
  }

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    prefs.setBool('ff_isLoggedIn', value);
  }

  bool _isOnboard = false;
  bool get isOnboard => _isOnboard;
  set isOnboard(bool value) {
    _isOnboard = value;
  }

  String _roleInZone = '';
  String get roleInZone => _roleInZone;
  set roleInZone(String value) {
    _roleInZone = value;
    prefs.setString('ff_roleInZone', value);
  }

  String _currentLoggedInUserId = '';
  String get currentLoggedInUserId => _currentLoggedInUserId;
  set currentLoggedInUserId(String value) {
    _currentLoggedInUserId = value;
    prefs.setString('ff_currentLoggedInUserId', value);
  }

  DateTime? _endDateForAtt;
  DateTime? get endDateForAtt => _endDateForAtt;
  set endDateForAtt(DateTime? value) {
    _endDateForAtt = value;
  }

  DocumentReference? _demoOutlet =
      FirebaseFirestore.instance.doc('/OUTLET/uoYCpp2wsYUrPrSnr0sD');
  DocumentReference? get demoOutlet => _demoOutlet;
  set demoOutlet(DocumentReference? value) {
    _demoOutlet = value;
    value != null
        ? prefs.setString('ff_demoOutlet', value.path)
        : prefs.remove('ff_demoOutlet');
  }

  final _dealersManager = StreamRequestManager<List<DealersRecord>>();
  Stream<List<DealersRecord>> dealers({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<DealersRecord>> Function() requestFn,
  }) =>
      _dealersManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearDealersCache() => _dealersManager.clear();
  void clearDealersCacheKey(String? uniqueKey) =>
      _dealersManager.clearRequest(uniqueKey);
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
