class UserProgressResponse {
  String? message;
  ProgressData? progressData;
  int? code;

  UserProgressResponse({this.message, this.progressData, this.code});

  UserProgressResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    progressData = json['progress_data'] != null
        ? ProgressData.fromJson(json['progress_data'])
        : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (progressData != null) {
      data['progress_data'] = progressData!.toJson();
    }
    data['code'] = code;
    return data;
  }
}

class ProgressData {
  String? sId;
  String? userId;
  Progress? progress;
  String? updatedAt;
  String? createdAt;

  ProgressData(
      {this.sId, this.userId, this.progress, this.updatedAt, this.createdAt});

  ProgressData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    progress =
        json['progress'] != null ? Progress.fromJson(json['progress']) : null;
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['user_id'] = userId;
    if (progress != null) {
      data['progress'] = progress!.toJson();
    }
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    return data;
  }
}

class Progress {
  int? totalScore;
  List<Subjects>? subjects;

  Progress({this.totalScore, this.subjects});

  Progress.fromJson(Map<String, dynamic> json) {
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
  int? totalSubjectScore;
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
