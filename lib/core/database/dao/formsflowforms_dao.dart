import 'package:floor/floor.dart';

import '../entity/form_entity.dart';

/// [FormsFlowFormsDao] class contains methods
/// to insert, update, fetch and delete forms data
@dao
abstract class FormsFlowFormsDao {
  /// Function to fetch forms by id
  /// Input Parameters
  /// [ID]
  /// ---> Returns [FormEntity]?
  @Query('SELECT * FROM formsflowform WHERE id = :id')
  Future<FormEntity?> fetchFormById(int id);

  /// Function to fetch forms by formId
  /// Input Parameters
  /// [FORMID]
  /// ---> Returns [FormEntity]?
  @Query('SELECT * FROM formsflowform WHERE formId = :formId')
  Future<FormEntity?> fetchFormByFormId(String formId);

  /// Function to fetch all forms
  /// ---> Returns [List<FormEntity>]
  @Query('SELECT * FROM formsflowform')
  Future<List<FormEntity>> fetchAllForms();

  /// Function to insert form
  /// Input Parameters
  /// [FormEntity]
  @insert
  Future<void> insertForm(FormEntity form);

  /// Function to insert all forms
  /// Input Parameters
  /// [List<FormEntity>]
  @insert
  Future<void> insertForms(List<FormEntity> forms);

  /// Function to update form entity
  /// Input Parameters
  /// [FormEntity]
  @update
  Future<void> updateForm(FormEntity form);

  /// Function to delete form entity
  /// Input Parameters
  /// [FormEntity]
  @delete
  Future<void> deleteForm(FormEntity form);

  /// Function to delete all forms
  @Query('DELETE FROM formsflowform')
  Future<void> deleteAllForms();
}
