import '../database.dart';

class ChildNutritionTable extends SupabaseTable<ChildNutritionRow> {
  @override
  String get tableName => 'child_nutrition';

  @override
  ChildNutritionRow createRow(Map<String, dynamic> data) =>
      ChildNutritionRow(data);
}

class ChildNutritionRow extends SupabaseDataRow {
  ChildNutritionRow(super.data);

  @override
  SupabaseTable get table => ChildNutritionTable();

  String? get ageStart => getField<String>('age_start');
  set ageStart(String? value) => setField<String>('age_start', value);

  String? get feedingBehaviorReadiness =>
      getField<String>('feeding_behavior_readiness');
  set feedingBehaviorReadiness(String? value) =>
      setField<String>('feeding_behavior_readiness', value);

  String? get foodsAllowed => getField<String>('foods_allowed');
  set foodsAllowed(String? value) => setField<String>('foods_allowed', value);

  String? get tips => getField<String>('tips');
  set tips(String? value) => setField<String>('tips', value);

  String? get foodsToAvoid => getField<String>('foods_to_avoid');
  set foodsToAvoid(String? value) => setField<String>('foods_to_avoid', value);

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get ageEnd => getField<String>('age_end');
  set ageEnd(String? value) => setField<String>('age_end', value);
}
