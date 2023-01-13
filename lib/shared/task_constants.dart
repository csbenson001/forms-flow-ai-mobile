class TaskConstants {
  // Filter Operator Values
  static const filterOperatorTypeEqualValue = 'eq';
  static const filterOperatorGreaterThanValue = 'gt';
  static const filterOperatorGreaterThanEqualToValue = 'gt';
  static const filterOperatorNotEqualValue = 'neq';
  static const filterOperatorLessThanValue = 'lt';
  static const filterOperatorLessThanEqualToValue = 'lte';
  static const filterOperatorLikeValue = 'like';
  static const filterOperatorAfterValue = 'after';
  static const filterOperatorBeforeValue = 'before';

  // Filter Operator Label values
  static const filterOperatorTypeEqualOperator = '=';
  static const filterOperatorGreaterThanOperator = '>';
  static const filterOperatorGreaterThanEqualToOperator = '>=';
  static const filterOperatorNotEqualOperator = '!=';
  static const filterOperatorLessThanOperator = '<';
  static const filterOperatorLessThanEqualToOperator = '<=';
  static const filterOperatorLikeOperator = 'like';
  static const filterOperatorAfterOperator = 'after';
  static const filterOperatorBeforeOperator = 'before';

  // Filter Keys

  static const filterKeyTaskVariables = "taskVariables";
  static const filterKeyProcessVariables = "processVariables";
  static const filterKeyProcessDefinitionName = "processDefinitionName";
  static const filterKeyAssignee = "assignee";
  static const filterKeyCandidateGroup = "candidateGroup";
  static const filterKeyCandidateUser = "candidateUser";
  static const filterKeyName = "name";
  static const filterKeyDescription = "description";
  static const filterKeyPriority = "priority";
  static const filterKeyDuedate = "dueDate";
  static const filterKeyFollowup = "followUp";
  static const filterKeyCreated = "created";

  static const List<dynamic> searchData = [
    {
      'label': 'Task Variables',
      'compares': [
        filterOperatorGreaterThanOperator,
        filterOperatorGreaterThanEqualToOperator,
        filterOperatorTypeEqualOperator,
        filterOperatorNotEqualOperator,
        filterOperatorLessThanOperator,
        filterOperatorLessThanEqualToOperator
      ],
      'key': filterKeyTaskVariables,
      'type': FilterSearchTypes.variables,
    },
    {
      'label': 'Process Variables',
      'compares': [
        filterOperatorGreaterThanOperator,
        filterOperatorGreaterThanEqualToOperator,
        filterOperatorTypeEqualOperator,
        filterOperatorNotEqualOperator,
        filterOperatorLessThanOperator,
        filterOperatorLessThanEqualToOperator
      ],
      'key': filterKeyProcessVariables,
      'type': FilterSearchTypes.variables,
    },
    {
      'label': 'Process Definition Name',
      'compares': [filterOperatorLikeOperator, filterOperatorTypeEqualOperator],
      'key': filterKeyProcessDefinitionName,
      'type': FilterSearchTypes.variables,
      'values': ['processDefinitionNameLike', 'processDefinitionName']
    },
    {
      'label': 'Assignee',
      'compares': [filterOperatorLikeOperator, filterOperatorTypeEqualOperator],
      'values': ['assigneeLike', 'assignee'],
      'key': filterKeyAssignee,
      'type': FilterSearchTypes.variables
    },
    {
      'label': 'Candidate Group',
      'compares': [filterOperatorTypeEqualOperator],
      'values': ['candidateGroup'],
      'key': filterKeyCandidateGroup,
      'type': FilterSearchTypes.variables,
    },
    {
      'label': 'Candidate User',
      'compares': [filterOperatorTypeEqualOperator],
      'values': ['candidateUser'],
      'key': filterKeyCandidateUser,
      'type': FilterSearchTypes.variables,
    },
    {
      'label': 'Name',
      'compares': [filterOperatorLikeOperator, filterOperatorTypeEqualOperator],
      'values': ['nameLike', 'name'],
      'key': filterKeyName,
      'type': FilterSearchTypes.normal,
    },
    {
      'label': 'Description',
      'compares': [filterOperatorLikeOperator, filterOperatorTypeEqualOperator],
      'values': ['descriptionLike', 'description'],
      'key': filterKeyDescription,
      'type': FilterSearchTypes.normal,
    },
    {
      'label': 'Priority',
      'compares': [filterOperatorTypeEqualOperator],
      'values': ['priority'],
      'key': filterKeyPriority,
      'type': FilterSearchTypes.normal,
    },
    {
      'label': 'Due Date',
      'compares': [filterOperatorBeforeOperator, filterOperatorAfterOperator],
      'values': ['due'],
      'key': filterKeyDuedate,
      'type': FilterSearchTypes.date,
    },
    {
      'label': 'Follow up Date',
      'compares': [filterOperatorBeforeOperator, filterOperatorAfterOperator],
      'values': ['followUp'],
      'key': filterKeyFollowup,
      'type': FilterSearchTypes.date,
    },
    {
      'label': 'Created',
      'compares': [filterOperatorBeforeOperator, filterOperatorAfterOperator],
      'values': ['created'],
      'key': filterKeyCreated,
      'type': FilterSearchTypes.date,
    },
  ];
}

enum FilterSearchTypes {
  variables,

  date,

  normal
}
