import '../database.dart';

class MothersTable extends SupabaseTable<MothersRow> {
  @override
  String get tableName => 'mothers';

  @override
  MothersRow createRow(Map<String, dynamic> data) => MothersRow(data);
}

class MothersRow extends SupabaseDataRow {
  MothersRow(super.data);

  @override
  SupabaseTable get table => MothersTable();

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

  String? get momPhoto => getField<String>('mom_photo');
  set momPhoto(String? value) => setField<String>('mom_photo', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);
}
