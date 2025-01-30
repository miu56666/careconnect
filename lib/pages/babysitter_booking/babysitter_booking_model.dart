import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'babysitter_booking_widget.dart' show BabysitterBookingWidget;
import 'package:flutter/material.dart';

class BabysitterBookingModel extends FlutterFlowModel<BabysitterBookingWidget> {
  ///  Local state fields for this page.

  double hours = 0.0;

  ///  State fields for stateful widgets in this page.

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Custom Action - getDayName] action in Button widget.
  String? day;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<BookingsRow>? bookings;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  BookingsRow? book;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
