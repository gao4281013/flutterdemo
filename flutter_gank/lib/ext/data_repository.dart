
class DailyResponse{
  List<dynamic> category;
  bool error;
  Map<String, dynamic> results;

  DailyResponse(this.category, this.error, this.results);

  DailyResponse.fromJson(Map<String,dynamic> json)
      :error = json['error'],
        category = json['category'],
        results = json['results'];
}

class CategoryResponse{
  bool error;
  List<dynamic> results;

  CategoryResponse(this.error, this.results);

  CategoryResponse.fromJson(Map<String,dynamic> json)
      :error = json['error'],
        results = json['results'];

}

class PostData{
  String _id;
  String createdAt;
  String desc;
  List<dynamic> images;
  String publishedAt;
  String source;
  String type;
  String url;
  bool used;
  String who;

  PostData(this._id, this.createdAt, this.desc, this.images, this.publishedAt,
      this.source, this.type, this.url, this.used, this.who);

  PostData.fromJson(Map<String, dynamic> json){
    this._id = json['_id'];
    this.createdAt = json['createdAt'];
    this.desc = json['desc'];
    this.images = json['images'];
    this.publishedAt = json['publishedAt'];
    this.source = json['source'];
    this.type = json['type'];
    this.url = json['url'];
    this.used = json['used'];
    this.who = json['who'];
  }

  Map<String, dynamic> toJson() =>
      {
        '_id':_id,
        'createdAt':createdAt,
        'desc':desc,
        'images':images,
        'publishedAt':publishedAt,
        'source':source,
        'type':type,
        'url':url,
        'used':used,
        'who':who,
      };


}