import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

class VideoCall1 extends StatefulWidget {
  const VideoCall1({super.key});

  @override
  State<VideoCall1> createState() => _VideoCall1State();
}

class _VideoCall1State extends State<VideoCall1> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(client: client),
            AgoraVideoButtons(client: client),
          ],
        ),
      ),
    );
  }
}
