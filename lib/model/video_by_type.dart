class VideoByType {
  String? preview;
  String? publishTime;
  String? isBigPic;
  String? videoUrl;
  String? isTop;
  String? id;
  String? title;
  String? type;
  String? videoId;
  String? playAuth;

  VideoByType(
      {this.preview,
      this.publishTime,
      this.isBigPic,
      this.videoUrl,
      this.isTop,
      this.id,
      this.title,
      this.type,
      this.videoId,
      this.playAuth});

  VideoByType.fromJson(Map<String, dynamic> json) {
    preview = json["preview"];
    publishTime = json["publishTime"];
    isBigPic = json["is_big_pic"];
    videoUrl = json["videoUrl"];
    isTop = json["isTop"];
    id = json["id"];
    title = json["title"];
    type = json["type"];
    videoId = json["video_id"];
    playAuth = json["playAuth"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["preview"] = preview;
    data["publishTime"] = publishTime;
    data["is_big_pic"] = isBigPic;
    data["videoUrl"] = videoUrl;
    data["isTop"] = isTop;
    data["id"] = id;
    data["title"] = title;
    data["type"] = type;
    data["video_id"] = videoId;
    data["playAuth"] = playAuth;
    return data;
  }

  VideoByType copyWith({
    String? preview,
    String? publishTime,
    String? isBigPic,
    String? videoUrl,
    String? isTop,
    String? id,
    String? title,
    String? type,
    String? videoId,
    String? playAuth,
  }) =>
      VideoByType(
        preview: preview ?? this.preview,
        publishTime: publishTime ?? this.publishTime,
        isBigPic: isBigPic ?? this.isBigPic,
        videoUrl: videoUrl ?? this.videoUrl,
        isTop: isTop ?? this.isTop,
        id: id ?? this.id,
        title: title ?? this.title,
        type: type ?? this.type,
        videoId: videoId ?? this.videoId,
        playAuth: playAuth ?? this.playAuth,
      );
}
