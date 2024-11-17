import '../database.dart';

class TasktrackingTable extends SupabaseTable<TasktrackingRow> {
  @override
  String get tableName => 'tasktracking';

  @override
  TasktrackingRow createRow(Map<String, dynamic> data) => TasktrackingRow(data);
}

class TasktrackingRow extends SupabaseDataRow {
  TasktrackingRow(super.data);

  @override
  SupabaseTable get table => TasktrackingTable();

  String get taskId => getField<String>('task_id')!;
  set taskId(String value) => setField<String>('task_id', value);

  String? get taskName => getField<String>('task_name');
  set taskName(String? value) => setField<String>('task_name', value);

  String? get taskDescription => getField<String>('task_description');
  set taskDescription(String? value) =>
      setField<String>('task_description', value);

  String? get babysitterId => getField<String>('babysitter_id');
  set babysitterId(String? value) => setField<String>('babysitter_id', value);

  String? get babysitterName => getField<String>('babysitter_name');
  set babysitterName(String? value) =>
      setField<String>('babysitter_name', value);

  bool get status => getField<bool>('status')!;
  set status(bool value) => setField<bool>('status', value);
}
