import '../database.dart';

class BabysittersTable extends SupabaseTable<BabysittersRow> {
  @override
  String get tableName => 'babysitters';

  @override
  BabysittersRow createRow(Map<String, dynamic> data) => BabysittersRow(data);
}

class BabysittersRow extends SupabaseDataRow {
  BabysittersRow(super.data);

  @override
  SupabaseTable get table => BabysittersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String get password => getField<String>('password')!;
  set password(String value) => setField<String>('password', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  List<String> get cetagory => getListField<String>('cetagory');
  set cetagory(List<String>? value) => setListField<String>('cetagory', value);

  String? get skills => getField<String>('skills');
  set skills(String? value) => setField<String>('skills', value);

  String? get qualification => getField<String>('qualification');
  set qualification(String? value) => setField<String>('qualification', value);

  String? get bio => getField<String>('bio');
  set bio(String? value) => setField<String>('bio', value);

  int? get totalCost => getField<int>('total_cost');
  set totalCost(int? value) => setField<int>('total_cost', value);

  String? get avalibilty => getField<String>('avalibilty');
  set avalibilty(String? value) => setField<String>('avalibilty', value);

  String? get area => getField<String>('area');
  set area(String? value) => setField<String>('area', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);
}
