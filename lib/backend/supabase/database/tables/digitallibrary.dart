import '../database.dart';

class DigitallibraryTable extends SupabaseTable<DigitallibraryRow> {
  @override
  String get tableName => 'digitallibrary';

  @override
  DigitallibraryRow createRow(Map<String, dynamic> data) =>
      DigitallibraryRow(data);
}

class DigitallibraryRow extends SupabaseDataRow {
  DigitallibraryRow(super.data);

  @override
  SupabaseTable get table => DigitallibraryTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get contentName => getField<String>('content_name');
  set contentName(String? value) => setField<String>('content_name', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get ageGroup => getField<String>('age_group');
  set ageGroup(String? value) => setField<String>('age_group', value);

  DateTime? get additionDate => getField<DateTime>('addition_date');
  set additionDate(DateTime? value) =>
      setField<DateTime>('addition_date', value);

  String? get contentDescription => getField<String>('content_description');
  set contentDescription(String? value) =>
      setField<String>('content_description', value);

  String? get imageLink => getField<String>('image_link');
  set imageLink(String? value) => setField<String>('image_link', value);

  String? get links => getField<String>('links');
  set links(String? value) => setField<String>('links', value);
}
