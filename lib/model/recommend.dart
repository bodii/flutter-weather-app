class Recommend {
  String? bannerImg;
  String? content;
  String? imageName;
  String? publishTime;
  String? status;
  int? subjectId;
  String? subjectTypeId;
  String? title;
  String? topImg;

  Recommend(
      {this.bannerImg,
      this.content,
      this.imageName,
      this.publishTime,
      this.status,
      this.subjectId,
      this.subjectTypeId,
      this.title,
      this.topImg});

  Recommend.fromJson(Map<String, dynamic> json) {
    bannerImg = json['bannerImg'];
    content = json['content'];
    imageName = json['imageName'];
    publishTime = json['publishTime'];
    status = json['status'];
    subjectId = json['subjectId'];
    subjectTypeId = json['subjectTypeId'];
    title = json['title'];
    topImg = json['topImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['bannerImg'] = bannerImg;
    data['content'] = content;
    data['imageName'] = imageName;
    data['publishTime'] = publishTime;
    data['status'] = status;
    data['subjectId'] = subjectId;
    data['subjectTypeId'] = subjectTypeId;
    data['title'] = title;
    data['topImg'] = topImg;
    return data;
  }
}
