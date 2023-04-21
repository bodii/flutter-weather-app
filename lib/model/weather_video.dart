class WeatherVideo {
  Lbvideo? lbvideo;
  List<Jqvideo>? jqvideo;
  Mtvideo? mtvideo;

  WeatherVideo({this.lbvideo, this.jqvideo, this.mtvideo});

  WeatherVideo.fromJson(Map<String, dynamic> json) {
    lbvideo =
        json['lbvideo'] != null ? Lbvideo.fromJson(json['lbvideo']) : null;
    if (json['jqvideo'] != null) {
      jqvideo = <Jqvideo>[];
      json['jqvideo'].forEach((v) {
        jqvideo!.add(Jqvideo.fromJson(v));
      });
    }
    mtvideo =
        json['mtvideo'] != null ? Mtvideo.fromJson(json['mtvideo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (lbvideo != null) {
      data['lbvideo'] = lbvideo!.toJson();
    }
    if (jqvideo != null) {
      data['jqvideo'] = jqvideo!.map((v) => v.toJson()).toList();
    }
    if (mtvideo != null) {
      data['mtvideo'] = mtvideo!.toJson();
    }
    return data;
  }
}

class Lbvideo {
  Yesterday? yesterday;
  Yesterday? today;
  Yesterday? beforeYesterday;

  Lbvideo({this.yesterday, this.today, this.beforeYesterday});

  Lbvideo.fromJson(Map<String, dynamic> json) {
    yesterday = json['yesterday'] != null
        ? Yesterday.fromJson(json['yesterday'])
        : null;
    today = json['today'] != null ? Yesterday.fromJson(json['today']) : null;
    beforeYesterday = json['before_yesterday'] != null
        ? Yesterday.fromJson(json['before_yesterday'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (yesterday != null) {
      data['yesterday'] = yesterday!.toJson();
    }
    if (today != null) {
      data['today'] = today!.toJson();
    }
    if (beforeYesterday != null) {
      data['before_yesterday'] = beforeYesterday!.toJson();
    }
    return data;
  }
}

class Yesterday {
  String? vidDate;
  String? vodurl;
  String? vodRequestId;
  String? vodfileid;
  String? photo;
  String? title;
  String? videoType;
  String? playAuth;

  Yesterday(
      {this.vidDate,
      this.vodurl,
      this.vodRequestId,
      this.vodfileid,
      this.photo,
      this.title,
      this.videoType,
      this.playAuth});

  Yesterday.fromJson(Map<String, dynamic> json) {
    vidDate = json['vidDate'];
    vodurl = json['vodurl'];
    vodRequestId = json['vodRequestId'];
    vodfileid = json['vodfileid'];
    photo = json['photo'];
    title = json['title'];
    videoType = json['video_type'];
    playAuth = json['playAuth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['vidDate'] = vidDate;
    data['vodurl'] = vodurl;
    data['vodRequestId'] = vodRequestId;
    data['vodfileid'] = vodfileid;
    data['photo'] = photo;
    data['title'] = title;
    data['video_type'] = videoType;
    data['playAuth'] = playAuth;
    return data;
  }
}

class Jqvideo {
  String? vidDate;
  String? vodurl;
  String? vodRequestId;
  String? vodfileid;
  String? photo;
  String? title;
  String? solarterm24;
  String? status;
  String? videoType;
  String? playAuth;

  Jqvideo(
      {this.vidDate,
      this.vodurl,
      this.vodRequestId,
      this.vodfileid,
      this.photo,
      this.title,
      this.solarterm24,
      this.status,
      this.videoType,
      this.playAuth});

  Jqvideo.fromJson(Map<String, dynamic> json) {
    vidDate = json['vidDate'];
    vodurl = json['vodurl'];
    vodRequestId = json['vodRequestId'];
    vodfileid = json['vodfileid'];
    photo = json['photo'];
    title = json['title'];
    solarterm24 = json['solarterm24'];
    status = json['status'];
    videoType = json['video_type'];
    playAuth = json['playAuth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['vidDate'] = vidDate;
    data['vodurl'] = vodurl;
    data['vodRequestId'] = vodRequestId;
    data['vodfileid'] = vodfileid;
    data['photo'] = photo;
    data['title'] = title;
    data['solarterm24'] = solarterm24;
    data['status'] = status;
    data['video_type'] = videoType;
    data['playAuth'] = playAuth;
    return data;
  }
}

class Mtvideo {
  String? imgfile;
  String? fileId;
  String? describe;
  String? videofile;
  String? playAuth;

  Mtvideo(
      {this.imgfile,
      this.fileId,
      this.describe,
      this.videofile,
      this.playAuth});

  Mtvideo.fromJson(Map<String, dynamic> json) {
    imgfile = json['imgfile'];
    fileId = json['file_id'];
    describe = json['describe'];
    videofile = json['videofile'];
    playAuth = json['playAuth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['imgfile'] = imgfile;
    data['file_id'] = fileId;
    data['describe'] = describe;
    data['videofile'] = videofile;
    data['playAuth'] = playAuth;
    return data;
  }
}
