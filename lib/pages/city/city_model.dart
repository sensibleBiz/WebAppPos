import '/backend/backend.dart';
import '/deye_c_r_m/deye_header/deye_header_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/add_city/add_city_widget.dart';
import '/pages/components/adm_side_nav_bar/adm_side_nav_bar_widget.dart';
import '/pages/components/admin_header/admin_header_widget.dart';
import '/pages/components/update_city/update_city_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'city_widget.dart' show CityWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CityModel extends FlutterFlowModel<CityWidget> {
  ///  Local state fields for this page.

  String selectedState = 'MAHARASHTRA';

  ///  State fields for stateful widgets in this page.

  // Model for AdmSideNavBar component.
  late AdmSideNavBarModel admSideNavBarModel;
  // Model for adminHeader component.
  late AdminHeaderModel adminHeaderModel;
  // Model for DeyeHeader component.
  late DeyeHeaderModel deyeHeaderModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - genarateCityCode] action in Button widget.
  int? len;

  @override
  void initState(BuildContext context) {
    admSideNavBarModel = createModel(context, () => AdmSideNavBarModel());
    adminHeaderModel = createModel(context, () => AdminHeaderModel());
    deyeHeaderModel = createModel(context, () => DeyeHeaderModel());
  }

  @override
  void dispose() {
    admSideNavBarModel.dispose();
    adminHeaderModel.dispose();
    deyeHeaderModel.dispose();
  }
}
