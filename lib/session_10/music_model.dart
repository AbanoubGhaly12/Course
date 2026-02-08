class Song {
  final String title;
  final String artist;
  final String albumArt;
  final String duration;
  final bool isLiked;

  Song({
    required this.title,
    required this.artist,
    required this.albumArt,
    required this.duration,
    this.isLiked = false,
  });
}
