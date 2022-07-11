import 'package:floor/floor.dart';

import '../entity/form_entity.dart';

@dao
abstract class FormsFlowFormsDao {
  @Query('SELECT * FROM formsflowform WHERE id = :id')
  Future<FormEntity?> findFormById(int id);

  @Query('SELECT * FROM formsflowform WHERE formId = :formId')
  Future<FormEntity?> findFormByFormId(String formId);

  @Query('SELECT * FROM formsflowform')
  Future<List<FormEntity>> fetchAllForms();

  @Query('SELECT COUNT(*) FROM formsflowform')
  Future<int?> getCount();

  @insert
  Future<void> insertForm(FormEntity Form);

  @insert
  Future<void> insertForms(List<FormEntity> Forms);

  @update
  Future<void> updateForm(FormEntity Form);

  @update
  Future<void> updateForms(List<FormEntity> Form);

  @delete
  Future<void> deleteForm(FormEntity Form);

  @delete
  Future<void> deleteForms(List<FormEntity> Forms);

  @Query('DELETE FROM formsflowform')
  Future<void> deleteAllForms();
}
