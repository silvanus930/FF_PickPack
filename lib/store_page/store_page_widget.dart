import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login_page/login_page_widget.dart';
import '../start_page/start_page_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StorePageWidget extends StatefulWidget {
  const StorePageWidget({Key? key}) : super(key: key);

  @override
  _StorePageWidgetState createState() => _StorePageWidgetState();
}

class _StorePageWidgetState extends State<StorePageWidget> {
  ApiCallResponse? apiResultrkq;
  TextEditingController? storeEditController;
  String? userData;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      userData = await actions.getUserDataFromLocal(
        context,
        'storeName',
      );
    });

    storeEditController = TextEditingController(text: FFAppState().storeName);
  }

  @override
  void dispose() {
    storeEditController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Stack(
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        icon: Icon(
                          Icons.chevron_left,
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                          size: 30,
                        ),
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 500),
                              reverseDuration: Duration(milliseconds: 500),
                              child: StartPageWidget(),
                            ),
                          );
                        },
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Store',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).title2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w300,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(40, 20, 40, 20),
                      child: TextFormField(
                        controller: storeEditController,
                        onChanged: (_) => EasyDebounce.debounce(
                          'storeEditController',
                          Duration(milliseconds: 100),
                          () async {
                            setState(() {
                              FFAppState().storeName =
                                  storeEditController!.text;
                            });
                          },
                        ),
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Enter your store name',
                          hintStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.italic,
                                  ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          suffixIcon: storeEditController!.text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    storeEditController?.clear();
                                    setState(() {
                                      FFAppState().storeName =
                                          storeEditController!.text;
                                    });
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic,
                            ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          FFAppState().storeName,
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                        Text(
                          '.myshopify.com',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    apiResultrkq = await IsValidDomainCall.call(
                      domain: functions
                          .getDomainFromStoreName(storeEditController!.text),
                    );
                    if (IsValidDomainCall.isValidUrl(
                      (apiResultrkq?.jsonBody ?? ''),
                    )) {
                      await actions.saveDataToLocal(
                        context,
                        'storeName',
                        storeEditController!.text,
                      );
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPageWidget(),
                        ),
                      );
                    } else {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Oops!'),
                            content: Text('Please check domain'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    }

                    setState(() {});
                  },
                  text: 'Next',
                  options: FFButtonOptions(
                    width: 200,
                    height: 50,
                    color: Color(0xFF54A8D7),
                    textStyle: GoogleFonts.getFont(
                      'Lato',
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                    elevation: 1,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
