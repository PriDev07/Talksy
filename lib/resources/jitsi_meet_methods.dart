import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/resources/firestore_methods.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  final JitsiMeet _jitsiMeet = JitsiMeet();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();
  Future<void> createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    try {
      String name;
      if (username.isEmpty) {
        name = _authMethods.user!.displayName!;
      } else {
        name = username;
      }
      var options = JitsiMeetConferenceOptions(
        serverURL: "https://meet.ffmuc.net",
        room: roomName,
        userInfo: JitsiMeetUserInfo(
          displayName: name,
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
      _firestoreMethods.addToMeetingHistory(roomName);
      await _jitsiMeet.join(options);
    } catch (e) {
      print("Error creating or joining meeting: $e");
    }
  }
}
