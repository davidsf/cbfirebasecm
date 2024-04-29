### CBFirebaseCM

Coldbox Module to communicate with Google Firebase Cloud Messaging using API de Firebase Cloud Messaging V1.


### Installation

Add Java Jars to `Application.cfc`

```
this.javaSettings = {
	loadPaths: directoryList(
		rootPath &  "modules/cbfirebasecm/lib",
		true,
		"array",
		"*jar"
	),
	loadColdFusionClassPath: true,
	reloadOnChange: false
};
```


### Settings

- projectid: Project Id in Google Firebase. You can find it in Google Firebase console: https://console.firebase.google.com/

You need to create a "Service Account" of type Json in the [Google Cloud Console](https://console.cloud.google.com/iam-admin/serviceaccounts/) of type JSON. 

Download the json an setup the path in the `authfile` setting.

Also, setup the `apikey` that you have generated.


### HOW TO USE IT

You can inject the firebasecmService and send an message to a mobile with the pushid token. 

```
property name="firebasecm" inject="firebaseCloudMessageService@cbfirebasecm";

firebasecm.send('Test', 'Test body', token);
```




