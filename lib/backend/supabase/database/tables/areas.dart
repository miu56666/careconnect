import '../database.dart';

class AreasTable extends SupabaseTable<AreasRow> {
  @override
  String get tableName => 'areas';

  @override
  AreasRow createRow(Map<String, dynamic> data) => AreasRow(data);
}

class AreasRow extends SupabaseDataRow {
  AreasRow(super.data);

  @override
  SupabaseTable get table => AreasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get area => getField<String>('area');
  set area(String? value) => setField<String>('area', value);

  String? get medicalcenter => getField<String>('medicalcenter');
  set medicalcenter(String? value) => setField<String>('medicalcenter', value);
}
