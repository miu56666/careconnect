import '../database.dart';

class SleeptrackingTable extends SupabaseTable<SleeptrackingRow> {
  @override
  String get tableName => 'sleeptracking';

  @override
  SleeptrackingRow createRow(Map<String, dynamic> data) =>
      SleeptrackingRow(data);
}

class SleeptrackingRow extends SupabaseDataRow {
  SleeptrackingRow(super.data);

  @override
  SupabaseTable get table => SleeptrackingTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get motherId => getField<String>('mother_id');
  set motherId(String? value) => setField<String>('mother_id', value);

  PostgresTime? get sleepstart => getField<PostgresTime>('sleepstart');
  set sleepstart(PostgresTime? value) =>
      setField<PostgresTime>('sleepstart', value);

  PostgresTime? get sleepend => getField<PostgresTime>('sleepend');
  set sleepend(PostgresTime? value) =>
      setField<PostgresTime>('sleepend', value);

  double? get sleepHours => getField<double>('sleep_hours');
  set sleepHours(double? value) => setField<double>('sleep_hours', value);

  String? get sleepnotes => getField<String>('sleepnotes');
  set sleepnotes(String? value) => setField<String>('sleepnotes', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);
}
