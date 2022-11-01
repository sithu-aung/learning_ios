class UserScoreRequest {
  RequestData? data;

  UserScoreRequest({this.data});

  UserScoreRequest.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? RequestData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class RequestData {
  int? totalScore;
  List<Subjects>? subjects;

  RequestData({this.totalScore, this.subjects});

  RequestData.fromJson(Map<String, dynamic> json) {
    totalScore = json['total_score'];
    if (json['subjects'] != null) {
      subjects = <Subjects>[];
      json['subjects'].forEach((v) {
        subjects!.add(Subjects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_score'] = totalScore;
    if (subjects != null) {
      data['subjects'] = subjects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subjects {
  String? subjectName;
  double? totalSubjectScore;
  String? modules;

  Subjects({this.subjectName, this.totalSubjectScore, this.modules});

  Subjects.fromJson(Map<String, dynamic> json) {
    subjectName = json['subject_name'];
    totalSubjectScore = json['total_subject_score'];
    modules = json['modules'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subject_name'] = subjectName;
    data['total_subject_score'] = totalSubjectScore;
    data['modules'] = modules;
    return data;
  }
}

class Modules {
  String? moduleName;
  int? totalModuleScore;
  List<Chapters>? chapters;

  Modules({this.moduleName, this.totalModuleScore, this.chapters});

  Modules.fromJson(Map<String, dynamic> json) {
    moduleName = json['module_name'];
    totalModuleScore = json['total_module_score'];
    if (json['chapters'] != null) {
      chapters = <Chapters>[];
      json['chapters'].forEach((v) {
        chapters!.add(Chapters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['module_name'] = moduleName;
    data['total_module_score'] = totalModuleScore;
    if (chapters != null) {
      data['chapters'] = chapters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chapters {
  String? chapterName;
  int? totalChapterScore;

  Chapters({this.chapterName, this.totalChapterScore});

  Chapters.fromJson(Map<String, dynamic> json) {
    chapterName = json['chapter_name'];
    totalChapterScore = json['total_chapter_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chapter_name'] = chapterName;
    data['total_chapter_score'] = totalChapterScore;
    return data;
  }
}
