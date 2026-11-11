import 'package:dio/dio.dart';

import '../../domain/entities/client_form_entity.dart';

abstract interface class IProjectManagementRemoteDataSource {
  Future<List<Map<String, dynamic>>> fetchClients();

  Future<String> createProject({
    required String name,
    DateTime? startDate,
    DateTime? dueDate,
    String? clientId,
    ClientFormEntity? newClient,
  });

  Future<void> updateProject({
    required String code,
    required String name,
    DateTime? startDate,
    DateTime? dueDate,
    required ClientFormEntity client,
  });
}

class ProjectManagementRemoteDataSource
    implements IProjectManagementRemoteDataSource {
  ProjectManagementRemoteDataSource(this._dio);

  final Dio _dio;

  @override
  Future<List<Map<String, dynamic>>> fetchClients() async {
    final response = await _dio.get<Map<String, dynamic>>('clients');
    final data = response.data?['data'];

    if (data is! List) return const [];
    return data
        .whereType<Map>()
        .map((item) => Map<String, dynamic>.from(item))
        .toList(growable: false);
  }

  @override
  Future<String> createProject({
    required String name,
    DateTime? startDate,
    DateTime? dueDate,
    String? clientId,
    ClientFormEntity? newClient,
  }) async {
    final data = <String, dynamic>{
      'name': name,
      if (startDate != null) 'start_date': _dateOnly(startDate),
      if (dueDate != null) 'due_date': _dateOnly(dueDate),
    };
    if (clientId != null) data['client_id'] = clientId;
    if (newClient != null) data['client'] = _clientPayload(newClient);

    final response = await _dio.post<Map<String, dynamic>>(
      'projects',
      data: data,
    );

    final code = response.data?['code'];
    if (code is! String || code.isEmpty) {
      throw const FormatException('Kode proyek tidak ada pada respons.');
    }
    return code;
  }

  @override
  Future<void> updateProject({
    required String code,
    required String name,
    DateTime? startDate,
    DateTime? dueDate,
    required ClientFormEntity client,
  }) async {
    await _dio.patch<void>(
      'projects/$code',
      data: {
        'name': name,
        'start_date': startDate == null ? null : _dateOnly(startDate),
        'due_date': dueDate == null ? null : _dateOnly(dueDate),
        'client': _clientPayload(client),
      },
    );
  }
}

Map<String, dynamic> _clientPayload(ClientFormEntity client) => {
  'name': client.name,
  'address': client.address,
  'contact_name': client.contactName,
  'contact_role': client.contactRole,
  'phone': client.phone,
};

String _dateOnly(DateTime date) {
  final year = date.year.toString().padLeft(4, '0');
  final month = date.month.toString().padLeft(2, '0');
  final day = date.day.toString().padLeft(2, '0');
  return '$year-$month-$day';
}
