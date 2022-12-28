import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:sonor/widgets/widgets.dart';

class SongsScreen extends StatefulWidget {
  const SongsScreen({Key? key}) : super(key: key);

  @override
  State<SongsScreen> createState() => _SongsScreenState();
}

class _SongsScreenState extends State<SongsScreen> {
  final OnAudioQuery _audioQuery = OnAudioQuery();
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  requestPermission() async {
    if (!kIsWeb) {
      final status = await Permission.storage.status;
      if (status.isDenied) {
        Permission.storage.request();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _audioQuery.querySongs(
        sortType: null,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true,
      ),
      builder: (BuildContext context, AsyncSnapshot<List<SongModel>> snapshot) {
        if (snapshot.data == null) return const CircularProgressIndicator();
        if (snapshot.data!.isEmpty) return const Text('Not found');

        return ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 20.0,
            );
          },
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 8.0,
            top: 16.0,
            bottom: 80.0,
          ),
          itemCount: snapshot.data!.length,
          itemBuilder: (BuildContext context, int index) {
            final SongModel song = snapshot.data![index];
            return Song(
              song: song,
              audioPlayer: _audioPlayer,
            );
          },
        );
      },
    );
  }
}
