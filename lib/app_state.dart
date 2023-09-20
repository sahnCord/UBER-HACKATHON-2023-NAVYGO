import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _orderRef = prefs.getString('ff_orderRef')?.ref ?? _orderRef;
    });
    _safeInit(() {
      _origin = _latLngFromString(prefs.getString('ff_origin')) ?? _origin;
    });
    _safeInit(() {
      _destination =
          _latLngFromString(prefs.getString('ff_destination')) ?? _destination;
    });
    _safeInit(() {
      _allowRidesharing =
          prefs.getBool('ff_allowRidesharing') ?? _allowRidesharing;
    });
    _safeInit(() {
      _UsePublicTransportation = prefs.getBool('ff_UsePublicTransportation') ??
          _UsePublicTransportation;
    });
    _safeInit(() {
      _onlyUberXNavigation =
          prefs.getBool('ff_onlyUberXNavigation') ?? _onlyUberXNavigation;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DocumentReference? _orderRef;
  DocumentReference? get orderRef => _orderRef;
  set orderRef(DocumentReference? _value) {
    _orderRef = _value;
    _value != null
        ? prefs.setString('ff_orderRef', _value.path)
        : prefs.remove('ff_orderRef');
  }

  LatLng? _origin;
  LatLng? get origin => _origin;
  set origin(LatLng? _value) {
    _origin = _value;
    _value != null
        ? prefs.setString('ff_origin', _value.serialize())
        : prefs.remove('ff_origin');
  }

  LatLng? _destination;
  LatLng? get destination => _destination;
  set destination(LatLng? _value) {
    _destination = _value;
    _value != null
        ? prefs.setString('ff_destination', _value.serialize())
        : prefs.remove('ff_destination');
  }

  bool _allowRidesharing = false;
  bool get allowRidesharing => _allowRidesharing;
  set allowRidesharing(bool _value) {
    _allowRidesharing = _value;
    prefs.setBool('ff_allowRidesharing', _value);
  }

  bool _UsePublicTransportation = false;
  bool get UsePublicTransportation => _UsePublicTransportation;
  set UsePublicTransportation(bool _value) {
    _UsePublicTransportation = _value;
    prefs.setBool('ff_UsePublicTransportation', _value);
  }

  bool _onlyUberXNavigation = false;
  bool get onlyUberXNavigation => _onlyUberXNavigation;
  set onlyUberXNavigation(bool _value) {
    _onlyUberXNavigation = _value;
    prefs.setBool('ff_onlyUberXNavigation', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
