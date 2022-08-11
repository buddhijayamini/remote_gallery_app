class GalleryModel {
  String url= '';

  GalleryModel({
     required this.url
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) {
    return GalleryModel(
      url: json['url']
    );
}
}