class WastSearchEntity {
  WastSearchQueryResultType1 queryResultType1;
  int queryResult;

  WastSearchEntity({this.queryResultType1, this.queryResult});

  WastSearchEntity.fromJson(Map<String, dynamic> json) {
    queryResultType1 = json['query_result_type_1'] != null
        ? new WastSearchQueryResultType1.fromJson(json['query_result_type_1'])
        : null;
    queryResult = json['query_result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.queryResultType1 != null) {
      data['query_result_type_1'] = this.queryResultType1.toJson();
    }
    data['query_result'] = this.queryResult;
    return data;
  }
}

class WastSearchQueryResultType1 {
  bool isLiveTrash;
  int trashType;

  WastSearchQueryResultType1({this.isLiveTrash, this.trashType});

  WastSearchQueryResultType1.fromJson(Map<String, dynamic> json) {
    isLiveTrash = json['is_live_trash'];
    trashType = json['trashType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_live_trash'] = this.isLiveTrash;
    data['trashType'] = this.trashType;
    return data;
  }
}
