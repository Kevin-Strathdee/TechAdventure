import 'package:openid_client/openid_client_io.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tech_adventure/main.dart';
import 'package:url_launcher/url_launcher.dart';

const authenticateUrl =
    "https://login.microsoftonline.com/e6dbe219-77ef-4b6a-af83-f9de7de08923/v2.0";
const clientId = "85e3244b-298a-4ddd-82c5-9ed85a69ce5e";
const scopes = ["https://japomo.techadventure2023.jambit.space/profile"];

class CredentialUtil {
  CredentialUtil() {
    init();
  }

  late Issuer issuer;
  late Client client;
  late SharedPreferences sharedPreferences;

  void init() async {
    issuer = await Issuer.discover(Uri.parse(authenticateUrl));
    client = Client(issuer, clientId);
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> authenticate() async {
    // create a function to open a browser with an url
    urlLauncher(String url) async {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    }

    // create an authenticator
    var authenticator = Authenticator(client,
        scopes: scopes, port: 4000, urlLancher: urlLauncher);

    // starts the authentication
    var credentials = await authenticator.authorize();

    // close the webview when finished
    closeInAppWebView();

    saveToken(credentials);
    // return the user info
    TokenResponse tokenResponse = await credentials.getTokenResponse();
    return tokenResponse.accessToken != null;
  }

  Future<Credential> refreshCredential() async {
    Credential credential = client.createCredential(
        refreshToken: sharedPreferences.getString(refreshTokenKey));
    saveToken(credential);
    return credential;
  }

  void saveToken(Credential credential) async {
    TokenResponse tokenResponse = await credential.getTokenResponse();
    if (tokenResponse.accessToken != null) {
      sharedPreferences.setString(accessTokenKey, tokenResponse.accessToken!);
    }
    if (tokenResponse.refreshToken != null) {
      sharedPreferences.setString(refreshTokenKey, tokenResponse.refreshToken!);
    }
  }

  String? getAccessToken() {
    return sharedPreferences.getString(accessTokenKey);
  }
}
