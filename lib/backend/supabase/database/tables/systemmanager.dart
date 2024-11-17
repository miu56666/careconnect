import '../database.dart';

class SystemmanagerTable extends SupabaseTable<SystemmanagerRow> {
  @override
  String get tableName => 'systemmanager';

  @override
  SystemmanagerRow createRow(Map<String, dynamic> data) =>
      SystemmanagerRow(data);
}

class SystemmanagerRow extends SupabaseDataRow {
  SystemmanagerRow(super.data);

  @override
  SupabaseTable get table => SystemmanagerTable();

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
}
