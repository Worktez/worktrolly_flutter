import 'package:firebase_auth/firebase_auth.dart';

class UserInterface {
  late String? uid;
  late String? photoURL;
  late String? displayName;
  late String? email;
  late String? phoneNumber;
  late String? providerId;

  late String? appKey;
  late String? teamId;
  late String? aboutMe;
  late String? appTheme;
  late String? githubProfile;
  late String? linkedInProfile;
  late String? dateOfJoining;

  setUser(User? user) {
    if (user != null) {
      uid = user.uid;
      photoURL = user.photoURL;
      displayName = user.displayName;
      email = user.email;
      phoneNumber = user.phoneNumber;
      providerId = user.providerData[0].providerId;
    }
  }

  setUserAppSetting(Map<String, dynamic> result) {
    if (result.isNotEmpty) {
      appKey = result['AppKey'];
      teamId = result['TeamId'];
      aboutMe = result['AboutMe'];
      githubProfile = result['GithubProfile'];
      linkedInProfile = result['LinkedInProfile'];
      dateOfJoining = result['dateOfJoining'];
    }
  }

  getAppKey() {
    return appKey;
  }
}

UserInterface userInterface = new UserInterface();
