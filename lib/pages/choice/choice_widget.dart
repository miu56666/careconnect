import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'choice_model.dart';
export 'choice_model.dart';

/// chip chip
class ChoiceWidget extends StatefulWidget {
  const ChoiceWidget({
    super.key,
    this.parameter1,
  });

  final List<String>? parameter1;

  @override
  State<ChoiceWidget> createState() => _ChoiceWidgetState();
}

class _ChoiceWidgetState extends State<ChoiceWidget> {
  late ChoiceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChoiceModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowChoiceChips(
      options: widget.parameter1!.map((label) => ChipData(label)).toList(),
      onChanged: (true || false)
          ? null
          : (val) =>
              safeSetState(() => _model.choiceChipsValue = val?.firstOrNull),
      selectedChipStyle: ChipStyle(
        backgroundColor: const Color(0x00000000),
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Inter',
              color: FlutterFlowTheme.of(context).info,
              letterSpacing: 0.0,
            ),
        iconColor: const Color(0x00000000),
        iconSize: 18.0,
        labelPadding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
        elevation: 0.0,
        borderRadius: BorderRadius.circular(8.0),
      ),
      unselectedChipStyle: ChipStyle(
        backgroundColor: Colors.transparent,
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Inter',
              color: const Color(0xFF0C0D0D),
              fontSize: 12.0,
              letterSpacing: 0.0,
            ),
        iconColor: FlutterFlowTheme.of(context).alternate,
        iconSize: 18.0,
        labelPadding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
        elevation: 0.0,
        borderColor: FlutterFlowTheme.of(context).primaryText,
        borderRadius: BorderRadius.circular(8.0),
      ),
      chipSpacing: 2.0,
      rowSpacing: 1.0,
      multiselect: false,
      alignment: WrapAlignment.start,
      controller: _model.choiceChipsValueController ??=
          FormFieldController<List<String>>(
        [],
      ),
      disabledColor: FlutterFlowTheme.of(context).primaryBackground,
      wrapped: true,
    );
  }
}
