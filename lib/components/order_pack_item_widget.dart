import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../pack_list_page/pack_list_page_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderPackItemWidget extends StatefulWidget {
  const OrderPackItemWidget({
    Key? key,
    this.order,
  }) : super(key: key);

  final dynamic order;

  @override
  _OrderPackItemWidgetState createState() => _OrderPackItemWidgetState();
}

class _OrderPackItemWidgetState extends State<OrderPackItemWidget> {
  ApiCallResponse? apiResultgzu;

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
      child: Container(
        width: double.infinity,
        height: 100,
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
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Text(
                              getJsonField(
                                widget.order,
                                r'''$.name''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Text(
                              functions.stringToDate(getJsonField(
                                widget.order,
                                r'''$.created_at''',
                              ).toString()),
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            getJsonField(
                              widget.order,
                              r'''$.customer.first_name''',
                            ).toString(),
                            style:
                                FlutterFlowTheme.of(context).subtitle1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                    ),
                          ),
                          Text(
                            getJsonField(
                              widget.order,
                              r'''$.customer.last_name''',
                            ).toString(),
                            style:
                                FlutterFlowTheme.of(context).subtitle1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                    ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 100,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Color(0xFFFEEF23),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  'Unfulfiled',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Container(
                                width: 60,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Text(
                                    'Paid',
                                    textAlign: TextAlign.center,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 50,
                icon: Icon(
                  Icons.navigate_next_sharp,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30,
                ),
                showLoadingIndicator: true,
                onPressed: () async {
                  apiResultgzu = await GetProductsByIdsCall.call(
                    ids: functions.getProductListFromOrder(widget.order!),
                  );
                  if ((apiResultgzu?.succeeded ?? true)) {
                    setState(() {
                      FFAppState().pickList = GetProductsByIdsCall.products(
                        (apiResultgzu?.jsonBody ?? ''),
                      ).toList();
                    });
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.bottomToTop,
                        duration: Duration(milliseconds: 1000),
                        reverseDuration: Duration(milliseconds: 1000),
                        child: PackListPageWidget(
                          order: widget.order,
                        ),
                      ),
                    );
                  }

                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
