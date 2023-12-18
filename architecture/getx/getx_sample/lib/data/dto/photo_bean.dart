class PhotoBean {
  PhotoBean({this.id = '', this.author = '', this.width = 0, this.height = 0, this.url = '', this.downloadUrl = ''});
  String id;
  String author;
  int width;
  int height;
  String url;
  String downloadUrl;

  factory PhotoBean.fromJson(Map<String, dynamic> json) {
    return PhotoBean(
      id: json['id'] ?? '',
      author: json['author'] ?? '',
      width: json['width'] ?? 0,
      height: json['height'] ?? 0,
      url: json['url'] ?? '',
      downloadUrl: json['download_url'] ?? '',
    );
  }
}