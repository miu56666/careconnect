import '../database.dart';

class MealtrackingTable extends SupabaseTable<MealtrackingRow> {
  @override
  String get tableName => 'mealtracking';

  @override
  MealtrackingRow createRow(Map<String, dynamic> data) => MealtrackingRow(data);
}

class MealtrackingRow extends SupabaseDataRow {
  MealtrackingRow(super.data);

  @override
  SupabaseTable get table => MealtrackingTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get motherId => getField<String>('mother_id');
  set motherId(String? value) => setField<String>('mother_id', value);

  String? get mealType => getField<String>('meal_type');
  set mealType(String? value) => setField<String>('meal_type', value);

  String? get mealDescription => getField<String>('meal_description');
  set mealDescription(String? value) =>
      setField<String>('meal_description', value);

  PostgresTime? get mealTime => getField<PostgresTime>('meal_time');
  set mealTime(PostgresTime? value) =>
      setField<PostgresTime>('meal_time', value);

  int? get mealNumber => getField<int>('meal_number');
  set mealNumber(int? value) => setField<int>('meal_number', value);

  DateTime? get mealDate => getField<DateTime>('meal_date');
  set mealDate(DateTime? value) => setField<DateTime>('meal_date', value);
}
