import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'children_widget.dart' show ChildrenWidget;
import 'package:flutter/material.dart';

class ChildrenModel extends FlutterFlowModel<ChildrenWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for height widget.
  FocusNode? heightFocusNode;
  TextEditingController? heightTextController;
  String? Function(BuildContext, String?)? heightTextControllerValidator;
  String? _heightTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for qua widget.
  String? quaValue;
  FormFieldController<String>? quaValueController;
  // State field(s) for wieght widget.
  FocusNode? wieghtFocusNode;
  TextEditingController? wieghtTextController;
  String? Function(BuildContext, String?)? wieghtTextControllerValidator;
  String? _wieghtTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for health widget.
  FocusNode? healthFocusNode;
  TextEditingController? healthTextController;
  String? Function(BuildContext, String?)? healthTextControllerValidator;
  // State field(s) for foodallergie widget.
  FocusNode? foodallergieFocusNode;
  TextEditingController? foodallergieTextController;
  String? Function(BuildContext, String?)? foodallergieTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    heightTextControllerValidator = _heightTextControllerValidator;
    wieghtTextControllerValidator = _wieghtTextControllerValidator;
  }

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
