import '../database.dart';

class CertificatesTable extends SupabaseTable<CertificatesRow> {
  @override
  String get tableName => 'certificates';

  @override
  CertificatesRow createRow(Map<String, dynamic> data) => CertificatesRow(data);
}

class CertificatesRow extends SupabaseDataRow {
  CertificatesRow(super.data);

  @override
  SupabaseTable get table => CertificatesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get certificateName => getField<String>('certificate_name');
  set certificateName(String? value) =>
      setField<String>('certificate_name', value);

  String? get certificateType => getField<String>('certificate_type');
  set certificateType(String? value) =>
      setField<String>('certificate_type', value);

  String? get filePath => getField<String>('file_path');
  set filePath(String? value) => setField<String>('file_path', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get babysid => getField<String>('babysid');
  set babysid(String? value) => setField<String>('babysid', value);
}
