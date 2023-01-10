## formsflow.ai Mobile Application

formsflow.ai mobile application is a task management application developed with flutter version 3.3 and dart version 2.18.2.

Formsflow.ai mobile application uses formio version 2.1.0 to support online/offline form rendering.


## Table of Content

1. [Prerequisites](#prerequisites)
2. [Solution Setup](#solution-setup)
  - [Step 1 : Flutter Setup](#flutter-setup)
  - [Step 2 : Installation](#installation)
  - [Step 3 : Running the Application](#running-the-application)
3. [Logo change](#logo-change)
4. [Offline Access](#offline-access)
5. [Offline Form Submission](#offline-form-submission)


## Prerequisites

* Please make sure the [Formsflowai](https://github.com/AOT-Technologies/forms-flow-ai/blob/master/forms-flow-web) is up and running.
* Admin access to a [Keycloak](https://www.keycloak.org/) server. For local development / testing follow [Keycloak installation](https://github.com/AOT-Technologies/forms-flow-ai/tree/master/forms-flow-idm/keycloak).
* Please make sure the [Formio server](https://github.com/AOT-Technologies/forms-flow-ai/tree/master/forms-flow-forms) is up and running.


## Solution Setup

### Flutter Setup

Configure the Flutter development environment on your machine, see https://flutter.dev/docs/get-started/install

After completing the installation run the below command to check the flutter version

flutter --version

### Installation

* Make sure your current working directory is "forms-flow-ai".
* Rename the file [sample.env](./sample.env) to **.env**.
* Modify the environment variables in the newly created **.env** file if needed. Environment variables are given in the table below,
* **NOTE : {URLs} given inside the .env file should be changed to your host URL. Please take special care to identify the correct URLs**

> :information_source: Variables with trailing :triangular_flag_on_post: in below table should be updated in the .env file

Variable name | Meaning | Possible values | Default value |
 --- | --- | --- | ---
`FORMIO_DEFAULT_PROJECT_URL`:triangular_flag_on_post:|The URL of the form.io server||`http://{your-ip-address}`
`FORMSFLOW_API_URL`:triangular_flag_on_post:|formsflow Rest API URL||`http://{your-ip-address}/api`
`BPM_API_URL`:triangular_flag_on_post:|Camunda Rest API URL||`http://{your-ip-address}/camunda`
`KEYCLOAK_URL`:triangular_flag_on_post:| URL to your Keycloak server || `http://{your-ip-address}`
`KEYCLOAK_URL_REALM`|	The Keycloak realm to use|eg. forms-flow-ai | `forms-flow-ai`
`KEYCLOAK_WEB_CLIENTID`|Your Keycloak Client ID within the realm| eg. forms-flow-mobile | `forms-flow-mobile`
`WEBSOCKET_ENCRYPT_KEY`|Camunda task event streaming. AES encryption of token| | `giert989jkwrgb@DR55`
`WEB_BASE_CUSTOM_URL`|Clients can use WEB_BASE_CUSTOM_URL env variable to provide their custom URL |
|`FORMIO_JWT_SECRET`|forms-flow-forms jwt secret| |`--- change me now ---`

### Running the application

    For installing dependencies run command: $ flutter pub get
    
    For creating the generated files run: $ flutter pub run build_runner build
    
    If you have a conflict in generated files run command : $ flutter pub run build_runner build --delete-conflicting-outputs
    
    For running the app run command : $ flutter run

### Logo Change

     For Android:
     
     update mipmap folders launcher images in android with your custom -> app -> src -> main -> res -> mipmap
     
     For iOS:
     
     update Asset Appicon with your custom logo

### Offline Access

Formsflowai mobile app supports complete offline access.

Only tasks assigned to the loggedin user will be stored and rendered when there is no
internet connectivity.

Users can submit the forms or update the tasks due-date, follow-up date offline.

To enable offline access please update the following in your keycloak realm

Variable name | Meaning | Possible values | Expected value |
   --- | --- | --- | ---
`Offline Session Max Limited`:triangular_flag_on_post:|To enable offline session||`true`

    To set max offline session time please update the following in your realm-client

Variable name | Meaning | Possible values | Expected value |
   --- | --- | --- | ---
`Client Offline Session Max`:triangular_flag_on_post:|Set max offline time||`higher than access token's expiry`


### Offline form submission

    To implement offline form submission in the formsflowai mobile app please update the forms in formsflow-web following the below steps

**Step 1**

    Navigate to Forms Page

**Step 2**

    Select the form and click on “View/Edit Form” button

**Step 3**

    Click the Edit Form button

**Step 4**

    Add the below code snippet in your custom action button click
    
    const submissionId = form._submission._id;
    const formDataReqUrl = form.formio.formUrl+'/submission/'+submissionId;const formDataReqObj1 =  {  "_id": submissionId,  "data": data};
    const formio = new Formio(formDataReqUrl);
    formio.saveSubmission(formDataReqObj1).then( result => {
    form.emit('customEvent', {
          type: "actionComplete",   
          component: component,
          actionType:data.managerActionType
          }); 
      }).catch((error)=>{
    //Error callback on not Save
    form.emit('customEvent', {
          type: "actionError",   
          component: component,
          actionType:data.managerActionType
      }); 
});

## forms-flow-web Events
> This section elaborates events used in forms-flow-web.
>  The Form.io renderer uses the [EventEmitter3](https://github.com/primus/eventemitter3) library to manage all of the event handling that occurs within the renderer.
>  Custom events are triggered for button components and are fired when they are clicked. More details are [here](https://docs.form.io/developers/form-renderer#form-events)
## Events
| Name | Description  &nbsp;&nbsp;&nbsp;| Arguments &nbsp;&nbsp;&nbsp; | Example |
| --- | --- | --- |--- |
| `reloadTasks` | <li>Used in the task page</li><li>Triggered for button components</li><li>Refresh the Task List  and remove the selected  task from RHS.</li>  | <li> type:The configured event type </li> |form.emit('customEvent', {  type: "reloadTasks"}); |
| `reloadCurrentTask` | <li>Used in the task page</li><li>Triggered for button components</li> <li>Refreshes the current task selected</li> |<li>type:The configured event type</li>|form.emit('customEvent', { type: "reloadCurrentTask"}); |
| `customSubmitDone` | <li>Used in the create form page</li><li>Triggered for button components</li><li>Similar to submit button to implement custom logic</li> |<li>type:The configured event type</li>|form.emit('customEvent', {type: "customSubmitDone"}); |
| `actionComplete` | <li>Triggered for button components</li> |<li>type:The configured event type</li><li>component:The component json</li><li>actionType: Form submit action values</li> | form.emit('customEvent', { type: "actionComplete",    component: component, actionType: actionType }); |
| `actionError` | <li>Triggrered on a failed form submission</li><li>Triggered for button components</li><li>Triggers callback when the form submission is failed</li> |<li>type:The configured event type</li>|form.emit('customEvent', {type: "actionError"}); |   
| `cancelSubmission` | <li>Used in the create form page</li><li>Triggered for button components</li><li>Used for Canceling current submission and goin back to Form List Page</li> |<li>type:The configured event type</li>|form.emit('customEvent', {type: "cancelSubmission"}); |    