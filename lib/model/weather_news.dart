class WeatherNews {
  List<Newdata>? newdata;
  List<Tags>? tags;
  int? totalCount;
  int? totalPage;

  WeatherNews({this.newdata, this.tags, this.totalCount, this.totalPage});

  WeatherNews.fromJson(Map<String, dynamic> json) {
    if (json['newdata'] != null) {
      newdata = <Newdata>[];
      json['newdata'].forEach((v) {
        newdata!.add(Newdata.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
    totalPage = json['totalPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (newdata != null) {
      data['newdata'] = newdata!.map((v) => v.toJson()).toList();
    }
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = totalCount;
    data['totalPage'] = totalPage;
    return data;
  }
}

class Newdata {
  String? newid;
  String? title;
  String? type;
  String? thumbnail;
  String? author;
  String? source;
  String? isTop;
  String? publishTime;

  Newdata(
      {this.newid,
      this.title,
      this.type,
      this.thumbnail,
      this.author,
      this.source,
      this.isTop,
      this.publishTime});

  Newdata.fromJson(Map<String, dynamic> json) {
    newid = json['newid'];
    title = json['title'];
    type = json['type'];
    thumbnail = json['thumbnail'];
    author = json['author'];
    source = json['source'];
    isTop = json['isTop'];
    publishTime = json['publishTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['newid'] = newid;
    data['title'] = title;
    data['type'] = type;
    data['thumbnail'] = thumbnail;
    data['author'] = author;
    data['source'] = source;
    data['isTop'] = isTop;
    data['publishTime'] = publishTime;
    return data;
  }
}

class Tags {
  String? id;
  String? tagName;
  String? typeLevel;

  Tags({this.id, this.tagName, this.typeLevel});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tagName = json['tagName'];
    typeLevel = json['typeLevel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['tagName'] = tagName;
    data['typeLevel'] = typeLevel;
    return data;
  }
}
