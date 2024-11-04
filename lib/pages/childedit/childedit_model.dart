import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'childedit_widget.dart' show ChildeditWidget;
import 'package:flutter/material.dart';

class ChildeditModel extends FlutterFlowModel<ChildeditWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for height widget.
  FocusNode? heightFocusNode;
  TextEditingController? heightTextController;
  String? Function(BuildContext, String?)? heightTextControllerValidator;
  // State field(s) for qua widget.
  String? quaValue;
  FormFieldController<String>? quaValueController;
  // State field(s) for wieght widget.
  FocusNode? wieghtFocusNode;
  TextEditingController? wieghtTextController;
  String? Function(BuildContext, String?)? wieghtTextControllerValidator;
  // State field(s) for health widget.
  FocusNode? healthFocusNode;
  TextEditingController? healthTextController;
  String? Function(BuildContext, String?)? healthTextControllerValidator;
  // State field(s) for foodallergie widget.
  FocusNode? foodallergieFocusNode;
  TextEditingController? foodallergieTextController;
  String? Function(BuildContext, String?)? foodallergieTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    heightFocusNode?.dispose();
    heightTextController?.dispose();

    wieghtFocusNode?.dispose();
    wieghtTextController?.dispose();

    healthFocusNode?.dispose();
    healthTextController?.dispose();

    foodallergieFocusNode?.dispose();
    foodallergieTextController?.dispose();
  }
}
