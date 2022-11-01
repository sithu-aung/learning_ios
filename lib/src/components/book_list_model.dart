class BookListModel {
  final String name;
  final String image;
  BookListModel({required this.name, required this.image});
}

class VideoListModel {
  final String name;
  final String module;
  final String thumbnail;
  final VideoType type;
  final String url;
  VideoListModel({
    required this.name,
    required this.module,
    required this.thumbnail,
    required this.type,
    required this.url,
  });
}

enum VideoType { asset, youtube }
