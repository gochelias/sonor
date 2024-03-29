import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';
import 'package:palette_generator/palette_generator.dart';

class SongPlayerProvider with ChangeNotifier {
  bool _isPlaying = false;
  AudioPlayer _audioPlayer = AudioPlayer();

  bool get isPlaying => _isPlaying;
  AudioPlayer get audioPlayer => _audioPlayer;

  /// Play the song and set the status to isPlaying
  ///
  /// [uri]  Search for the specific file
  ///
  /// [player] Set the player
  void setSong(String uri, AudioPlayer player) {
    _audioPlayer = player;

    _audioPlayer.setAudioSource(
      AudioSource.uri(Uri.parse(uri)),
    );

    _audioPlayer.play();
    _isPlaying = true;

    notifyListeners();
  }

  /// Plays or pauses the song according to the status
  ///
  /// [state] `bool`
  void setState(bool state) {
    _isPlaying = state;

    if (_isPlaying) {
      _audioPlayer.play();
    } else {
      _audioPlayer.pause();
    }

    notifyListeners();
  }
}

class SongPlaying {
  final int id;
  final String title;
  final String artist;

  SongPlaying(this.id, this.title, this.artist);
}

/// Data about the song currently playing
/// [id] [title] [artist]
class SongPlayingProvider with ChangeNotifier {
  bool _isActive = true;
  SongPlaying _songPlaying = SongPlaying(0, 'No Playing', 'No Playing');
  PaletteGenerator? _palette;

  bool get isActive => _isActive;
  SongPlaying get songPlaying => _songPlaying;
  PaletteGenerator? get palette => _palette;

  /// Set a new song [song]
  void setSong(SongPlaying song) {
    _songPlaying = song;

    notifyListeners();
  }

  void setIsActive(bool state) {
    _isActive = state;

    notifyListeners();
  }

  void setPalette(PaletteGenerator? palette) {
    _palette = palette;
    notifyListeners();
  }
}
