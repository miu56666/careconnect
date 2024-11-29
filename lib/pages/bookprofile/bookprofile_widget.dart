import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bookprofile_model.dart';
export 'bookprofile_model.dart';

class BookprofileWidget extends StatefulWidget {
  const BookprofileWidget({
    super.key,
    required this.profile,
  });

  final DigitallibraryRow? profile;

  @override
  State<BookprofileWidget> createState() => _BookprofileWidgetState();
}

class _BookprofileWidgetState extends State<BookprofileWidget> {
  late BookprofileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookprofileModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 1000.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/cw7mi_.jpg',
                    ).image,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24.0),
                            child: Image.network(
                              valueOrDefault<String>(
                                widget.profile?.imageLink,
                                'مسار الصورة',
                              ),
                              width: 148.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.profile?.contentName,
                            'الاسم',
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Almarai',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).accent1,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 12.0, 8.0, 12.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.profile?.type,
                                  'تايب',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondary,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 12.0, 8.0, 12.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.profile?.ageGroup,
                                  'العمر',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          if (FFAppState()
                                  .favourite
                                  .contains(DigitalLibraryStruct(
                                    id: widget.profile?.id,
                                    contentName: widget.profile?.contentName,
                                    type: widget.profile?.type,
                                    ageGroup: widget.profile?.ageGroup,
                                    additionDate: widget.profile?.additionDate,
                                    contentDescption:
                                        widget.profile?.contentDescription,
                                    imgLink: widget.profile?.imageLink,
                                    link: widget.profile?.links,
                                  )) ==
                              false)
                            FlutterFlowIconButton(
                              borderColor: const Color(0x5D020202),
                              borderRadius: 25.0,
                              buttonSize: 40.0,
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Color(0xFFD01316),
                                size: 24.0,
                              ),
                              onPressed: () async {
                                FFAppState()
                                    .addToFavourite(DigitalLibraryStruct(
                                  id: widget.profile?.id,
                                  contentName: widget.profile?.contentName,
                                  type: widget.profile?.type,
                                  ageGroup: widget.profile?.ageGroup,
                                  additionDate: widget.profile?.additionDate,
                                  contentDescption:
                                      widget.profile?.contentDescription,
                                  imgLink: widget.profile?.imageLink,
                                  link: widget.profile?.links,
                                ));
                                safeSetState(() {});
                              },
                            ),
                          if (FFAppState()
                                  .favourite
                                  .contains(DigitalLibraryStruct(
                                    id: widget.profile?.id,
                                    contentName: widget.profile?.contentName,
                                    type: widget.profile?.type,
                                    ageGroup: widget.profile?.ageGroup,
                                    additionDate: widget.profile?.additionDate,
                                    contentDescption:
                                        widget.profile?.contentDescription,
                                    imgLink: widget.profile?.imageLink,
                                    link: widget.profile?.links,
                                  )) ==
                              true)
                            FlutterFlowIconButton(
                              borderColor: const Color(0x5D020202),
                              borderRadius: 25.0,
                              buttonSize: 40.0,
                              icon: const Icon(
                                Icons.favorite_rounded,
                                color: Color(0xFFCE0F0F),
                                size: 24.0,
                              ),
                              onPressed: () async {
                                FFAppState()
                                    .removeFromFavourite(DigitalLibraryStruct(
                                  id: widget.profile?.id,
                                  contentName: widget.profile?.contentName,
                                  type: widget.profile?.type,
                                  ageGroup: widget.profile?.ageGroup,
                                  additionDate: widget.profile?.additionDate,
                                  contentDescption:
                                      widget.profile?.contentDescription,
                                  imgLink: widget.profile?.imageLink,
                                  link: widget.profile?.links,
                                ));
                                safeSetState(() {});
                              },
                            ),
                        ].divide(const SizedBox(width: 12.0)),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(1.0, -1.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.profile?.additionDate?.toString(),
                            'تاريخ النشر',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'Inter',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(1.0, -1.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.profile?.contentDescription,
                            'الوصف',
                          ),
                          textAlign: TextAlign.end,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 50.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await launchURL(valueOrDefault<String>(
                                widget.profile?.links,
                                'url',
                              ));
                            },
                            text: 'تصفح',
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              height: 56.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0x946095C6),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Almarai',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 2.0,
                              borderRadius: BorderRadius.circular(28.0),
                            ),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(height: 20.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
