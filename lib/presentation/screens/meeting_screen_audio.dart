import 'package:flutter/material.dart';
// import 'package:justifi_advocate/presentation/screens/join_screen.dart';
import 'package:videosdk/videosdk.dart';

class MeetingScreenAudio extends StatefulWidget {
  final String meetingId;
  final String token;

  const MeetingScreenAudio(
      {super.key, required this.meetingId, required this.token});

  @override
  State<MeetingScreenAudio> createState() => _MeetingScreenAudioState();
}

class _MeetingScreenAudioState extends State<MeetingScreenAudio> {
  late Room _room;
  var micEnabled = true;

  Map<String, Participant> participants = {};

  @override
  void initState() {
    // create room
    _room = VideoSDK.createRoom(
      roomId: widget.meetingId,
      token: widget.token,
      displayName: "John Doe",
      micEnabled: micEnabled,
      camEnabled: false,
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
        setState(
            () => participants.putIfAbsent(participant.id, () => participant));
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
                      "Ringing...",
                      style: TextStyle(color: Colors.white),
                    ))
                  ],
                ))
              : Container(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  color: Colors.grey.shade800,
                  child: const Center(
                    child: Icon(
                      Icons.person,
                      size: 100,
                    ),
                  ),
                ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                widget.meetingId,
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
          participants.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 100.0, right: 10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        height: 200,
                        width: 150,
                        color: Colors.grey.shade800,
                        child: const Center(
                            child: CircularProgressIndicator(
                          color: Colors.white,
                        ))),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(bottom: 100.0, right: 10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 200,
                      width: 150,
                      color: const Color.fromARGB(255, 33, 32, 32),
                      child: const Center(
                        child: Icon(
                          Icons.person,
                          size: 100,
                        ),
                      ),
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ],
                )),
          ),
        ]),
      ),
    );
  }
}
