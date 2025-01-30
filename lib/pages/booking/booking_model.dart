import '/flutter_flow/flutter_flow_util.dart';
import '/pages/choice/choice_widget.dart';
import 'booking_widget.dart' show BookingWidget;
import 'package:flutter/material.dart';

class BookingModel extends FlutterFlowModel<BookingWidget> {
  ///  Local state fields for this page.

  String? searchText;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for choice dynamic component.
  late FlutterFlowDynamicModels<ChoiceModel> choiceModels;

  @override
  void initState(BuildContext context) {
    choiceModels = FlutterFlowDynamicModels(() => ChoiceModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    choiceModels.dispose();
  }
}
