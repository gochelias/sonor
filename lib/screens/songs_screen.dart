import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
        if (snapshot.data == null) {
          return Center(
            child: SpinKitFadingCircle(
              size: 40.0,
              color: CupertinoColors.systemPink.darkColor,
            ),
          );
        }

        if (snapshot.data!.isEmpty) return const Text('Not found');

        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: snapshot.data!.length,
                (context, index) {
                  final SongModel song = snapshot.data![index];
                  return Song(
                    song: song,
                    audioPlayer: _audioPlayer,
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
