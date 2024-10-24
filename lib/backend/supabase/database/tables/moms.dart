import '../database.dart';

class MomsTable extends SupabaseTable<MomsRow> {
  @override
  String get tableName => 'Moms';

  @override
  MomsRow createRow(Map<String, dynamic> data) => MomsRow(data);
}

class MomsRow extends SupabaseDataRow {
  MomsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MomsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get email => getField<String>('Email');
  set email(String? value) => setField<String>('Email', value);

  String get password => getField<String>('Password')!;
  set password(String value) => setField<String>('Password', value);

  String? get phone => getField<String>('Phone');
  set phone(String? value) => setField<String>('Phone', value);
}
