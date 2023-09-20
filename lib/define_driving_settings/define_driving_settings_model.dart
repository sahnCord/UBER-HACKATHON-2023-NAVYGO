import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/set_time_to_wait/set_time_to_wait_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DefineDrivingSettingsModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  NoWaitTimeStruct? noWaitTimeVar;
  void updateNoWaitTimeVarStruct(Function(NoWaitTimeStruct) updateFn) =>
      updateFn(noWaitTimeVar ??= NoWaitTimeStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for SwitchUberX widget.
  bool? switchUberXValue;
  // State field(s) for SwitchRS widget.
  bool? switchRSValue;
  // State field(s) for SwitchPT widget.
  bool? switchPTValue;
  // State field(s) for SwitchWaitTime widget.
  bool? switchWaitTimeValue;
  // State field(s) for SwitchArrivalTime widget.
  bool? switchArrivalTimeValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
