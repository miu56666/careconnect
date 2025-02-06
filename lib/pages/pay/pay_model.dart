import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'pay_widget.dart' show PayWidget;
import 'package:flutter/material.dart';

class PayModel extends FlutterFlowModel<PayWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for name widget.
  FocusNode? nameFocusNode1;
  TextEditingController? nameTextController1;
  String? Function(BuildContext, String?)? nameTextController1Validator;
  // State field(s) for name widget.
  FocusNode? nameFocusNode2;
  TextEditingController? nameTextController2;
  String? Function(BuildContext, String?)? nameTextController2Validator;
  // State field(s) for name widget.
  FocusNode? nameFocusNode3;
  TextEditingController? nameTextController3;
  String? Function(BuildContext, String?)? nameTextController3Validator;
  // State field(s) for name widget.
  FocusNode? nameFocusNode4;
  TextEditingController? nameTextController4;
  String? Function(BuildContext, String?)? nameTextController4Validator;
  // State field(s) for name widget.
  FocusNode? nameFocusNode5;
  TextEditingController? nameTextController5;
  String? Function(BuildContext, String?)? nameTextController5Validator;
  // State field(s) for name widget.
  FocusNode? nameFocusNode6;
  TextEditingController? nameTextController6;
  String? Function(BuildContext, String?)? nameTextController6Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode1?.dispose();
    nameTextController1?.dispose();

    nameFocusNode2?.dispose();
    nameTextController2?.dispose();

    nameFocusNode3?.dispose();
    nameTextController3?.dispose();

    nameFocusNode4?.dispose();
    nameTextController4?.dispose();

    nameFocusNode5?.dispose();
    nameTextController5?.dispose();

    nameFocusNode6?.dispose();
    nameTextController6?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
