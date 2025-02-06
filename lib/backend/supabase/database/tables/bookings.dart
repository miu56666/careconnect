import '../database.dart';

class BookingsTable extends SupabaseTable<BookingsRow> {
  @override
  String get tableName => 'bookings';

  @override
  BookingsRow createRow(Map<String, dynamic> data) => BookingsRow(data);
}

class BookingsRow extends SupabaseDataRow {
  BookingsRow(super.data);

  @override
  SupabaseTable get table => BookingsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get motherId => getField<String>('mother_id');
  set motherId(String? value) => setField<String>('mother_id', value);

  String? get babysitterId => getField<String>('babysitter_id');
  set babysitterId(String? value) => setField<String>('babysitter_id', value);

  DateTime? get bookingDate => getField<DateTime>('booking_date');
  set bookingDate(DateTime? value) => setField<DateTime>('booking_date', value);

  PostgresTime? get bookingTime => getField<PostgresTime>('booking_time');
  set bookingTime(PostgresTime? value) =>
      setField<PostgresTime>('booking_time', value);

  int? get duration => getField<int>('duration');
  set duration(int? value) => setField<int>('duration', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  double? get totalCost => getField<double>('total_cost');
  set totalCost(double? value) => setField<double>('total_cost', value);

  String? get nameMother => getField<String>('name_mother');
  set nameMother(String? value) => setField<String>('name_mother', value);

  String? get babysName => getField<String>('babys_name');
  set babysName(String? value) => setField<String>('babys_name', value);

  String? get note => getField<String>('Note');
  set note(String? value) => setField<String>('Note', value);
}
