// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DigitalLibraryStruct extends BaseStruct {
  DigitalLibraryStruct({
    int? id,
    String? contentName,
    String? type,
    String? ageGroup,
    DateTime? additionDate,
    String? contentDescption,
    String? imgLink,
    String? link,
  })  : _id = id,
        _contentName = contentName,
        _type = type,
        _ageGroup = ageGroup,
        _additionDate = additionDate,
        _contentDescption = contentDescption,
        _imgLink = imgLink,
        _link = link;

  // "ID" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "content_name" field.
  String? _contentName;
  String get contentName => _contentName ?? '';
  set contentName(String? val) => _contentName = val;

  bool hasContentName() => _contentName != null;

  // "Type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "age_group" field.
  String? _ageGroup;
  String get ageGroup => _ageGroup ?? '';
  set ageGroup(String? val) => _ageGroup = val;

  bool hasAgeGroup() => _ageGroup != null;

  // "addition_date" field.
  DateTime? _additionDate;
  DateTime? get additionDate => _additionDate;
  set additionDate(DateTime? val) => _additionDate = val;

  bool hasAdditionDate() => _additionDate != null;

  // "content_descption" field.
  String? _contentDescption;
  String get contentDescption => _contentDescption ?? '';
  set contentDescption(String? val) => _contentDescption = val;

  bool hasContentDescption() => _contentDescption != null;

  // "img_link" field.
  String? _imgLink;
  String get imgLink => _imgLink ?? '';
  set imgLink(String? val) => _imgLink = val;

  bool hasImgLink() => _imgLink != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;

  bool hasLink() => _link != null;

  static DigitalLibraryStruct fromMap(Map<String, dynamic> data) =>
      DigitalLibraryStruct(
        id: castToType<int>(data['ID']),
        contentName: data['content_name'] as String?,
        type: data['Type'] as String?,
        ageGroup: data['age_group'] as String?,
        additionDate: data['addition_date'] as DateTime?,
        contentDescption: data['content_descption'] as String?,
        imgLink: data['img_link'] as String?,
        link: data['link'] as String?,
      );

  static DigitalLibraryStruct? maybeFromMap(dynamic data) => data is Map
      ? DigitalLibraryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ID': _id,
        'content_name': _contentName,
        'Type': _type,
        'age_group': _ageGroup,
        'addition_date': _additionDate,
        'content_descption': _contentDescption,
        'img_link': _imgLink,
        'link': _link,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ID': serializeParam(
          _id,
          ParamType.int,
        ),
        'content_name': serializeParam(
          _contentName,
          ParamType.String,
        ),
        'Type': serializeParam(
          _type,
          ParamType.String,
        ),
        'age_group': serializeParam(
          _ageGroup,
          ParamType.String,
        ),
        'addition_date': serializeParam(
          _additionDate,
          ParamType.DateTime,
        ),
        'content_descption': serializeParam(
          _contentDescption,
          ParamType.String,
        ),
        'img_link': serializeParam(
          _imgLink,
          ParamType.String,
        ),
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
      }.withoutNulls;

  static DigitalLibraryStruct fromSerializableMap(Map<String, dynamic> data) =>
      DigitalLibraryStruct(
        id: deserializeParam(
          data['ID'],
          ParamType.int,
          false,
        ),
        contentName: deserializeParam(
          data['content_name'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['Type'],
          ParamType.String,
          false,
        ),
        ageGroup: deserializeParam(
          data['age_group'],
          ParamType.String,
          false,
        ),
        additionDate: deserializeParam(
          data['addition_date'],
          ParamType.DateTime,
          false,
        ),
        contentDescption: deserializeParam(
          data['content_descption'],
          ParamType.String,
          false,
        ),
        imgLink: deserializeParam(
          data['img_link'],
          ParamType.String,
          false,
        ),
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DigitalLibraryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DigitalLibraryStruct &&
        id == other.id &&
        contentName == other.contentName &&
        type == other.type &&
        ageGroup == other.ageGroup &&
        additionDate == other.additionDate &&
        contentDescption == other.contentDescption &&
        imgLink == other.imgLink &&
        link == other.link;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        contentName,
        type,
        ageGroup,
        additionDate,
        contentDescption,
        imgLink,
        link
      ]);
}

DigitalLibraryStruct createDigitalLibraryStruct({
  int? id,
  String? contentName,
  String? type,
  String? ageGroup,
  DateTime? additionDate,
  String? contentDescption,
  String? imgLink,
  String? link,
}) =>
    DigitalLibraryStruct(
      id: id,
      contentName: contentName,
      type: type,
      ageGroup: ageGroup,
      additionDate: additionDate,
      contentDescption: contentDescption,
      imgLink: imgLink,
      link: link,
    );
