class TaskConstants {
  // Filter Operator Values
  static const FILTER_OPERATOR_TYPE_EQUAL_VALUE = 'eq';
  static const FILTER_OPERATOR_GREATER_THAN_VALUE = 'gt';
  static const FILTER_OPERATOR_GREATER_THAN_EQUAL_TO_VALUE = 'gt';
  static const FILTER_OPERATOR_NOT_EQUAL_VALUE = 'neq';
  static const FILTER_OPERATOR_LESS_THAN_VALUE = 'lt';
  static const FILTER_OPERATOR_LESS_THAN_EQUAL_TO_VALUE = 'lte';
  static const FILTER_OPERATOR_LIKE_VALUE = 'like';
  static const FILTER_OPERATOR_AFTER_VALUE = 'after';
  static const FILTER_OPERATOR_BEFORE_VALUE = 'before';

  // Filter Operator Label values
  static const FILTER_OPERATOR_TYPE_EQUAL_OPERATOR = '=';
  static const FILTER_OPERATOR_GREATER_THAN_OPERATOR = '>';
  static const FILTER_OPERATOR_GREATER_THAN_EQUAL_TO_OPERATOR = '>=';
  static const FILTER_OPERATOR_NOT_EQUAL_OPERATOR = '!=';
  static const FILTER_OPERATOR_LESS_THAN_OPERATOR = '<';
  static const FILTER_OPERATOR_LESS_THAN_EQUAL_TO_OPERATOR = '<=';
  static const FILTER_OPERATOR_LIKE_OPERATOR = 'like';
  static const FILTER_OPERATOR_AFTER_OPERATOR = 'after';
  static const FILTER_OPERATOR_BEFORE_OPERATOR = 'before';

  // Filter Keys

  static const FILTER_KEY_TASK_VARIABLES = "taskVariables";
  static const FILTER_KEY_PROCESS_VARIABLES = "processVariables";
  static const FILTER_KEY_PROCESS_DEFINITION_NAME = "processDefinitionName";
  static const FILTER_KEY_ASSIGNEE = "assignee";
  static const FILTER_KEY_CANDIDATE_GROUP = "candidateGroup";
  static const FILTER_KEY_CANDIDATE_USER = "candidateUser";
  static const FILTER_KEY_NAME = "name";
  static const FILTER_KEY_DESCRIPTION = "description";
  static const FILTER_KEY_PRIORITY = "priority";
  static const FILTER_KEY_DUEDATE = "dueDate";
  static const FILTER_KEY_FOLLOWUP = "followUp";
  static const FILTER_KEY_CREATED = "created";

  static const List<dynamic> searchData = [
    {
      'label': 'Task Variables',
      'compares': [
        FILTER_OPERATOR_GREATER_THAN_OPERATOR,
        FILTER_OPERATOR_GREATER_THAN_EQUAL_TO_OPERATOR,
        FILTER_OPERATOR_TYPE_EQUAL_OPERATOR,
        FILTER_OPERATOR_NOT_EQUAL_OPERATOR,
        FILTER_OPERATOR_LESS_THAN_OPERATOR,
        FILTER_OPERATOR_LESS_THAN_EQUAL_TO_OPERATOR
      ],
      'key': FILTER_KEY_TASK_VARIABLES,
      'type': FilterSearchTypes.VARIABLES,
    },
    {
      'label': 'Process Variables',
      'compares': [
        FILTER_OPERATOR_GREATER_THAN_OPERATOR,
        FILTER_OPERATOR_GREATER_THAN_EQUAL_TO_OPERATOR,
        FILTER_OPERATOR_TYPE_EQUAL_OPERATOR,
        FILTER_OPERATOR_NOT_EQUAL_OPERATOR,
        FILTER_OPERATOR_LESS_THAN_OPERATOR,
        FILTER_OPERATOR_LESS_THAN_EQUAL_TO_OPERATOR
      ],
      'key': FILTER_KEY_PROCESS_VARIABLES,
      'type': FilterSearchTypes.VARIABLES,
    },
    {
      'label': 'Process Definition Name',
      'compares': [
        FILTER_OPERATOR_LIKE_OPERATOR,
        FILTER_OPERATOR_TYPE_EQUAL_OPERATOR
      ],
      'key': FILTER_KEY_PROCESS_DEFINITION_NAME,
      'type': FilterSearchTypes.VARIABLES,
      'values': ['processDefinitionNameLike', 'processDefinitionName']
    },
    {
      'label': 'Assignee',
      'compares': [
        FILTER_OPERATOR_LIKE_OPERATOR,
        FILTER_OPERATOR_TYPE_EQUAL_OPERATOR
      ],
      'values': ['assigneeLike', 'assignee'],
      'key': FILTER_KEY_ASSIGNEE,
      'type': FilterSearchTypes.VARIABLES
    },
    {
      'label': 'Candidate Group',
      'compares': [FILTER_OPERATOR_TYPE_EQUAL_OPERATOR],
      'values': ['candidateGroup'],
      'key': FILTER_KEY_CANDIDATE_GROUP,
      'type': FilterSearchTypes.VARIABLES,
    },
    {
      'label': 'Candidate User',
      'compares': [FILTER_OPERATOR_TYPE_EQUAL_OPERATOR],
      'values': ['candidateUser'],
      'key': FILTER_KEY_CANDIDATE_USER,
      'type': FilterSearchTypes.VARIABLES,
    },
    {
      'label': 'Name',
      'compares': [
        FILTER_OPERATOR_LIKE_OPERATOR,
        FILTER_OPERATOR_TYPE_EQUAL_OPERATOR
      ],
      'values': ['nameLike', 'name'],
      'key': FILTER_KEY_NAME,
      'type': FilterSearchTypes.NORMAL,
    },
    {
      'label': 'Description',
      'compares': [
        FILTER_OPERATOR_LIKE_OPERATOR,
        FILTER_OPERATOR_TYPE_EQUAL_OPERATOR
      ],
      'values': ['descriptionLike', 'description'],
      'key': FILTER_KEY_DESCRIPTION,
      'type': FilterSearchTypes.NORMAL,
    },
    {
      'label': 'Priority',
      'compares': [FILTER_OPERATOR_TYPE_EQUAL_OPERATOR],
      'values': ['priority'],
      'key': FILTER_KEY_PRIORITY,
      'type': FilterSearchTypes.NORMAL,
    },
    {
      'label': 'Due Date',
      'compares': [
        FILTER_OPERATOR_BEFORE_OPERATOR,
        FILTER_OPERATOR_AFTER_OPERATOR
      ],
      'values': ['due'],
      'key': FILTER_KEY_DUEDATE,
      'type': FilterSearchTypes.DATE,
    },
    {
      'label': 'Follow up Date',
      'compares': [
        FILTER_OPERATOR_BEFORE_OPERATOR,
        FILTER_OPERATOR_AFTER_OPERATOR
      ],
      'values': ['followUp'],
      'key': FILTER_KEY_FOLLOWUP,
      'type': FilterSearchTypes.DATE,
    },
    {
      'label': 'Created',
      'compares': [
        FILTER_OPERATOR_BEFORE_OPERATOR,
        FILTER_OPERATOR_AFTER_OPERATOR
      ],
      'values': ['created'],
      'key': FILTER_KEY_CREATED,
      'type': FilterSearchTypes.DATE,
    },
  ];
}

enum FilterSearchTypes {
  VARIABLES,

  DATE,

  NORMAL
}
