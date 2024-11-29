import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/request_manager.dart';

import 'name_and_num_widget.dart' show NameAndNumWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NameAndNumModel extends FlutterFlowModel<NameAndNumWidget> {
  ///  Local state fields for this page.

  String cityy = 'دمشق';

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
      return 'قصير جدا';
    }

    return null;
  }

  // State field(s) for Num widget.
  FocusNode? numFocusNode;
  TextEditingController? numTextController;
  final numMask = MaskTextInputFormatter(mask: '# ###-###-###');
  String? Function(BuildContext, String?)? numTextControllerValidator;
  String? _numTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DropDown1 widget.
  String? dropDown1Value;
  FormFieldController<String>? dropDown1ValueController;
  // State field(s) for DropDown2 widget.
  String? dropDown2Value;
  FormFieldController<String>? dropDown2ValueController;

  /// Query cache managers for this widget.

  final _cityyyManager = FutureRequestManager<List<AreasRow>>();
  Future<List<AreasRow>> cityyy({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AreasRow>> Function() requestFn,
  }) =>
      _cityyyManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCityyyCache() => _cityyyManager.clear();
  void clearCityyyCacheKey(String? uniqueKey) =>
      _cityyyManager.clearRequest(uniqueKey);

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

    /// Dispose query cache managers for this widget.

    clearCityyyCache();
  }
}
