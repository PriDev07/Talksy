import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:zoom_clone/resources/auth_methods.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  final JitsiMeet _jitsiMeet = JitsiMeet();

  Future<void> createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
  }) async {
    try {
      var options = JitsiMeetConferenceOptions(
        serverURL: "https://meet.ffmuc.net",
        room: roomName,
        userInfo: JitsiMeetUserInfo(
          displayName: _authMethods.user!.displayName,
          email: _authMethods.user!.email,
          avatar: _authMethods.user!.photoURL,
        ),
        configOverrides: {
          "startWithAudioMuted": isAudioMuted,
          "startWithVideoMuted": isVideoMuted,
          "welcomePageEnabled": false,
        },
        featureFlags: {"unsaferoomwarning.enabled": false},
      );

      await _jitsiMeet.join(options);
    } catch (e) {
      print("Error creating or joining meeting: $e");
    }
  }
}
