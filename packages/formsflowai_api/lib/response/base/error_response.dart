class ErrorResponse {
  List<Errors>? errors;

  ErrorResponse({this.errors});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    if (json['errors'] != null) {
      errors = new List<Errors>.empty(growable: true);
      json['errors'].forEach((v) {
        errors!.add(new Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.errors != null) {
      data['errors'] = this.errors!.map((v) => v.toJson()).toList();
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
      locations = new List<Locations>.empty(growable: true);
      json['locations'].forEach((v) {
        locations!.add(new Locations.fromJson(v));
      });
    }
    message = json['message'];
    path = json['path'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.locations != null) {
      data['locations'] = this.locations!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['path'] = this.path;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['column'] = this.column;
    data['line'] = this.line;
    return data;
  }
}
