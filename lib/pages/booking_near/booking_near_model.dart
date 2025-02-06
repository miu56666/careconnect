import '/flutter_flow/flutter_flow_util.dart';
import '/pages/choice/choice_widget.dart';
import 'booking_near_widget.dart' show BookingNearWidget;
import 'package:flutter/material.dart';

class BookingNearModel extends FlutterFlowModel<BookingNearWidget> {
  ///  Local state fields for this page.

  String? searchText;

  ///  State fields for stateful widgets in this page.

  // Models for choice dynamic component.
  late FlutterFlowDynamicModels<ChoiceModel> choiceModels;

  @override
  void initState(BuildContext context) {
    choiceModels = FlutterFlowDynamicModels(() => ChoiceModel());
  }

  @override
  void dispose() {
    choiceModels.dispose();
  }
}
