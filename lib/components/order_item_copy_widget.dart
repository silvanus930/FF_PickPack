import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderItemCopyWidget extends StatefulWidget {
  const OrderItemCopyWidget({
    Key? key,
    this.id,
  }) : super(key: key);

  final String? id;

  @override
  _OrderItemCopyWidgetState createState() => _OrderItemCopyWidgetState();
}

class _OrderItemCopyWidgetState extends State<OrderItemCopyWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      child: InkWell(
        onTap: () async {
          setState(() {
            FFAppState().orderPickList = functions
                .setOrderFlagWithID(
                    FFAppState().orderPickList.toList(), widget.id)
                .toList();
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 80,
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
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 60,
                  icon: Icon(
                    Icons.check_circle,
                    color: functions.getOrderFlagWithID(
                            FFAppState().orderPickList.toList(), widget.id)
                        ? Color(0xFF37CB37)
                        : FlutterFlowTheme.of(context).secondaryBackground,
                    size: 40,
                  ),
                  onPressed: () async {
                    setState(() {
                      FFAppState().orderPickList = functions
                          .setOrderFlagWithID(
                              FFAppState().orderPickList.toList(), widget.id)
                          .toList();
                    });
                  },
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Text(
                              widget.id!,
                              style: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
