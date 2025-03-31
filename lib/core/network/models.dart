class ApiResponse<T> {
  final T? data;
  final String? errorMessage;
  final bool isSuccess;
  final int? statusCode;

  ApiResponse({
    this.data,
    this.errorMessage,
    this.isSuccess = true,
    this.statusCode,
  });
  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return ApiResponse(
      data: json['data'] != null ? fromJson(json['data']) : null,
      errorMessage: json['errorMessage'],
      isSuccess: json['isSuccess'] ?? false,
      statusCode: json['statusCode'],
    );
  }
}

class PaginatedResponse<T> {
  final List<T> data;
  final int totalCount;
  final int currentPage;
  final int pageSize;

  PaginatedResponse({
    required this.data,
    required this.totalCount,
    required this.currentPage,
    required this.pageSize,
  });

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final List<dynamic> itemsJson = json['data'] ?? [];
    final List<T> items = itemsJson.map((item) => fromJson(item)).toList();

    return PaginatedResponse(
      data: items,
      totalCount: json['totalCount'] ?? 0,
      currentPage: json['currentPage'] ?? 1,
      pageSize: json['pageSize'] ?? 20,
    );
  }
}
