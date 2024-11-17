import '../database.dart';

class RecipesTable extends SupabaseTable<RecipesRow> {
  @override
  String get tableName => 'recipes';

  @override
  RecipesRow createRow(Map<String, dynamic> data) => RecipesRow(data);
}

class RecipesRow extends SupabaseDataRow {
  RecipesRow(super.data);

  @override
  SupabaseTable get table => RecipesTable();

  int get recipeId => getField<int>('recipe_id')!;
  set recipeId(int value) => setField<int>('recipe_id', value);

  String? get recipeName => getField<String>('recipe_name');
  set recipeName(String? value) => setField<String>('recipe_name', value);

  String? get ageGroupStart => getField<String>('age_group_start');
  set ageGroupStart(String? value) =>
      setField<String>('age_group_start', value);

  String? get ingredients => getField<String>('ingredients');
  set ingredients(String? value) => setField<String>('ingredients', value);

  String? get preparationSteps => getField<String>('preparation_steps');
  set preparationSteps(String? value) =>
      setField<String>('preparation_steps', value);

  String? get warnings => getField<String>('warnings');
  set warnings(String? value) => setField<String>('warnings', value);

  String? get healthWarnings => getField<String>('health_warnings');
  set healthWarnings(String? value) =>
      setField<String>('health_warnings', value);

  String? get ageGroupEnd => getField<String>('age_group_end');
  set ageGroupEnd(String? value) => setField<String>('age_group_end', value);
}
