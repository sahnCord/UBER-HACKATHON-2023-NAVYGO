import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlacePickerModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<AddressPickerStruct> possibleAdressess = [];
  void addToPossibleAdressess(AddressPickerStruct item) =>
      possibleAdressess.add(item);
  void removeFromPossibleAdressess(AddressPickerStruct item) =>
      possibleAdressess.remove(item);
  void removeAtIndexFromPossibleAdressess(int index) =>
      possibleAdressess.removeAt(index);
  void updatePossibleAdressessAtIndex(
          int index, Function(AddressPickerStruct) updateFn) =>
      possibleAdressess[index] = updateFn(possibleAdressess[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in PlacePicker widget.
  UserLocationsRecord? userAdressesList;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Geocoding)] action in TextField widget.
  ApiCallResponse? apiResult3ik;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
