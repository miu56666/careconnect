// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VacineStruct extends BaseStruct {
  VacineStruct({
    int? id,
  }) : _id = id;

  // "ID" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  static VacineStruct fromMap(Map<String, dynamic> data) => VacineStruct(
        id: castToType<int>(data['ID']),
      );

  static VacineStruct? maybeFromMap(dynamic data) =>
      data is Map ? VacineStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'ID': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ID': serializeParam(
          _id,
          ParamType.int,
        ),
      }.withoutNulls;

  static VacineStruct fromSerializableMap(Map<String, dynamic> data) =>
      VacineStruct(
        id: deserializeParam(
          data['ID'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'VacineStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VacineStruct && id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([id]);
}

VacineStruct createVacineStruct({
  int? id,
}) =>
    VacineStruct(
      id: id,
    );
