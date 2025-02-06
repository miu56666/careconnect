import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'babysitter_reviews_widget.dart' show BabysitterReviewsWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class BabysitterReviewsModel extends FlutterFlowModel<BabysitterReviewsWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentTextController;
  String? Function(BuildContext, String?)? commentTextControllerValidator;
  String? _commentTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'comment is required';
    }

    if (val.isEmpty) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // Stores action output result for [Custom Action - checkForBadWords] action in Icon widget.
  bool? checkFor;
  Completer<List<ReviewsRow>>? requestCompleter;

  @override
  void initState(BuildContext context) {
    commentTextControllerValidator = _commentTextControllerValidator;
  }

  @override
  void dispose() {
    commentFocusNode?.dispose();
    commentTextController?.dispose();
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
