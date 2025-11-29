import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/components/edit_discount_amount_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'create_sale_direct_sale_widget.dart' show CreateSaleDirectSaleWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CreateSaleDirectSaleModel
    extends FlutterFlowModel<CreateSaleDirectSaleWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextFieldSalesParty widget.
  final textFieldSalesPartyKey = GlobalKey();
  FocusNode? textFieldSalesPartyFocusNode;
  TextEditingController? textFieldSalesPartyTextController;
  String? textFieldSalesPartySelectedOption;
  String? Function(BuildContext, String?)?
      textFieldSalesPartyTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for Amount widget.
  FocusNode? amountFocusNode;
  TextEditingController? amountTextController;
  String? Function(BuildContext, String?)? amountTextControllerValidator;
  // Stores action output result for [Custom Action - getFinalAmt] action in Amount widget.
  double? final1;
  // State field(s) for TextFieldDiscountPer widget.
  FocusNode? textFieldDiscountPerFocusNode;
  TextEditingController? textFieldDiscountPerTextController;
  String? Function(BuildContext, String?)?
      textFieldDiscountPerTextControllerValidator;
  // Stores action output result for [Custom Action - discountAmt] action in TextFieldDiscountPer widget.
  double? disc;
  // Stores action output result for [Custom Action - getFinalAmt] action in TextFieldDiscountPer widget.
  double? final2;
  // Stores action output result for [Custom Action - roundOff] action in Button widget.
  double? round1;
  // Stores action output result for [Custom Action - roundOff] action in Button widget.
  double? round2;
  // State field(s) for TextFieldRoundOff widget.
  FocusNode? textFieldRoundOffFocusNode;
  TextEditingController? textFieldRoundOffTextController;
  String? Function(BuildContext, String?)?
      textFieldRoundOffTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for TextFieldPaidAmount widget.
  FocusNode? textFieldPaidAmountFocusNode;
  TextEditingController? textFieldPaidAmountTextController;
  String? Function(BuildContext, String?)?
      textFieldPaidAmountTextControllerValidator;
  // Stores action output result for [Custom Action - balanceAmt] action in TextFieldPaidAmount widget.
  double? balance;
  // Stores action output result for [Custom Action - getPurchaseItems] action in Container widget.
  List<PurchaseSaleItemListStruct>? raw;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  SaleRecord? sRef;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  UserProfileRecord? noti;
  // Stores action output result for [Custom Action - credit] action in Container widget.
  double? credit;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  bool isDataUploading_uploadDataR0 = false;
  FFUploadedFile uploadedLocalFile_uploadDataR0 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataR0 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldSalesPartyFocusNode?.dispose();

    textFieldFocusNode1?.dispose();
    textController2?.dispose();

    amountFocusNode?.dispose();
    amountTextController?.dispose();

    textFieldDiscountPerFocusNode?.dispose();
    textFieldDiscountPerTextController?.dispose();

    textFieldRoundOffFocusNode?.dispose();
    textFieldRoundOffTextController?.dispose();

    textFieldFocusNode2?.dispose();
    textController6?.dispose();

    textFieldPaidAmountFocusNode?.dispose();
    textFieldPaidAmountTextController?.dispose();

    expandableExpandableController.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
