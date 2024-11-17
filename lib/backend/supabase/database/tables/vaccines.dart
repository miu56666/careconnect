import '../database.dart';

class VaccinesTable extends SupabaseTable<VaccinesRow> {
  @override
  String get tableName => 'vaccines';

  @override
  VaccinesRow createRow(Map<String, dynamic> data) => VaccinesRow(data);
}

class VaccinesRow extends SupabaseDataRow {
  VaccinesRow(super.data);

  @override
  SupabaseTable get table => VaccinesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get vaccineName => getField<String>('vaccine_name')!;
  set vaccineName(String value) => setField<String>('vaccine_name', value);

  int get ageFrom => getField<int>('age_from')!;
  set ageFrom(int value) => setField<int>('age_from', value);

  int get ageTo => getField<int>('age_to')!;
  set ageTo(int value) => setField<int>('age_to', value);

  DateTime get dueDate => getField<DateTime>('due_date')!;
  set dueDate(DateTime value) => setField<DateTime>('due_date', value);

  DateTime? get nextDueDate => getField<DateTime>('next_due_date');
  set nextDueDate(DateTime? value) =>
      setField<DateTime>('next_due_date', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  String? get age => getField<String>('age');
  set age(String? value) => setField<String>('age', value);

  String? get sideEffect => getField<String>('side_effect');
  set sideEffect(String? value) => setField<String>('side_effect', value);

  String? get preventiveMeasures => getField<String>('Preventive_Measures');
  set preventiveMeasures(String? value) =>
      setField<String>('Preventive_Measures', value);
}
