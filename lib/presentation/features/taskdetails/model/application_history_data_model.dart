import 'package:formsflowai_api/response/application/history/application_history_response.dart';
import 'package:formsflowai_shared/shared/api_constants_url.dart';

import '../../../../core/database/entity/application_history_entity.dart';

/// [ApplicationHistoryDM] data model class contains all application
/// history related data fields
class ApplicationHistoryDM {
  String? formUrl;
  String? created;
  String? applicationStatus;
  int? applicationId;
  String? formId;
  String? formSubmissionId;
  String? submittedBy;

  @override
  String toString() {
    return 'ApplicationHistoryDM{formUrl: $formUrl, created: $created, applicationStatus: $applicationStatus, applicationId: $applicationId}';
  }

  /// Method to transform [ApplicationHistoryResponse]
  /// into List[ApplicationHistoryDM]
  /// Input Parameters
  /// [ApplicationHistoryResponse]
  /// --> Returns List[ApplicationHistoryDM]
  static List<ApplicationHistoryDM> transform(
      {required ApplicationHistoryResponse applicationHistoryResponse}) {
    List<ApplicationHistoryDM> mData = List.empty(growable: true);
    if (applicationHistoryResponse.applications != null &&
        applicationHistoryResponse.applications!.length > 0) {
      for (Applications element in applicationHistoryResponse.applications!) {
        ApplicationHistoryDM dm = ApplicationHistoryDM();
        dm.created = element.created;
        dm.applicationStatus = element.applicationStatus;
        dm.formSubmissionId = element.submissionId;
        dm.formId = element.formId;
        dm.submittedBy = element.submittedBy;
        dm.formUrl =
            "${ApiConstantUrl.FORMSFLOWAI_BASE_URL}${ApiConstantUrl.FORM}/${element.formId}/${ApiConstantUrl.FORM_SUBMISSION}/${element.submissionId}";
        mData.add(dm);
      }
    }
    return mData;
  }

  /// Method to transform List[ApplicationHistoryEntity]
  /// into List[ApplicationHistoryDM]
  /// Input Parameters
  /// List[ApplicationHistoryEntity]
  /// --> Returns List[ApplicationHistoryDM]
  static List<ApplicationHistoryDM> transformFromEntity(
      {required List<ApplicationHistoryEntity>? applicationHistorys}) {
    List<ApplicationHistoryDM> mData = List.empty(growable: true);
    if (applicationHistorys!.length > 0) {
      for (ApplicationHistoryEntity element in applicationHistorys) {
        ApplicationHistoryDM dm = ApplicationHistoryDM();
        dm.created = element.created;
        dm.applicationStatus = element.applicationStatus;
        dm.formUrl = element.formUrl;
        dm.formSubmissionId = element.formSubmissionId;
        dm.formId = element.formId;
        dm.submittedBy = element.submittedBy;
        mData.add(dm);
      }
    }
    return mData;
  }

  /// Method to transform List[ApplicationHistoryDM]
  /// into List[ApplicationHistoryEntity]
  /// Input Parameters
  /// List[ApplicationHistoryDM]
  /// [ApplicationId]
  /// [TaskId]
  /// --> Returns List[ApplicationHistoryEntity]
  static List<ApplicationHistoryEntity> transformFromApplicationDM(
      {required List<ApplicationHistoryDM> data,
      required int? applicationId,
      required String? taskId}) {
    List<ApplicationHistoryEntity> mData = List.empty(growable: true);
    if (data != null && data.length > 0) {
      for (ApplicationHistoryDM element in data) {
        mData.add(ApplicationHistoryEntity(
            id: null,
            applicationStatus: element.applicationStatus,
            applicationId: applicationId,
            formUrl: element.formUrl,
            created: element.created,
            formSubmissionId: element.formSubmissionId,
            formId: element.formId,
            submittedBy: element.submittedBy,
            taskId: taskId));
      }
    }
    return mData;
  }
}
