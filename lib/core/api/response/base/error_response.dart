class ErrorResponse {
  List<Errors>? errors;

  ErrorResponse({this.errors});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    if (json['errors'] != null) {
      errors = List<Errors>.empty(growable: true);
      json['errors'].forEach((v) {
        errors!.add(Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (errors != null) {
      data['errors'] = errors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Errors {
  List<Locations>? locations;
  String? message;
  List<String>? path;

  Errors({this.locations, this.message, this.path});

  Errors.fromJson(Map<String, dynamic> json) {
    if (json['locations'] != null) {
      locations = List<Locations>.empty(growable: true);
      json['locations'].forEach((v) {
        locations!.add(Locations.fromJson(v));
      });
    }
    message = json['message'];
    path = json['path'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (locations != null) {
      data['locations'] = locations!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['path'] = path;
    return data;
  }
}

class Locations {
  int? column;
  int? line;

  Locations({this.column, this.line});

  Locations.fromJson(Map<String, dynamic> json) {
    column = json['column'];
    line = json['line'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['column'] = column;
    data['line'] = line;
    return data;
  }
}
