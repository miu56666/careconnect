import '../database.dart';

class MedicalappointmentsTable extends SupabaseTable<MedicalappointmentsRow> {
  @override
  String get tableName => 'medicalappointments';

  @override
  MedicalappointmentsRow createRow(Map<String, dynamic> data) =>
      MedicalappointmentsRow(data);
}

class MedicalappointmentsRow extends SupabaseDataRow {
  MedicalappointmentsRow(super.data);

  @override
  SupabaseTable get table => MedicalappointmentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get motherId => getField<String>('mother_id');
  set motherId(String? value) => setField<String>('mother_id', value);

  DateTime? get appointmentDate => getField<DateTime>('appointment_date');
  set appointmentDate(DateTime? value) =>
      setField<DateTime>('appointment_date', value);

  PostgresTime? get appointmentTime =>
      getField<PostgresTime>('appointment_time');
  set appointmentTime(PostgresTime? value) =>
      setField<PostgresTime>('appointment_time', value);

  String? get location => getField<String>('Location');
  set location(String? value) => setField<String>('Location', value);

  String? get purpuse => getField<String>('Purpuse');
  set purpuse(String? value) => setField<String>('Purpuse', value);

  String? get reminder => getField<String>('reminder');
  set reminder(String? value) => setField<String>('reminder', value);

  String? get doctorName => getField<String>('doctor_name');
  set doctorName(String? value) => setField<String>('doctor_name', value);
}
