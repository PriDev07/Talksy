import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/jitsi_meet_methods.dart';
import 'package:zoom_clone/widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  void createNewMeeting() async {
    var random = Random();
    String RoomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
      roomName: RoomName,
      isAudioMuted: true,
      isVideoMuted: true,
    );
  }

  void JoinMeeting(BuildContext context) async {
    Navigator.pushNamed((context), "/video-call");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeMeetingButton(
              onPressed: createNewMeeting,
              text: "New Meeting",
              icon: Icons.videocam,
            ),
            HomeMeetingButton(
              onPressed: ()=> JoinMeeting(context),
              text: "Join Meeting",
              icon: Icons.add_box_rounded,
            ),
            HomeMeetingButton(
              onPressed: () {},
              text: "Schedule",
              icon: Icons.schedule,
            ),
            HomeMeetingButton(
              onPressed: () {},
              text: "Share Screen",
              icon: Icons.arrow_upward,
            ),
          ],
        ),
      ],
    );
    ;
  }
}
