import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jusitfi_admin/presentation/widgets/videocall.dart';

class VideoCall1 extends StatefulWidget {
  const VideoCall1({super.key});

  @override
  State<VideoCall1> createState() => _VideoCall1State();
}

class _VideoCall1State extends State<VideoCall1> {
  bool x = true;
  // Instantiate the client
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: "d3657b90c99240e399244d178961294d",
      channelName: "Justifi",
    ),
  );

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

  userOffline() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(client: client),
            AgoraVideoButtons(
              client: client,
              disconnectButtonChild: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VideoCall()),
                    );
                  },
                  child: const Icon(Icons.call_end)),
            ),
          ],
        ),
      ),
    );
  }
}


/*(connection, stats) =>  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const VideoCall1()),
                    (Route<dynamic> route) => false);*/