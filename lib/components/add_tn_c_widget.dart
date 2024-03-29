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
import 'add_tn_c_model.dart';
export 'add_tn_c_model.dart';

class AddTnCWidget extends StatefulWidget {
  const AddTnCWidget({super.key});

  @override
  State<AddTnCWidget> createState() => _AddTnCWidgetState();
}

class _AddTnCWidgetState extends State<AddTnCWidget> {
  late AddTnCModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddTnCModel());

    _model.textController ??= TextEditingController(
        text:
            '<h2>Terms and Conditions</h2>\n\n<h4><span style=\"font-size:14px\">&quot;INTRODUCTION :&quot;</span></h4>\n\n<p><span style=\"font-size:12px\">&nbsp;&quot;Founded in 2016, Sensible Connect Solutions Pvt. Ltd. has become a highly regarded entity involved in manufacturing and wholesaling best series of Billing Machine, POS Machine, Weighing Scale, Weighing Systems and many more. &quot;</span></p>\n\n<p><span style=\"font-size:12px\">&nbsp;&quot;These are widely acknowledged for their application specific design, accurate dimension, high performance, lightweight and durable finish standard.&quot;</span></p>\n\n<h4><span style=\"font-size:14px\">&quot;SUBSCRIPTION :&quot;</span></h4>\n\n<p><span style=\"font-size:12px\">&nbsp;&quot;To use the support &amp; services provided by the Sensible Connect Pvt Ltd you have to renew Subscription every year. Subscriptions packages and price may also vary with time.&quot;</span></p>\n\n<p><span style=\"font-size:12px\">&nbsp;&quot;If your subscription has been expiered then untill you do the payment/renew subscription, software services will be terminated&quot;</span></p>\n\n<h4><span style=\"font-size:14px\">&quot;PAYMENT :&quot;</span></h4>\n\n<p><span style=\"font-size:12px\">&nbsp;&quot;When you purchase a subscription, you must provide us with complete and accurate payment information.If we do not receive payment authorization or any authorization is subsequently cancelled, we may immediately terminate or suspend your access to your subscription.&quot;</span></p>\n\n<h4><span style=\"font-size:14px\">&quot;SERVICES :&quot;</span></h4>\n\n<p><span style=\"font-size:12px\">&nbsp;&quot;We provide you our serives &amp; support 24*7 to you. When new update is available ,it will be informed you&quot;.</span></p>\n\n<p><span style=\"font-size:12px\">@Sensible Connect Solutions Pvt Ltd. All Rights Reserved (Terms &amp; Conditins,Privarcy Policy Link)</span></p>\n');
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
          height: 650.0,
          decoration: BoxDecoration(
            color: Color(0xFFF4F3F8),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 15.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Row(
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
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineLargeFamily),
                                ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 500.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              width: 0.5,
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Html(
                                  data:
                                      '<h2>Terms and Conditions</h2>\n\n<h4><span style=\"font-size:14px\">&quot;INTRODUCTION :&quot;</span></h4>\n\n<p><span style=\"font-size:12px\">&nbsp;&quot;Founded in 2016, Sensible Connect Solutions Pvt. Ltd. has become a highly regarded entity involved in manufacturing and wholesaling best series of Billing Machine, POS Machine, Weighing Scale, Weighing Systems and many more. &quot;</span></p>\n\n<p><span style=\"font-size:12px\">&nbsp;&quot;These are widely acknowledged for their application specific design, accurate dimension, high performance, lightweight and durable finish standard.&quot;</span></p>\n\n<h4><span style=\"font-size:14px\">&quot;SUBSCRIPTION :&quot;</span></h4>\n\n<p><span style=\"font-size:12px\">&nbsp;&quot;To use the support &amp; services provided by the Sensible Connect Pvt Ltd you have to renew Subscription every year. Subscriptions packages and price may also vary with time.&quot;</span></p>\n\n<p><span style=\"font-size:12px\">&nbsp;&quot;If your subscription has been expiered then untill you do the payment/renew subscription, software services will be terminated&quot;</span></p>\n\n<h4><span style=\"font-size:14px\">&quot;PAYMENT :&quot;</span></h4>\n\n<p><span style=\"font-size:12px\">&nbsp;&quot;When you purchase a subscription, you must provide us with complete and accurate payment information.If we do not receive payment authorization or any authorization is subsequently cancelled, we may immediately terminate or suspend your access to your subscription.&quot;</span></p>\n\n<h4><span style=\"font-size:14px\">&quot;SERVICES :&quot;</span></h4>\n\n<p><span style=\"font-size:12px\">&nbsp;&quot;We provide you our serives &amp; support 24*7 to you. When new update is available ,it will be informed you&quot;.</span></p>\n\n<p><span style=\"font-size:12px\">@Sensible Connect Solutions Pvt Ltd. All Rights Reserved (Terms &amp; Conditins,Privarcy Policy Link)</span></p>\n',
                                  onLinkTap: (url, _, __, ___) =>
                                      launchURL(url!),
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
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                                  minLines: null,
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
                          var termsAndConditionsRecordReference =
                              TermsAndConditionsRecord.createDoc(
                                  FFAppState().CompanyDetailsRef!);
                          await termsAndConditionsRecordReference
                              .set(createTermsAndConditionsRecordData(
                            contains: _model.textController.text,
                          ));
                          _model.docRef =
                              TermsAndConditionsRecord.getDocumentFromData(
                                  createTermsAndConditionsRecordData(
                                    contains: _model.textController.text,
                                  ),
                                  termsAndConditionsRecordReference);
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                child: AlertDialog(
                                  title: Text('Create'),
                                  content: Text('Term And Conditions Created'),
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
                              .update(createTermsAndConditionsRecordData(
                            id: functions.getDocIdFromDocRefTnC(
                                _model.docRef?.reference),
                          ));

                          context.pushNamed('termsNconditions');

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
