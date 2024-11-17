import '/flutter_flow/flutter_flow_util.dart';
import 'set_nameandnum_widget.dart' show SetNameandnumWidget;
import 'package:flutter/material.dart';

class SetNameandnumModel extends FlutterFlowModel<SetNameandnumWidget> {
  ///  State fields for stateful widgets in this page.

<<<<<<< HEAD
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

=======
>>>>>>> d61fdb86a4b696cdb22a87f725750fd5485546c7
  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
<<<<<<< HEAD
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'هذا الحقل مطلوب';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

=======
>>>>>>> d61fdb86a4b696cdb22a87f725750fd5485546c7
  // State field(s) for Num widget.
  FocusNode? numFocusNode;
  TextEditingController? numTextController;
  String? Function(BuildContext, String?)? numTextControllerValidator;
<<<<<<< HEAD
  String? _numTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'هذا الحقل مطلوب';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    numTextControllerValidator = _numTextControllerValidator;
  }
=======

  @override
  void initState(BuildContext context) {}
>>>>>>> d61fdb86a4b696cdb22a87f725750fd5485546c7

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    numFocusNode?.dispose();
    numTextController?.dispose();
  }
}
