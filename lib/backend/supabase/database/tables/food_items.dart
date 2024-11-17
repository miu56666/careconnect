import '../database.dart';

class FoodItemsTable extends SupabaseTable<FoodItemsRow> {
  @override
  String get tableName => 'food_items';

  @override
  FoodItemsRow createRow(Map<String, dynamic> data) => FoodItemsRow(data);
}

class FoodItemsRow extends SupabaseDataRow {
  FoodItemsRow(super.data);

  @override
  SupabaseTable get table => FoodItemsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get carbohydrates => getField<String>('carbohydrates');
  set carbohydrates(String? value) => setField<String>('carbohydrates', value);

  String? get proteins => getField<String>('proteins');
  set proteins(String? value) => setField<String>('proteins', value);

  String? get fats => getField<String>('fats');
  set fats(String? value) => setField<String>('fats', value);

  String? get fiber => getField<String>('fiber');
  set fiber(String? value) => setField<String>('fiber', value);

  String? get sugars => getField<String>('sugars');
  set sugars(String? value) => setField<String>('sugars', value);

  String? get vitamins => getField<String>('vitamins');
  set vitamins(String? value) => setField<String>('vitamins', value);

  String? get suitableAges => getField<String>('suitable_ages');
  set suitableAges(String? value) => setField<String>('suitable_ages', value);

  String? get dangerousAges => getField<String>('dangerous_ages');
  set dangerousAges(String? value) => setField<String>('dangerous_ages', value);

  bool? get allergens => getField<bool>('allergens');
  set allergens(bool? value) => setField<bool>('allergens', value);

  String? get requiredQuantity => getField<String>('required_quantity');
  set requiredQuantity(String? value) =>
      setField<String>('required_quantity', value);

  String? get syrianName => getField<String>('syrian_name');
  set syrianName(String? value) => setField<String>('syrian_name', value);
}
