// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddressPickerStruct extends FFFirebaseStruct {
  AddressPickerStruct({
    String? addressName,
    LatLng? addressLatLgt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _addressName = addressName,
        _addressLatLgt = addressLatLgt,
        super(firestoreUtilData);

  // "addressName" field.
  String? _addressName;
  String get addressName => _addressName ?? '';
  set addressName(String? val) => _addressName = val;
  bool hasAddressName() => _addressName != null;

  // "addressLatLgt" field.
  LatLng? _addressLatLgt;
  LatLng? get addressLatLgt => _addressLatLgt;
  set addressLatLgt(LatLng? val) => _addressLatLgt = val;
  bool hasAddressLatLgt() => _addressLatLgt != null;

  static AddressPickerStruct fromMap(Map<String, dynamic> data) =>
      AddressPickerStruct(
        addressName: data['addressName'] as String?,
        addressLatLgt: data['addressLatLgt'] as LatLng?,
      );

  static AddressPickerStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AddressPickerStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'addressName': _addressName,
        'addressLatLgt': _addressLatLgt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'addressName': serializeParam(
          _addressName,
          ParamType.String,
        ),
        'addressLatLgt': serializeParam(
          _addressLatLgt,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static AddressPickerStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddressPickerStruct(
        addressName: deserializeParam(
          data['addressName'],
          ParamType.String,
          false,
        ),
        addressLatLgt: deserializeParam(
          data['addressLatLgt'],
          ParamType.LatLng,
          false,
        ),
      );

  @override
  String toString() => 'AddressPickerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddressPickerStruct &&
        addressName == other.addressName &&
        addressLatLgt == other.addressLatLgt;
  }

  @override
  int get hashCode => const ListEquality().hash([addressName, addressLatLgt]);
}

AddressPickerStruct createAddressPickerStruct({
  String? addressName,
  LatLng? addressLatLgt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddressPickerStruct(
      addressName: addressName,
      addressLatLgt: addressLatLgt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AddressPickerStruct? updateAddressPickerStruct(
  AddressPickerStruct? addressPicker, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    addressPicker
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAddressPickerStructData(
  Map<String, dynamic> firestoreData,
  AddressPickerStruct? addressPicker,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (addressPicker == null) {
    return;
  }
  if (addressPicker.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && addressPicker.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addressPickerData =
      getAddressPickerFirestoreData(addressPicker, forFieldValue);
  final nestedData =
      addressPickerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = addressPicker.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAddressPickerFirestoreData(
  AddressPickerStruct? addressPicker, [
  bool forFieldValue = false,
]) {
  if (addressPicker == null) {
    return {};
  }
  final firestoreData = mapToFirestore(addressPicker.toMap());

  // Add any Firestore field values
  addressPicker.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddressPickerListFirestoreData(
  List<AddressPickerStruct>? addressPickers,
) =>
    addressPickers
        ?.map((e) => getAddressPickerFirestoreData(e, true))
        .toList() ??
    [];
