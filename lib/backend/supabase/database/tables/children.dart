import '../database.dart';

class ChildrenTable extends SupabaseTable<ChildrenRow> {
  @override
  String get tableName => 'children';

  @override
  ChildrenRow createRow(Map<String, dynamic> data) => ChildrenRow(data);
}

class ChildrenRow extends SupabaseDataRow {
  ChildrenRow(super.data);

  @override
  SupabaseTable get table => ChildrenTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get motherId => getField<String>('mother_id');
  set motherId(String? value) => setField<String>('mother_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  DateTime? get birthDate => getField<DateTime>('birth_date');
  set birthDate(DateTime? value) => setField<DateTime>('birth_date', value);

  String? get gender => getField<String>('gender');
  set gender(String? value) => setField<String>('gender', value);

  double? get height => getField<double>('height');
  set height(double? value) => setField<double>('height', value);

  double? get weight => getField<double>('weight');
  set weight(double? value) => setField<double>('weight', value);

  String? get healthInfo => getField<String>('health_info');
  set healthInfo(String? value) => setField<String>('health_info', value);

  String? get allergies => getField<String>('allergies');
  set allergies(String? value) => setField<String>('allergies', value);

  String? get childPhoto => getField<String>('child_photo');
  set childPhoto(String? value) => setField<String>('child_photo', value);
}
