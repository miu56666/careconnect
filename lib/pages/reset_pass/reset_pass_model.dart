import '/flutter_flow/flutter_flow_util.dart';
import 'reset_pass_widget.dart' show ResetPassWidget;
import 'package:flutter/material.dart';

class ResetPassModel extends FlutterFlowModel<ResetPassWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for sleep_time widget.
  FocusNode? sleepTimeFocusNode;
  TextEditingController? sleepTimeTextController;
  String? Function(BuildContext, String?)? sleepTimeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    sleepTimeFocusNode?.dispose();
    sleepTimeTextController?.dispose();
  }
}
