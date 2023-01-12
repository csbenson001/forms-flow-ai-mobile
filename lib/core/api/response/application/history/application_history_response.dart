/// [ApplicationHistoryResponse] class to parse
/// application history api response
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
  final String? submissionId;
  final String? created;
  final String? applicationStatus;
  final String? formId;
  final String? submittedBy;

  Applications(
      {this.submissionId,
      this.created,
      this.applicationStatus,
      this.formId,
      this.submittedBy});

  Applications.fromJson(Map<String, dynamic> json)
      : submissionId = json['submissionId'] as String?,
        created = json['created'] as String?,
        formId = json['formId'] as String?,
        submittedBy = json['submittedBy'] as String?,
        applicationStatus = json['applicationStatus'] as String?;

  Map<String, dynamic> toJson() => {
        'submissionId': submissionId,
        'formId': formId,
        'created': created,
        'submittedBy': submittedBy,
        'applicationStatus': applicationStatus
      };
}
