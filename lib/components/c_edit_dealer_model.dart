import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'c_edit_dealer_widget.dart' show CEditDealerWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CEditDealerModel extends FlutterFlowModel<CEditDealerWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for dealersCompanyName widget.
  FocusNode? dealersCompanyNameFocusNode;
  TextEditingController? dealersCompanyNameController;
  String? Function(BuildContext, String?)?
      dealersCompanyNameControllerValidator;
  // State field(s) for GST_Number widget.
  FocusNode? gSTNumberFocusNode;
  TextEditingController? gSTNumberController;
  String? Function(BuildContext, String?)? gSTNumberControllerValidator;
  // State field(s) for emailIdDealer widget.
  FocusNode? emailIdDealerFocusNode;
  TextEditingController? emailIdDealerController;
  String? Function(BuildContext, String?)? emailIdDealerControllerValidator;
  // State field(s) for websiteDealer widget.
  FocusNode? websiteDealerFocusNode;
  TextEditingController? websiteDealerController;
  String? Function(BuildContext, String?)? websiteDealerControllerValidator;
  // State field(s) for stateDealer widget.
  FocusNode? stateDealerFocusNode;
  TextEditingController? stateDealerController;
  String? Function(BuildContext, String?)? stateDealerControllerValidator;
  // State field(s) for addressDealer widget.
  FocusNode? addressDealerFocusNode;
  TextEditingController? addressDealerController;
  String? Function(BuildContext, String?)? addressDealerControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    dealersCompanyNameFocusNode?.dispose();
    dealersCompanyNameController?.dispose();

    gSTNumberFocusNode?.dispose();
    gSTNumberController?.dispose();

    emailIdDealerFocusNode?.dispose();
    emailIdDealerController?.dispose();

    websiteDealerFocusNode?.dispose();
    websiteDealerController?.dispose();

    stateDealerFocusNode?.dispose();
    stateDealerController?.dispose();

    addressDealerFocusNode?.dispose();
    addressDealerController?.dispose();
  }
}
