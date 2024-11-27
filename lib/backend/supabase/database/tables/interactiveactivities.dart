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

  String? get ageGroup => getField<String>('age_group');
  set ageGroup(String? value) => setField<String>('age_group', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get benefits => getField<String>('benefits');
  set benefits(String? value) => setField<String>('benefits', value);

  String? get precautions => getField<String>('precautions');
  set precautions(String? value) => setField<String>('precautions', value);

  String? get step1 => getField<String>('step1');
  set step1(String? value) => setField<String>('step1', value);

  String? get step2 => getField<String>('step2');
  set step2(String? value) => setField<String>('step2', value);

  String? get step3 => getField<String>('step3');
  set step3(String? value) => setField<String>('step3', value);

  String? get step4 => getField<String>('step4');
  set step4(String? value) => setField<String>('step4', value);

  String? get step5 => getField<String>('step5');
  set step5(String? value) => setField<String>('step5', value);
}
