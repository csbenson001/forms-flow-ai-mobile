class ListMembersResponse {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;

  ListMembersResponse({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
  });

  @override
  String toString() {
    return 'ListMembersResponse{id: $id, firstName: $firstName, lastName: $lastName, email: $email';
  }

  ListMembersResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        firstName = json['firstName'] as String?,
        lastName = json['lastName'] as String?,
        email = json['email'] as String?;

  Map<String, dynamic> toJson() =>
      {'id': id, 'firstName': firstName, 'lastName': lastName, 'email': email};
}
