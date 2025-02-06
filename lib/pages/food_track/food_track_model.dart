import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'food_track_widget.dart' show FoodTrackWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodTrackModel extends FlutterFlowModel<FoodTrackWidget> {
  ///  Local state fields for this page.

  double? mealnum;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for meal widget.
  FocusNode? mealFocusNode;
  TextEditingController? mealTextController;
  String? Function(BuildContext, String?)? mealTextControllerValidator;
  String? _mealTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for mealquantity widget.
  FocusNode? mealquantityFocusNode;
  TextEditingController? mealquantityTextController;
  String? Function(BuildContext, String?)? mealquantityTextControllerValidator;
  String? _mealquantityTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  DateTime? datePicked;
  Completer<List<MealtrackingRow>>? requestCompleter;

  @override
  void initState(BuildContext context) {
    mealTextControllerValidator = _mealTextControllerValidator;
    mealquantityTextControllerValidator = _mealquantityTextControllerValidator;
  }

  @override
  void dispose() {
    mealFocusNode?.dispose();
    mealTextController?.dispose();

    mealquantityFocusNode?.dispose();
    mealquantityTextController?.dispose();
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
