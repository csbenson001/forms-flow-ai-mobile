var gForm = null;

    function createForm(json, data,formioInputData) {

     setLocalStorageData(formioInputData);
     Formio.setProjectUrl(formioInputData['formioProjectUrl']);
     Formio.setBaseUrl(formioInputData['formioProjectUrl']);
     Formio.setToken(formioInputData['formioToken']);
  /// Create form from formiojson with formOptions
     Formio.createForm(document.getElementById("formio"), json,
    {
    readOnly: formioInputData['readOnly']
    }
   ).then((form) => {
    gForm = form;
    form.submission = data;
    form.nosubmit = true;
    var formio = new Formio();
    formio.formUrl = formioInputData['formioResourceUrl'];
    form.formio = formio;

    // Formio onChange Callback method
    gForm.on("change", (component, value) => {
      let jsonData = JSON.stringify(form.submission.data);
    });

    // Formio onSubmit Callback method
      gForm.on('submit', (submission) => {
         let submissionData = form.submission.data;
         let formJsonData = {
         "eventType" :  "submissionEvent",
         "actionType" : "actionSubmitted",
         submissionData
         }
  window.flutter_inappwebview.callHandler('submissionData', formJsonData);
      });


   /// Formio onSubmitDone callback method
    gForm.on('submitDone', (submission) => {
     let jsonData = JSON.stringify(submission);
    window.flutter_inappwebview.callHandler('submissionData', jsonData);
    });

   /// Formio onCustomEvent callback method
      gForm.on("customEvent", (data) => {

           let submissionData = form.submission.data;
           let formJsonData = {
           "eventType" : 'customSubmissionEvent',
           "formActionType" : data['actionType'],
            "type" : data['type'],
           submissionData
           }
          window.flutter_inappwebview.callHandler('submissionData', formJsonData);
        });
  });
}

/// Function to set Local storage data values
  function setLocalStorageData(formioInputData){
  window.localStorage.setItem('UserDetails', formioInputData['userDetails']);
  window.localStorage.setItem('authToken', formioInputData['authToken']);
  window.localStorage.setItem('formioToken', formioInputData['formioToken']);
  window.localStorage.setItem('formioApiUrl', formioInputData['formioProjectUrl']);
  window.localStorage.setItem('formsflow.ai.url', formioInputData[' formsflowaiUrl']);
  window.localStorage.setItem('formsflow.ai.api.url', formioInputData[' formsflowaiApiUrl']);
  window.localStorage.setItem('bpmApiUrl', formioInputData['bpmApiUrl']);
  }

/// Function to update form json data
 function updateForm(json, data) {
  gForm.form = json;
 }

/// Function to update form json configuration
 function updateFormConfig(json, readOnly){
 gForm.options.readOnly = readOnly;
 gForm.redraw();
 }



 function loadForm(json, data, formioInputData) {

 setLocalStorageData(formioInputData);
 Formio.icons = 'fontawesome';
 Formio.createForm(document.getElementById('formio'), json,
  {
     readOnly: true
     }
 ).then(function(form) {
   // Default the submission.
     gForm = form;
   form.submission = {
     data: data['data']
   };
      form.nosubmit = true;
 });
}
