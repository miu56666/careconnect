import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'almoa3ed_widget.dart' show Almoa3edWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class Almoa3edModel extends FlutterFlowModel<Almoa3edWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for doctor_name widget.
  FocusNode? doctorNameFocusNode;
  TextEditingController? doctorNameTextController;
  String? Function(BuildContext, String?)? doctorNameTextControllerValidator;
  String? _doctorNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'هذا الحقل مطلوب';
    }

    return null;
  }

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for location widget.
  FocusNode? locationFocusNode;
  TextEditingController? locationTextController;
  String? Function(BuildContext, String?)? locationTextControllerValidator;
  String? _locationTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'هذا الحقل مطلوب';
    }

    return null;
  }

  // State field(s) for purpose widget.
  FocusNode? purposeFocusNode;
  TextEditingController? purposeTextController;
  String? Function(BuildContext, String?)? purposeTextControllerValidator;
  String? _purposeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'هذا الحقل مطلوب';
    }

    return null;
  }

  Completer<List<MedicalappointmentsRow>>? requestCompleter;

  @override
  void initState(BuildContext context) {
    doctorNameTextControllerValidator = _doctorNameTextControllerValidator;
    locationTextControllerValidator = _locationTextControllerValidator;
    purposeTextControllerValidator = _purposeTextControllerValidator;
  }

  @override
  void dispose() {
    doctorNameFocusNode?.dispose();
    doctorNameTextController?.dispose();

    locationFocusNode?.dispose();
    locationTextController?.dispose();

    purposeFocusNode?.dispose();
    purposeTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
