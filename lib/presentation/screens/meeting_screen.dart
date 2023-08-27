import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/participant_tile.dart';
// import 'package:justifi_advocate/presentation/screens/join_screen.dart';
import 'package:videosdk/videosdk.dart';

class MeetingScreen extends StatefulWidget {
  final String meetingId;
  final String token;
  final String mode;

  const MeetingScreen(
      {super.key,
      required this.meetingId,
      required this.token,
      required this.mode});

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  late Room _room;
  var micEnabled = true;
  var camEnabled = true;

  Map<String, Participant> participants = {};

  @override
  void initState() {
    print(widget.meetingId);
    // create room
    _room = VideoSDK.createRoom(
      roomId: widget.meetingId,
      token: widget.token,
      displayName: "John Doe",
      micEnabled: micEnabled,
      camEnabled: camEnabled,
      defaultCameraIndex:
          1, // Index of MediaDevices will be used to set default camera
    );

    setMeetingEventListener();

    // Join room
    _room.join();

    super.initState();
  }

  // listening to meeting events
  void setMeetingEventListener() {
    _room.on(Events.roomJoined, () {
      setState(() {
        participants.putIfAbsent(
            _room.localParticipant.id, () => _room.localParticipant);
      });
    });

    _room.on(
      Events.participantJoined,
      (Participant participant) {
        if (participants.length == 2) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Room is full'),
            ),
          );
          Navigator.pop(context);
          return;
        }
        setState(() {
          participants.putIfAbsent(participant.id, () => participant);
        });
      },
    );

    _room.on(Events.participantLeft, (String participantId) {
      if (participants.containsKey(participantId)) {
        setState(
          () => participants.remove(participantId),
        );
      }
    });

    _room.on(Events.roomLeft, () {
      participants.clear();
      Navigator.pop(context);
    });
  }

  // onbackButton pressed leave the room
  Future<bool> _onWillPop() async {
    _room.leave();
    return true;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(),
      // home: JoinScreen(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          participants.length != 2
              ? const Center(
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                        child: Text(
                      "Waiting for second user to join...",
                      style: TextStyle(color: Colors.white),
                    ))
                  ],
                ))
              : SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  child: ParticipantTile(
                      key: Key(participants.values.elementAt(1).id),
                      participant: participants.values.elementAt(1)),
                ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Text(
                widget.meetingId,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
          participants.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.only(bottom: 100.0, right: 10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      height: 200,
                      width: 150,
                      child: ParticipantTile(
                          key: Key(participants.values.elementAt(0).id),
                          participant: participants.values.elementAt(0)),
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            )),
                        onPressed: () {
                          micEnabled ? _room.muteMic() : _room.unmuteMic();
                          setState(() {
                            micEnabled = !micEnabled;
                          });
                        },
                        child:
                            Icon(!micEnabled ? Icons.mic_off : Icons.mic_none)),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            )),
                        onPressed: () {
                          _room.leave();
                        },
                        child: const Icon(Icons.call_end)),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            )),
                        onPressed: () {
                          camEnabled ? _room.disableCam() : _room.enableCam();
                          setState(() {
                            camEnabled = !camEnabled;
                          });
                        },
                        child: Icon(
                            !camEnabled ? Icons.videocam_off : Icons.videocam)),
                  ],
                )),
          ),
        ]),
      ),
    );
  }
}
