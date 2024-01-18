class BestSelectionEntity {
  List<BaseSelectionItem>? result;

  BestSelectionEntity({this.result});

  BestSelectionEntity.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <BaseSelectionItem>[];
      json['result'].forEach((v) {
        result?.add(BaseSelectionItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BaseSelectionItem {
  String? sId;
  String? title;
  String? status;
  String? pic;
  String? url;
  int? position;

  BaseSelectionItem(
      {this.sId, this.title, this.status, this.pic, this.url, this.position});

  BaseSelectionItem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    status = json['status'];
    pic = json['pic'];
    url = json['url'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['status'] = status;
    data['pic'] = pic;
    data['url'] = url;
    data['position'] = position;
    return data;
  }
}
