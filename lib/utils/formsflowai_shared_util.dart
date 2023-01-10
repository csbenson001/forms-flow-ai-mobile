import '../core/api/response/processdefinition/process_definition_response.dart';

class SharedUtil {
  static String? getProcessKey(
      {required String processName,
      required List<ProcessDefinitionResponse>? definitionResponse}) {
    if (definitionResponse != null && definitionResponse.isNotEmpty) {
      var data = definitionResponse.firstWhere((element) =>
          processName.toLowerCase() == element.name.toString().toLowerCase());
      return data.key;
    } else {
      return '';
    }
  }
}
