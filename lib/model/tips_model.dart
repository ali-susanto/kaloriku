class TipsModel {
  String? id;
  String? image;
  String? title;
  String? headline;
  String? content;

  TipsModel({
    required this.id,
    required this.image,
    required this.title,
    required this.headline,
    required this.content,
  });

  factory TipsModel.fromJson(Map<String, dynamic> json) => TipsModel(
      id: json['id'] as String?,
      image: json['image'] as String?,
      title: json['title'] as String?,
      headline: json['headline'] as String?,
      content: json['content'] as String?);
}
