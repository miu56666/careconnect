import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
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
      _favourite = prefs
              .getStringList('ff_favourite')
              ?.map((x) {
                try {
                  return DigitalLibraryStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _favourite;
    });
    _safeInit(() {
      _vaccine = prefs
              .getStringList('ff_vaccine')
              ?.map((x) {
                try {
                  return VacineStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _vaccine;
    });
    _safeInit(() {
      _Area = prefs.getString('ff_Area') ?? _Area;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _Comment = [];
  List<String> get Comment => _Comment;
  set Comment(List<String> value) {
    _Comment = value;
  }

  void addToComment(String value) {
    Comment.add(value);
  }

  void removeFromComment(String value) {
    Comment.remove(value);
  }

  void removeAtIndexFromComment(int index) {
    Comment.removeAt(index);
  }

  void updateCommentAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Comment[index] = updateFn(_Comment[index]);
  }

  void insertAtIndexInComment(int index, String value) {
    Comment.insert(index, value);
  }

  List<DigitalLibraryStruct> _favourite = [];
  List<DigitalLibraryStruct> get favourite => _favourite;
  set favourite(List<DigitalLibraryStruct> value) {
    _favourite = value;
    prefs.setStringList(
        'ff_favourite', value.map((x) => x.serialize()).toList());
  }

  void addToFavourite(DigitalLibraryStruct value) {
    favourite.add(value);
    prefs.setStringList(
        'ff_favourite', _favourite.map((x) => x.serialize()).toList());
  }

  void removeFromFavourite(DigitalLibraryStruct value) {
    favourite.remove(value);
    prefs.setStringList(
        'ff_favourite', _favourite.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromFavourite(int index) {
    favourite.removeAt(index);
    prefs.setStringList(
        'ff_favourite', _favourite.map((x) => x.serialize()).toList());
  }

  void updateFavouriteAtIndex(
    int index,
    DigitalLibraryStruct Function(DigitalLibraryStruct) updateFn,
  ) {
    favourite[index] = updateFn(_favourite[index]);
    prefs.setStringList(
        'ff_favourite', _favourite.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInFavourite(int index, DigitalLibraryStruct value) {
    favourite.insert(index, value);
    prefs.setStringList(
        'ff_favourite', _favourite.map((x) => x.serialize()).toList());
  }

  List<VacineStruct> _vaccine = [];
  List<VacineStruct> get vaccine => _vaccine;
  set vaccine(List<VacineStruct> value) {
    _vaccine = value;
    prefs.setStringList('ff_vaccine', value.map((x) => x.serialize()).toList());
  }

  void addToVaccine(VacineStruct value) {
    vaccine.add(value);
    prefs.setStringList(
        'ff_vaccine', _vaccine.map((x) => x.serialize()).toList());
  }

  void removeFromVaccine(VacineStruct value) {
    vaccine.remove(value);
    prefs.setStringList(
        'ff_vaccine', _vaccine.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromVaccine(int index) {
    vaccine.removeAt(index);
    prefs.setStringList(
        'ff_vaccine', _vaccine.map((x) => x.serialize()).toList());
  }

  void updateVaccineAtIndex(
    int index,
    VacineStruct Function(VacineStruct) updateFn,
  ) {
    vaccine[index] = updateFn(_vaccine[index]);
    prefs.setStringList(
        'ff_vaccine', _vaccine.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInVaccine(int index, VacineStruct value) {
    vaccine.insert(index, value);
    prefs.setStringList(
        'ff_vaccine', _vaccine.map((x) => x.serialize()).toList());
  }

  String _Area = '';
  String get Area => _Area;
  set Area(String value) {
    _Area = value;
    prefs.setString('ff_Area', value);
  }
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
