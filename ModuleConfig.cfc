component {

	// Module Properties
	this.title              = "cbfirebasecm";
	this.author             = "David Sedeño";
	this.description        = "Coldbox Module to talk with Firebase Cloud Messaging API V1";
	this.version            = "1.0.0";
	this.modelNamespace     = "cbfirebasecm";

	/**
	 * Configure the module
	 */
	function configure(){
		// module settings - stored in modules.name.settings
    		settings = {
			baseurl = 'https://fcm.googleapis.com/v1/projects/',
			projectid = '',
			apiKey = '',
			authfile = ''
		};
	}
}
