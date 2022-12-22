import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return Scaffold(
      backgroundColor: CupertinoColors.black,
      appBar: AppBar(
        titleSpacing: 0.0,
        toolbarHeight: 80.0,
        backgroundColor: Colors.black,
        title: const Text(
          'Songs',
          style: TextStyle(
              color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w400),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/search_outline.svg',
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/menu.svg',
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _audioQuery.querySongs(
          sortType: null,
          orderType: OrderType.ASC_OR_SMALLER,
          uriType: UriType.EXTERNAL,
          ignoreCase: true,
        ),
        builder:
            (BuildContext context, AsyncSnapshot<List<SongModel>> snapshot) {
          if (snapshot.data == null) return const CircularProgressIndicator();
          if (snapshot.data!.isEmpty) return const Text('Not found');

          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 80.0),
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
      ),
    );
  }
}
