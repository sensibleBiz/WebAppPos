import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'add_contact_us_model.dart';
export 'add_contact_us_model.dart';

class AddContactUsWidget extends StatefulWidget {
  const AddContactUsWidget({super.key});

  @override
  State<AddContactUsWidget> createState() => _AddContactUsWidgetState();
}

class _AddContactUsWidgetState extends State<AddContactUsWidget> {
  late AddContactUsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddContactUsModel());

    _model.textController ??= TextEditingController(
        text:
            '<h1><span style=\"font-size:18px\">Contact Us :</span></h1>\n\n<h4><span style=\"font-size:14px\">Contact Person:</span> <span style=\"font-size:12px\">Amrut Nerlikar (Founder)</span><br />\n<span style=\"font-size:14px\">Contact Numbers:</span> <strong><span style=\"font-size:12px\"><span style=\"color:#2c3e50\">+91-9561673253</span> ,<span style=\"color:#2c3e50\">+91-8669695333</span></span></strong></h4>\n\n<h3><span style=\"font-size:14px\">Address : </span></h3>\n\n<h4><span style=\"font-size:12px\">&nbsp; &nbsp; &nbsp; 4 Anand Complex Alkapuri Society,<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opposite Kinara Hotel Near Vanaz Factory<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Paud Road<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Kothrud<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Pune, Maharashtra 411038<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; India</span></h4>\n\n<h4><span style=\"font-size:14px\">Website :&nbsp;&nbsp;</span><span style=\"color:#2c3e50\"><strong> <span style=\"font-size:12px\">https://www.sensibleconnect.com</span></strong></span></h4>');
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 500.0,
          height: 450.0,
          decoration: BoxDecoration(
            color: Color(0xFFF4F3F8),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 15.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Company Details',
                      style:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineLargeFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineLargeFamily),
                              ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 300.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            width: 0.5,
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Html(
                                data:
                                    '<h1><span style=\"font-size:18px\">Contact Us :</span></h1>\n\n<h4><span style=\"font-size:14px\">Contact Person:</span> <span style=\"font-size:12px\">Amrut Nerlikar (Founder)</span><br />\n<span style=\"font-size:14px\">Contact Numbers:</span> <strong><span style=\"font-size:12px\"><span style=\"color:#2c3e50\">+91-9561673253</span> ,<span style=\"color:#2c3e50\">+91-8669695333</span></span></strong></h4>\n\n<h3><span style=\"font-size:14px\">Address : </span></h3>\n\n<h4><span style=\"font-size:12px\">&nbsp; &nbsp; &nbsp; 4 Anand Complex Alkapuri Society,<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opposite Kinara Hotel Near Vanaz Factory<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Paud Road<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Kothrud<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Pune, Maharashtra 411038<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; India</span></h4>\n\n<h4><span style=\"font-size:14px\">Website :&nbsp;&nbsp;</span><span style=\"color:#2c3e50\"><strong> <span style=\"font-size:12px\">https://www.sensibleconnect.com</span></strong></span></h4>',
                                onLinkTap: (url, _, __) => launchURL(url!),
                              ),
                              TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodySmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 200.0,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).secondaryText,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Cancel',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lora',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey('Lora'),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          var contactUsRecordReference =
                              ContactUsRecord.createDoc(
                                  FFAppState().CompanyDetailsRef!);
                          await contactUsRecordReference
                              .set(createContactUsRecordData(
                            contains: _model.textController.text,
                          ));
                          _model.docRef = ContactUsRecord.getDocumentFromData(
                              createContactUsRecordData(
                                contains: _model.textController.text,
                              ),
                              contactUsRecordReference);
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                child: AlertDialog(
                                  title: Text('Create'),
                                  content: Text('Contact Us Created'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );

                          await _model.docRef!.reference
                              .update(createContactUsRecordData(
                            id: functions.getDocIdFromDocRefContactUs(
                                _model.docRef?.reference),
                          ));

                          context.pushNamed('ContactUsNew');

                          setState(() {});
                        },
                        child: Container(
                          width: 200.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                FlutterFlowTheme.of(context).tertiary,
                                FlutterFlowTheme.of(context).primary
                              ],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(-0.02, -1.0),
                              end: AlignmentDirectional(0.02, 1.0),
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Save',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lora',
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey('Lora'),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
