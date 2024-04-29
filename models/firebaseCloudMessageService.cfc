component singleton {
  property name="settings" inject="coldbox:modulesettings:cbfirebasecm";


  /**
   * Function to send a message to a device identified by token
   *
   * @title   Message title
   * @message Message body to send
   * @token   Registry token of the device to send
   * @return  true/false if the message has been sent
   */

  boolean function send(
    required string title,
    required string message,
    required string token
  ){
    var apiurl = variables.settings.baseurl &
              variables.settings.projectid &
              "/messages:send";

    var httpMessage = {
      "message" = {
        "notification" = {
          "title"= arguments.title,
          "body" = arguments.message
        },
        "token"= arguments.token
      }
    }
    var myhttpService = new http(
      method    = "POST",
      url       = apiurl,
      encodeurl = false,
      charset   = "utf-8"
    );
    var fileInput = createObject( 'java', 'java.io.FileInputStream').init(settings.authfile);
    var googleCredentials = createObject( 'java', 'com.google.auth.oauth2.GoogleCredentials');
    var credentials = googleCredentials
                      .fromStream(fileInput)
                      .createScoped(["https://www.googleapis.com/auth/firebase.messaging"]);
    credentials.refresh();
    var access_token = credentials.getAccessToken().getTokenvalue();


    myhttpService.addParam( type="header", name="Content-Type", value="application/json; charset=UTF-8");
    myhttpService.addParam( type="header", name="Authorization", value="Bearer #access_token#")
    myhttpService.addParam( type="body", value=serializeJSON(httpMessage));

    return (myhttpService.send().getPrefix().status_code == 200);
  }


}
