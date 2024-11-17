import '/flutter_flow/flutter_flow_util.dart';
import 'name_and_num_widget.dart' show NameAndNumWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NameAndNumModel extends FlutterFlowModel<NameAndNumWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'الاسم قصير جدا';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // State field(s) for Num widget.
  FocusNode? numFocusNode;
  TextEditingController? numTextController;
  final numMask = MaskTextInputFormatter(mask: '+963 ###-###-###');
  String? Function(BuildContext, String?)? numTextControllerValidator;
  String? _numTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    numTextControllerValidator = _numTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    numFocusNode?.dispose();
    numTextController?.dispose();
  }
}
