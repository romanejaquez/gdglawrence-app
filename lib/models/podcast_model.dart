class PodcastModel {
  String name;
  String path;
  String id;
  int index;
  int durationInSeconds;
  String duration;

  PodcastModel(
    {
      this.index,
      this.name,
      this.path,
      this.id,
      this.durationInSeconds,
      this.duration
    }
  );
}