import '/backend/schema/structs/index.dart';

class SetUsersRouteCloudFunctionCallResponse {
  SetUsersRouteCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
}
