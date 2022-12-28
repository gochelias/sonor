import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';

class SongPlaying {
  final int id;
  final String uri;
  final String name;
  final String artist;

  SongPlaying(this.id, this.uri, this.name, this.artist);
}

class SongPlayingProvider with ChangeNotifier {
  bool _isPlaying = false;
  SongPlaying _songPlaying = SongPlaying(0, "", 'No Playing', 'No Playing');
  AudioPlayer _audioPlayer = AudioPlayer();

  bool get isPlaying => _isPlaying;
  SongPlaying get songPlaying => _songPlaying;
  AudioPlayer get audioPlayer => _audioPlayer;

  void setSong(SongPlaying songPlaying, AudioPlayer audioPlayer) {
    _songPlaying = songPlaying;
    _audioPlayer = audioPlayer;

    _audioPlayer.setAudioSource(
      AudioSource.uri(Uri.parse(_songPlaying.uri)),
    );

    _audioPlayer.play();
    _isPlaying = true;

    notifyListeners();
  }

  void setState(bool isPlaying) {
    _isPlaying = isPlaying;

    if (isPlaying) {
      _audioPlayer.play();
    } else {
      _audioPlayer.pause();
    }

    notifyListeners();
  }
}
