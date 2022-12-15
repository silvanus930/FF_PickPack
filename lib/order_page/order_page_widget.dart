import '../backend/api_requests/api_calls.dart';
import '../components/order_item_pack_widget.dart';
import '../components/order_item_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../pick_list_page/pick_list_page_widget.dart';
import '../profile_page/profile_page_widget.dart';
import '../store_page/store_page_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderPageWidget extends StatefulWidget {
  const OrderPageWidget({Key? key}) : super(key: key);

  @override
  _OrderPageWidgetState createState() => _OrderPageWidgetState();
}

class _OrderPageWidgetState extends State<OrderPageWidget> {
  ApiCallResponse? apiResult3e4;
  ApiCallResponse? apiResultljd;
  TextEditingController? search1Controller;
  TextEditingController? search2Controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().searchString = '';
        FFAppState().isSorting = false;
        FFAppState().orderPickList = functions
            .sortOrderListWidtIndex(FFAppState().orderPickList.toList(),
                FFAppState().isSorting, FFAppState().searchString)
            .toList();
      });
    });

    search1Controller = TextEditingController();
    search2Controller = TextEditingController();
  }

  @override
  void dispose() {
    search1Controller?.dispose();
    search2Controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.topToBottom,
                                          duration:
                                              Duration(milliseconds: 1000),
                                          reverseDuration:
                                              Duration(milliseconds: 1000),
                                          child: StorePageWidget(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Home',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .title2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  'Orders',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProfilePageWidget(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Profile',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .title2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
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
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: DefaultTabController(
                        length: 2,
                        initialIndex: 0,
                        child: Column(
                          children: [
                            TabBar(
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodyText1,
                              indicatorColor:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              tabs: [
                                Tab(
                                  text: functions.getButtonString(
                                      true, FFAppState().totalPickNumber),
                                ),
                                Tab(
                                  text: functions.getButtonString(
                                      false, FFAppState().totalPackNumber),
                                ),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 0, 0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.9,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(5,
                                                                      5, 5, 5),
                                                          child: TextFormField(
                                                            controller:
                                                                search1Controller,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              'search1Controller',
                                                              Duration(
                                                                  milliseconds:
                                                                      50),
                                                              () async {
                                                                setState(() {
                                                                  FFAppState()
                                                                          .searchString =
                                                                      search1Controller!
                                                                          .text;
                                                                });
                                                              },
                                                            ),
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'Search',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            16,
                                                                      ),
                                                              enabledBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                ),
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                ),
                                                              ),
                                                              errorBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                ),
                                                              ),
                                                              focusedErrorBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                ),
                                                              ),
                                                              prefixIcon: Icon(
                                                                Icons.search,
                                                                size: 22,
                                                              ),
                                                              suffixIcon:
                                                                  search1Controller!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            search1Controller?.clear();
                                                                            setState(() {
                                                                              FFAppState().searchString = search1Controller!.text;
                                                                            });
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.clear,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                22,
                                                                          ),
                                                                        )
                                                                      : null,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 20,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30,
                                                borderWidth: 1,
                                                buttonSize: 40,
                                                icon: FaIcon(
                                                  FontAwesomeIcons
                                                      .sortAmountDown,
                                                  color: FFAppState().isSorting
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryColor
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  size: 20,
                                                ),
                                                onPressed: () async {
                                                  setState(() {
                                                    FFAppState().isSorting =
                                                        !FFAppState().isSorting;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 52, 0, 0),
                                        child: Builder(
                                          builder: (context) {
                                            final getPickOrders = functions
                                                .sortOrderListWidtIndex(
                                                    FFAppState()
                                                        .orderPickList
                                                        .toList(),
                                                    FFAppState().isSorting,
                                                    FFAppState().searchString)
                                                .toList();
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: getPickOrders.length,
                                              itemBuilder: (context,
                                                  getPickOrdersIndex) {
                                                final getPickOrdersItem =
                                                    getPickOrders[
                                                        getPickOrdersIndex];
                                                return OrderItemWidget(
                                                  key: Key(
                                                      'OrderItem_${getPickOrdersIndex}'),
                                                  id: getJsonField(
                                                    getPickOrdersItem,
                                                    r'''$.name''',
                                                  ).toString(),
                                                  createdDate: getJsonField(
                                                    getPickOrdersItem,
                                                    r'''$.created_at''',
                                                  ).toString(),
                                                  price: getJsonField(
                                                    getPickOrdersItem,
                                                    r'''$.current_subtotal_price''',
                                                  ).toString(),
                                                  firstName: getJsonField(
                                                    getPickOrdersItem,
                                                    r'''$.customer.first_name''',
                                                  ).toString(),
                                                  note: getJsonField(
                                                    getPickOrdersItem,
                                                    r'''$.note''',
                                                  ).toString(),
                                                  currency: getJsonField(
                                                    getPickOrdersItem,
                                                    r'''$.currency''',
                                                  ).toString(),
                                                  lastName: getJsonField(
                                                    getPickOrdersItem,
                                                    r'''$.customer.last_name''',
                                                  ).toString(),
                                                  isClicked: false,
                                                  tag: functions
                                                      .spiltTagToTags(
                                                          getJsonField(
                                                        getPickOrdersItem,
                                                        r'''$.tags''',
                                                      ).toString())
                                                      ?.toList(),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 0, 0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.9,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(5,
                                                                      5, 5, 5),
                                                          child: TextFormField(
                                                            controller:
                                                                search2Controller,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              'search2Controller',
                                                              Duration(
                                                                  milliseconds:
                                                                      100),
                                                              () async {
                                                                setState(() {
                                                                  FFAppState()
                                                                          .searchStringPack =
                                                                      search2Controller!
                                                                          .text;
                                                                });
                                                              },
                                                            ),
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'Search',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            16,
                                                                      ),
                                                              enabledBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                ),
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                ),
                                                              ),
                                                              errorBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                ),
                                                              ),
                                                              focusedErrorBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                ),
                                                              ),
                                                              prefixIcon: Icon(
                                                                Icons.search,
                                                                size: 22,
                                                              ),
                                                              suffixIcon:
                                                                  search2Controller!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            search2Controller?.clear();
                                                                            setState(() {
                                                                              FFAppState().searchStringPack = search2Controller!.text;
                                                                            });
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.clear,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                22,
                                                                          ),
                                                                        )
                                                                      : null,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontSize: 20,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 10, 0),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30,
                                                borderWidth: 1,
                                                buttonSize: 40,
                                                icon: FaIcon(
                                                  FontAwesomeIcons
                                                      .sortAmountDown,
                                                  color: FFAppState().isSorting
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryColor
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  size: 20,
                                                ),
                                                onPressed: () async {
                                                  setState(() {
                                                    FFAppState().isSorting =
                                                        !FFAppState().isSorting;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 52, 0, 0),
                                        child: Builder(
                                          builder: (context) {
                                            final getPackOrders = functions
                                                .sortOrderListWidtIndex(
                                                    FFAppState()
                                                        .orderPackList
                                                        .toList(),
                                                    FFAppState().isSorting,
                                                    FFAppState()
                                                        .searchStringPack)
                                                .toList();
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: getPackOrders.length,
                                              itemBuilder: (context,
                                                  getPackOrdersIndex) {
                                                final getPackOrdersItem =
                                                    getPackOrders[
                                                        getPackOrdersIndex];
                                                return OrderItemPackWidget(
                                                  key: Key(
                                                      'OrderItemPack_${getPackOrdersIndex}'),
                                                  id: getJsonField(
                                                    getPackOrdersItem,
                                                    r'''$.name''',
                                                  ).toString(),
                                                  createdDate: getJsonField(
                                                    getPackOrdersItem,
                                                    r'''$.created_at''',
                                                  ).toString(),
                                                  price: getJsonField(
                                                    getPackOrdersItem,
                                                    r'''$.current_subtotal_price''',
                                                  ).toString(),
                                                  firstName: getJsonField(
                                                    getPackOrdersItem,
                                                    r'''$.customer.first_name''',
                                                  ).toString(),
                                                  note: getJsonField(
                                                    getPackOrdersItem,
                                                    r'''$.note''',
                                                  ).toString(),
                                                  currency: getJsonField(
                                                    getPackOrdersItem,
                                                    r'''$.currency''',
                                                  ).toString(),
                                                  lastName: getJsonField(
                                                    getPackOrdersItem,
                                                    r'''$.customer.last_name''',
                                                  ).toString(),
                                                  isClicked: false,
                                                  tag: functions
                                                      .spiltTagToTags(
                                                          getJsonField(
                                                        getPackOrdersItem,
                                                        r'''$.tags''',
                                                      ).toString())
                                                      ?.toList(),
                                                );
                                              },
                                            );
                                          },
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
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 1,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 50,
                                  fillColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  icon: Icon(
                                    Icons.refresh,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 30,
                                  ),
                                  showLoadingIndicator: true,
                                  onPressed: () async {
                                    apiResultljd = await GetOrdersCall.call();
                                    if ((apiResultljd?.succeeded ?? true)) {
                                      setState(() {
                                        FFAppState().orderPackList =
                                            GetOrdersCall.packOrders(
                                          (apiResultljd?.jsonBody ?? ''),
                                        ).toList();
                                        FFAppState().totalPickNumber =
                                            GetOrdersCall.pickCount(
                                          (apiResultljd?.jsonBody ?? ''),
                                        );
                                        FFAppState().totalPackNumber =
                                            GetOrdersCall.packCount(
                                          (apiResultljd?.jsonBody ?? ''),
                                        );
                                        FFAppState().orderPickList =
                                            GetOrdersCall.pickOrders(
                                          (apiResultljd?.jsonBody ?? ''),
                                        ).toList();
                                      });
                                    }

                                    setState(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              if (functions
                                      .getSelectedOrderList(
                                          FFAppState().orderPickList.toList())
                                      .length >
                                  0) {
                                apiResult3e4 = await GetProductsByIdsCall.call(
                                  ids: functions.getProductIDs(
                                      FFAppState().orderPickList.toList()),
                                );
                                if ((apiResult3e4?.succeeded ?? true)) {
                                  setState(() {
                                    FFAppState().pickList =
                                        GetProductsByIdsCall.products(
                                      (apiResult3e4?.jsonBody ?? ''),
                                    ).toList();
                                  });
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.bottomToTop,
                                      duration: Duration(milliseconds: 1000),
                                      reverseDuration:
                                          Duration(milliseconds: 1000),
                                      child: PickListPageWidget(),
                                    ),
                                  );
                                }
                              }

                              setState(() {});
                            },
                            text: 'Create Pick List',
                            options: FFButtonOptions(
                              height: 50,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
