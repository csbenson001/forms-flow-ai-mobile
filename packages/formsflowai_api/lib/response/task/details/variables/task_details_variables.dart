class TaskDetailsVariableResponse {
  TaskDetailsVariableResponse({
    required this.sendbackBy,
    required this.clerkActionType,
    required this.natureOfBusiness,
    required this.isBuildingPermitRequired,
    required this.applicantsSignature,
    required this.eMail,
    required this.typeOfBussiness,
    required this.businessWebsite,
    required this.applicationStatus,
    required this.formUrl,
    required this.formName,
    required this.action,
    required this.isThisAHomeBasedBussiness,
    required this.businessAddress,
    required this.managerActionType,
    required this.alternateEmail,
    required this.doYouNeedInterMuncipalLicence,
    required this.proposedBusinessStartDate,
    required this.clerkComments1,
    required this.submissionDate,
    required this.businessOperatingName,
    required this.applicantsNameIndividualCompletingForm,
    required this.deleteReason,
    required this.partnershipNameSIfYouPlanToOperateTheBusinessWithOneOrMorePartners,
    required this.numberOfEmployees,
    required this.mailingAddress,
    required this.submitterName,
    required this.businessPhone,
    required this.applicationId,
    required this.dateSigned,
  });
  late final SendbackBy sendbackBy;
  late final ClerkActionType clerkActionType;
  late final NatureOfBusiness natureOfBusiness;
  late final IsBuildingPermitRequired isBuildingPermitRequired;
  late final ApplicantsSignature applicantsSignature;
  late final EMail eMail;
  late final TypeOfBussiness typeOfBussiness;
  late final BusinessWebsite businessWebsite;
  late final ApplicationStatus applicationStatus;
  late final FormUrl formUrl;
  late final FormName formName;
  late final Action action;
  late final IsThisAHomeBasedBussiness isThisAHomeBasedBussiness;
  late final BusinessAddress businessAddress;
  late final ManagerActionType managerActionType;
  late final AlternateEmail alternateEmail;
  late final DoYouNeedInterMuncipalLicence doYouNeedInterMuncipalLicence;
  late final ProposedBusinessStartDate proposedBusinessStartDate;
  late final ClerkComments1 clerkComments1;
  late final SubmissionDate submissionDate;
  late final BusinessOperatingName businessOperatingName;
  late final ApplicantsNameIndividualCompletingForm
      applicantsNameIndividualCompletingForm;
  late final DeleteReason deleteReason;
  late final PartnershipNameSIfYouPlanToOperateTheBusinessWithOneOrMorePartners
      partnershipNameSIfYouPlanToOperateTheBusinessWithOneOrMorePartners;
  late final NumberOfEmployees numberOfEmployees;
  late final MailingAddress mailingAddress;
  late final SubmitterName submitterName;
  late final BusinessPhone businessPhone;
  late final ApplicationId applicationId;
  late final DateSigned dateSigned;

  TaskDetailsVariableResponse.fromJson(Map<String, dynamic> json) {
    sendbackBy = SendbackBy.fromJson(json['sendback_by']);
    clerkActionType = ClerkActionType.fromJson(json['clerkActionType']);
    natureOfBusiness = NatureOfBusiness.fromJson(json['natureOfBusiness']);
    isBuildingPermitRequired =
        IsBuildingPermitRequired.fromJson(json['isBuildingPermitRequired']);
    applicantsSignature =
        ApplicantsSignature.fromJson(json['applicantsSignature']);
    eMail = EMail.fromJson(json['eMail']);
    typeOfBussiness = TypeOfBussiness.fromJson(json['typeOfBussiness']);
    businessWebsite = BusinessWebsite.fromJson(json['businessWebsite']);
    applicationStatus = ApplicationStatus.fromJson(json['applicationStatus']);
    formUrl = FormUrl.fromJson(json['formUrl']);
    formName = FormName.fromJson(json['formName']);
    action = Action.fromJson(json['action']);
    isThisAHomeBasedBussiness =
        IsThisAHomeBasedBussiness.fromJson(json['isThisAHomeBasedBussiness']);
    businessAddress = BusinessAddress.fromJson(json['businessAddress']);
    managerActionType = ManagerActionType.fromJson(json['managerActionType']);
    alternateEmail = AlternateEmail.fromJson(json['alternateEmail']);
    doYouNeedInterMuncipalLicence = DoYouNeedInterMuncipalLicence.fromJson(
        json['doYouNeedInterMuncipalLicence']);
    proposedBusinessStartDate =
        ProposedBusinessStartDate.fromJson(json['proposedBusinessStartDate']);
    clerkComments1 = ClerkComments1.fromJson(json['clerkComments1']);
    submissionDate = SubmissionDate.fromJson(json['submissionDate']);
    businessOperatingName =
        BusinessOperatingName.fromJson(json['businessOperatingName']);
    applicantsNameIndividualCompletingForm =
        ApplicantsNameIndividualCompletingForm.fromJson(
            json['applicantsNameIndividualCompletingForm']);
    deleteReason = DeleteReason.fromJson(json['deleteReason']);
    partnershipNameSIfYouPlanToOperateTheBusinessWithOneOrMorePartners =
        PartnershipNameSIfYouPlanToOperateTheBusinessWithOneOrMorePartners
            .fromJson(json[
                'partnershipNameSIfYouPlanToOperateTheBusinessWithOneOrMorePartners']);
    numberOfEmployees = NumberOfEmployees.fromJson(json['numberOfEmployees']);
    mailingAddress = MailingAddress.fromJson(json['mailingAddress']);
    submitterName = SubmitterName.fromJson(json['submitterName']);
    businessPhone = BusinessPhone.fromJson(json['businessPhone']);
    applicationId = ApplicationId.fromJson(json['applicationId']);
    dateSigned = DateSigned.fromJson(json['dateSigned']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sendback_by'] = sendbackBy.toJson();
    _data['clerkActionType'] = clerkActionType.toJson();
    _data['natureOfBusiness'] = natureOfBusiness.toJson();
    _data['isBuildingPermitRequired'] = isBuildingPermitRequired.toJson();
    _data['applicantsSignature'] = applicantsSignature.toJson();
    _data['eMail'] = eMail.toJson();
    _data['typeOfBussiness'] = typeOfBussiness.toJson();
    _data['businessWebsite'] = businessWebsite.toJson();
    _data['applicationStatus'] = applicationStatus.toJson();
    _data['formUrl'] = formUrl.toJson();
    _data['formName'] = formName.toJson();
    _data['action'] = action.toJson();
    _data['isThisAHomeBasedBussiness'] = isThisAHomeBasedBussiness.toJson();
    _data['businessAddress'] = businessAddress.toJson();
    _data['managerActionType'] = managerActionType.toJson();
    _data['alternateEmail'] = alternateEmail.toJson();
    _data['doYouNeedInterMuncipalLicence'] =
        doYouNeedInterMuncipalLicence.toJson();
    _data['proposedBusinessStartDate'] = proposedBusinessStartDate.toJson();
    _data['clerkComments1'] = clerkComments1.toJson();
    _data['submissionDate'] = submissionDate.toJson();
    _data['businessOperatingName'] = businessOperatingName.toJson();
    _data['applicantsNameIndividualCompletingForm'] =
        applicantsNameIndividualCompletingForm.toJson();
    _data['deleteReason'] = deleteReason.toJson();
    _data['partnershipNameSIfYouPlanToOperateTheBusinessWithOneOrMorePartners'] =
        partnershipNameSIfYouPlanToOperateTheBusinessWithOneOrMorePartners
            .toJson();
    _data['numberOfEmployees'] = numberOfEmployees.toJson();
    _data['mailingAddress'] = mailingAddress.toJson();
    _data['submitterName'] = submitterName.toJson();
    _data['businessPhone'] = businessPhone.toJson();
    _data['applicationId'] = applicationId.toJson();
    _data['dateSigned'] = dateSigned.toJson();
    return _data;
  }
}

class SendbackBy {
  SendbackBy({
    required this.type,
    this.value,
    required this.valueInfo,
  });
  late final String type;
  late final Null value;
  late final ValueInfo valueInfo;

  SendbackBy.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = null;
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class ValueInfo {
  ValueInfo();

  ValueInfo.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class ClerkActionType {
  ClerkActionType({
    required this.type,
    this.value,
    required this.valueInfo,
  });
  late final String type;
  late final Null value;
  late final ValueInfo valueInfo;

  ClerkActionType.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = null;
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class NatureOfBusiness {
  NatureOfBusiness({
    required this.type,
    required this.value,
    required this.valueInfo,
  });
  late final String type;
  late final String value;
  late final ValueInfo valueInfo;

  NatureOfBusiness.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class IsBuildingPermitRequired {
  IsBuildingPermitRequired({
    required this.type,
    required this.value,
    required this.valueInfo,
  });
  late final String type;
  late final String value;
  late final ValueInfo valueInfo;

  IsBuildingPermitRequired.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class ApplicantsSignature {
  ApplicantsSignature({
    required this.type,
    this.value,
    required this.valueInfo,
  });
  late final String type;
  late final Null value;
  late final ValueInfo valueInfo;

  ApplicantsSignature.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = null;
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class EMail {
  EMail({
    required this.type,
    required this.value,
    required this.valueInfo,
  });
  late final String type;
  late final String value;
  late final ValueInfo valueInfo;

  EMail.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class TypeOfBussiness {
  TypeOfBussiness({
    required this.type,
    required this.value,
    required this.valueInfo,
  });
  late final String type;
  late final String value;
  late final ValueInfo valueInfo;

  TypeOfBussiness.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class BusinessWebsite {
  BusinessWebsite({
    required this.type,
    this.value,
    required this.valueInfo,
  });
  late final String type;
  late final Null value;
  late final ValueInfo valueInfo;

  BusinessWebsite.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = null;
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class ApplicationStatus {
  ApplicationStatus({
    required this.type,
    required this.value,
    required this.valueInfo,
  });
  late final String type;
  late final String value;
  late final ValueInfo valueInfo;

  ApplicationStatus.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class FormUrl {
  FormUrl({
    required this.type,
    required this.value,
    required this.valueInfo,
  });
  late final String type;
  late final String value;
  late final ValueInfo valueInfo;

  FormUrl.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class FormName {
  FormName({
    required this.type,
    required this.value,
    required this.valueInfo,
  });
  late final String type;
  late final String value;
  late final ValueInfo valueInfo;

  FormName.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class Action {
  Action({
    required this.type,
    required this.value,
    required this.valueInfo,
  });
  late final String type;
  late final String value;
  late final ValueInfo valueInfo;

  Action.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class IsThisAHomeBasedBussiness {
  IsThisAHomeBasedBussiness({
    required this.type,
    required this.value,
    required this.valueInfo,
  });
  late final String type;
  late final String value;
  late final ValueInfo valueInfo;

  IsThisAHomeBasedBussiness.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class BusinessAddress {
  BusinessAddress({
    required this.type,
    this.value,
    required this.valueInfo,
  });
  late final String type;
  late final Null value;
  late final ValueInfo valueInfo;

  BusinessAddress.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = null;
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class ManagerActionType {
  ManagerActionType({
    required this.type,
    this.value,
    required this.valueInfo,
  });
  late final String type;
  late final Null value;
  late final ValueInfo valueInfo;

  ManagerActionType.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = null;
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class AlternateEmail {
  AlternateEmail({
    required this.type,
    this.value,
    required this.valueInfo,
  });
  late final String type;
  late final Null value;
  late final ValueInfo valueInfo;

  AlternateEmail.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = null;
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class DoYouNeedInterMuncipalLicence {
  DoYouNeedInterMuncipalLicence({
    required this.type,
    required this.value,
    required this.valueInfo,
  });
  late final String type;
  late final String value;
  late final ValueInfo valueInfo;

  DoYouNeedInterMuncipalLicence.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class ProposedBusinessStartDate {
  ProposedBusinessStartDate({
    required this.type,
    required this.value,
    required this.valueInfo,
  });
  late final String type;
  late final String value;
  late final ValueInfo valueInfo;

  ProposedBusinessStartDate.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class ClerkComments1 {
  ClerkComments1({
    required this.type,
    this.value,
    required this.valueInfo,
  });
  late final String type;
  late final Null value;
  late final ValueInfo valueInfo;

  ClerkComments1.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = null;
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class SubmissionDate {
  SubmissionDate({
    required this.type,
    required this.value,
    required this.valueInfo,
  });
  late final String type;
  late final String value;
  late final ValueInfo valueInfo;

  SubmissionDate.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class BusinessOperatingName {
  BusinessOperatingName({
    required this.type,
    required this.value,
    required this.valueInfo,
  });
  late final String type;
  late final String value;
  late final ValueInfo valueInfo;

  BusinessOperatingName.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class ApplicantsNameIndividualCompletingForm {
  ApplicantsNameIndividualCompletingForm({
    required this.type,
    required this.value,
    required this.valueInfo,
  });
  late final String type;
  late final String value;
  late final ValueInfo valueInfo;

  ApplicantsNameIndividualCompletingForm.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class DeleteReason {
  DeleteReason({
    required this.type,
    required this.value,
    required this.valueInfo,
  });
  late final String type;
  late final String value;
  late final ValueInfo valueInfo;

  DeleteReason.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class PartnershipNameSIfYouPlanToOperateTheBusinessWithOneOrMorePartners {
  PartnershipNameSIfYouPlanToOperateTheBusinessWithOneOrMorePartners({
    required this.type,
    this.value,
    required this.valueInfo,
  });
  late final String type;
  late final Null value;
  late final ValueInfo valueInfo;

  PartnershipNameSIfYouPlanToOperateTheBusinessWithOneOrMorePartners.fromJson(
      Map<String, dynamic> json) {
    type = json['type'];
    value = null;
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class NumberOfEmployees {
  NumberOfEmployees({
    required this.type,
    required this.value,
    required this.valueInfo,
  });
  late final String type;
  late final int value;
  late final ValueInfo valueInfo;

  NumberOfEmployees.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class MailingAddress {
  MailingAddress({
    required this.type,
    this.value,
    required this.valueInfo,
  });
  late final String type;
  late final Null value;
  late final ValueInfo valueInfo;

  MailingAddress.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = null;
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class SubmitterName {
  SubmitterName({
    required this.type,
    required this.value,
    required this.valueInfo,
  });
  late final String type;
  late final String value;
  late final ValueInfo valueInfo;

  SubmitterName.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class BusinessPhone {
  BusinessPhone({
    required this.type,
    this.value,
    required this.valueInfo,
  });
  late final String type;
  late final Null value;
  late final ValueInfo valueInfo;

  BusinessPhone.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = null;
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class ApplicationId {
  ApplicationId({
    required this.type,
    required this.value,
    required this.valueInfo,
  });
  late final String type;
  late final String value;
  late final ValueInfo valueInfo;

  ApplicationId.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}

class DateSigned {
  DateSigned({
    required this.type,
    required this.value,
    required this.valueInfo,
  });
  late final String type;
  late final String value;
  late final ValueInfo valueInfo;

  DateSigned.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
    valueInfo = ValueInfo.fromJson(json['valueInfo']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    _data['valueInfo'] = valueInfo.toJson();
    return _data;
  }
}
