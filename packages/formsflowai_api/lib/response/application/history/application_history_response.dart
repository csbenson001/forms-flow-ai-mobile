class ApplicationHistoryResponse {
  final List<Applications>? applications;

  ApplicationHistoryResponse({
    this.applications,
  });

  ApplicationHistoryResponse.fromJson(Map<String, dynamic> json)
      : applications = (json['applications'] as List?)
            ?.map(
                (dynamic e) => Applications.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'applications': applications?.map((e) => e.toJson()).toList()};
}

class Applications {
  final String? formUrl;
  final String? created;
  final String? applicationStatus;

  Applications({
    this.formUrl,
    this.created,
    this.applicationStatus,
  });

  Applications.fromJson(Map<String, dynamic> json)
      : formUrl = json['formUrl'] as String?,
        created = json['created'] as String?,
        applicationStatus = json['applicationStatus'] as String?;

  Map<String, dynamic> toJson() => {
        'formUrl': formUrl,
        'created': created,
        'applicationStatus': applicationStatus
      };
}
