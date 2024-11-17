import '../database.dart';

class CetagoriesTable extends SupabaseTable<CetagoriesRow> {
  @override
  String get tableName => 'cetagories';

  @override
  CetagoriesRow createRow(Map<String, dynamic> data) => CetagoriesRow(data);
}

class CetagoriesRow extends SupabaseDataRow {
  CetagoriesRow(super.data);

  @override
  SupabaseTable get table => CetagoriesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('Name');
  set name(String? value) => setField<String>('Name', value);
}
