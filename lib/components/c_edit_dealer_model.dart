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
  TextEditingController? dealersCompanyNameTextController;
  String? Function(BuildContext, String?)?
      dealersCompanyNameTextControllerValidator;
  // State field(s) for GST_Number widget.
  FocusNode? gSTNumberFocusNode;
  TextEditingController? gSTNumberTextController;
  String? Function(BuildContext, String?)? gSTNumberTextControllerValidator;
  // State field(s) for emailIdDealer widget.
  FocusNode? emailIdDealerFocusNode;
  TextEditingController? emailIdDealerTextController;
  String? Function(BuildContext, String?)? emailIdDealerTextControllerValidator;
  // State field(s) for websiteDealer widget.
  FocusNode? websiteDealerFocusNode;
  TextEditingController? websiteDealerTextController;
  String? Function(BuildContext, String?)? websiteDealerTextControllerValidator;
  // State field(s) for stateDealer widget.
  FocusNode? stateDealerFocusNode;
  TextEditingController? stateDealerTextController;
  String? Function(BuildContext, String?)? stateDealerTextControllerValidator;
  // State field(s) for addressDealer widget.
  FocusNode? addressDealerFocusNode;
  TextEditingController? addressDealerTextController;
  String? Function(BuildContext, String?)? addressDealerTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    dealersCompanyNameFocusNode?.dispose();
    dealersCompanyNameTextController?.dispose();

    gSTNumberFocusNode?.dispose();
    gSTNumberTextController?.dispose();

    emailIdDealerFocusNode?.dispose();
    emailIdDealerTextController?.dispose();

    websiteDealerFocusNode?.dispose();
    websiteDealerTextController?.dispose();

    stateDealerFocusNode?.dispose();
    stateDealerTextController?.dispose();

    addressDealerFocusNode?.dispose();
    addressDealerTextController?.dispose();
  }
}
