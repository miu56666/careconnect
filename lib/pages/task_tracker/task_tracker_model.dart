import '/flutter_flow/flutter_flow_util.dart';
import 'task_tracker_widget.dart' show TaskTrackerWidget;
import 'package:flutter/material.dart';

class TaskTrackerModel extends FlutterFlowModel<TaskTrackerWidget> {
  ///  Local state fields for this page.

  List<String> task = [];
  void addToTask(String item) => task.add(item);
  void removeFromTask(String item) => task.remove(item);
  void removeAtIndexFromTask(int index) => task.removeAt(index);
  void insertAtIndexInTask(int index, String item) => task.insert(index, item);
  void updateTaskAtIndex(int index, Function(String) updateFn) =>
      task[index] = updateFn(task[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
