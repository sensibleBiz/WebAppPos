import '/backend/backend.dart';
import '/deye_c_r_m/deye_header/deye_header_widget.dart';
import '/deye_c_r_m/deye_menu/deye_menu_widget.dart';
import '/deye_c_r_m/deye_no_data/deye_no_data_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/custom_date_range/custom_date_range_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'delete_lead_report_widget.dart' show DeleteLeadReportWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DeleteLeadReportModel extends FlutterFlowModel<DeleteLeadReportWidget> {
  ///  Local state fields for this page.

  bool isSearched = false;

  List<String> selectedZone = [];
  void addToSelectedZone(String item) => selectedZone.add(item);
  void removeFromSelectedZone(String item) => selectedZone.remove(item);
  void removeAtIndexFromSelectedZone(int index) => selectedZone.removeAt(index);
  void insertAtIndexInSelectedZone(int index, String item) =>
      selectedZone.insert(index, item);
  void updateSelectedZoneAtIndex(int index, Function(String) updateFn) =>
      selectedZone[index] = updateFn(selectedZone[index]);

  ///  State fields for stateful widgets in this page.

  // Model for DeyeHeader component.
  late DeyeHeaderModel deyeHeaderModel;
  // State field(s) for DropDownZoneAll widget.
  String? dropDownZoneAllValue;
  FormFieldController<String>? dropDownZoneAllValueController;
  // State field(s) for DropDownRemarkAll widget.
  String? dropDownRemarkAllValue;
  FormFieldController<String>? dropDownRemarkAllValueController;
  // State field(s) for DropDownSolutionAll widget.
  String? dropDownSolutionAllValue;
  FormFieldController<String>? dropDownSolutionAllValueController;
  // State field(s) for DropDownAll widget.
  String? dropDownAllValue;
  FormFieldController<String>? dropDownAllValueController;
  // State field(s) for TextFieldAll widget.
  FocusNode? textFieldAllFocusNode;
  TextEditingController? textFieldAllTextController;
  String? Function(BuildContext, String?)? textFieldAllTextControllerValidator;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, OutletLeadsRecord>?
      listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // Model for DeyeMenu component.
  late DeyeMenuModel deyeMenuModel;

  @override
  void initState(BuildContext context) {
    deyeHeaderModel = createModel(context, () => DeyeHeaderModel());
    deyeMenuModel = createModel(context, () => DeyeMenuModel());
  }

  @override
  void dispose() {
    deyeHeaderModel.dispose();
    textFieldAllFocusNode?.dispose();
    textFieldAllTextController?.dispose();

    listViewStreamSubscriptions.forEach((s) => s?.cancel());
    listViewPagingController?.dispose();

    deyeMenuModel.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, OutletLeadsRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, OutletLeadsRecord>
      _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, OutletLeadsRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryOutletLeadsRecordPage(
          parent: parent,
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 20,
          isStream: true,
        ),
      );
  }
}
