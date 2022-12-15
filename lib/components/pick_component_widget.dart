import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PickComponentWidget extends StatefulWidget {
  const PickComponentWidget({
    Key? key,
    this.product,
    this.pickSting,
  }) : super(key: key);

  final dynamic product;
  final String? pickSting;

  @override
  _PickComponentWidgetState createState() => _PickComponentWidgetState();
}

class _PickComponentWidgetState extends State<PickComponentWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x520E151B),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: AlignmentDirectional(0, 0.050000000000000044),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                getJsonField(
                                  widget.product,
                                  r'''$.image.src''',
                                ),
                                width: 120,
                                height: 100,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      getJsonField(
                                        widget.product,
                                        r'''$.title''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                          ),
                                    ),
                                    Text(
                                      getJsonField(
                                        widget.product,
                                        r'''$.variants[0].title''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                          ),
                                    ),
                                    Text(
                                      getJsonField(
                                        widget.product,
                                        r'''$.variants[0].sku''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2,
                                    ),
                                    Text(
                                      getJsonField(
                                        widget.product,
                                        r'''$.variants[0].inventory_quantity''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              setState(() {
                                FFAppState().pickList = functions
                                    .decreaseProductNumberById(
                                        FFAppState().pickList.toList(),
                                        getJsonField(
                                          widget.product,
                                          r'''$.id''',
                                        ))
                                    .toList();
                                FFAppState().showBeginPacking =
                                    functions.getPickedNumberFromPickList(
                                            FFAppState().pickList.toList()) <=
                                        0;
                              });
                              if (widget.pickSting == 'To Pick') {
                                setState(() {
                                  FFAppState().totalPickNumber =
                                      FFAppState().totalPickNumber + 1;
                                });
                              } else {
                                setState(() {
                                  FFAppState().totalPackNumber =
                                      FFAppState().totalPackNumber + 1;
                                });
                              }
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  functions
                                      .getProductNumberByID(
                                          FFAppState().pickList.toList(),
                                          getJsonField(
                                            widget.product,
                                            r'''$.id''',
                                          ))
                                      .toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF3B8FBD),
                                        fontSize: 18,
                                      ),
                                ),
                                Text(
                                  widget.pickSting!,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF3B8FBD),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (functions.getProductNumberByID(
                        FFAppState().pickList.toList(),
                        getJsonField(
                          widget.product,
                          r'''$.id''',
                        )) <=
                    0)
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(
                      color: Color(0x63FFFFFF),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
