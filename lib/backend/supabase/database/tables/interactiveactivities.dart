import '../database.dart';

class InteractiveactivitiesTable
    extends SupabaseTable<InteractiveactivitiesRow> {
  @override
  String get tableName => 'interactiveactivities';

  @override
  InteractiveactivitiesRow createRow(Map<String, dynamic> data) =>
      InteractiveactivitiesRow(data);
}

class InteractiveactivitiesRow extends SupabaseDataRow {
  InteractiveactivitiesRow(super.data);

  @override
  SupabaseTable get table => InteractiveactivitiesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get libraryId => getField<int>('library_id');
  set libraryId(int? value) => setField<int>('library_id', value);

  String get activityName => getField<String>('activity_name')!;
  set activityName(String value) => setField<String>('activity_name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get ageGroup => getField<String>('age_group');
  set ageGroup(String? value) => setField<String>('age_group', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get benefits => getField<String>('benefits');
  set benefits(String? value) => setField<String>('benefits', value);

  String? get precautions => getField<String>('precautions');
  set precautions(String? value) => setField<String>('precautions', value);
}
