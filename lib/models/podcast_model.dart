import 'package:audioplayer/audioplayer.dart';

class PodcastModel {
  String name;
  String path;
  String id;
  int index;
  int durationInSeconds;
  String duration;
  AudioPlayer player;

  PodcastModel(
    {
      this.index,
      this.name,
      this.path,
      this.id,
      this.durationInSeconds,
      this.duration,
      this.player
    }
  );
}