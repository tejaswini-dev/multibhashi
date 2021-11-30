class ArtWorksDataModel {
  var preference;
  Pagination pagination;
  List<SearchData> data;
  Info info;

  ArtWorksDataModel({this.preference, this.pagination, this.data, this.info});

  ArtWorksDataModel.fromJson(Map<String, dynamic> json) {
    preference = json['preference'];
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      data = new List<SearchData>();
      json['data'].forEach((v) {
        data.add(new SearchData.fromJson(v));
      });
    }
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['preference'] = this.preference;
    if (this.pagination != null) {
      data['pagination'] = this.pagination.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.info != null) {
      data['info'] = this.info.toJson();
    }
    return data;
  }
}

class Pagination {
  int total;
  int limit;
  int offset;
  int totalPages;
  int currentPage;

  Pagination(
      {this.total, this.limit, this.offset, this.totalPages, this.currentPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    limit = json['limit'];
    offset = json['offset'];
    totalPages = json['total_pages'];
    currentPage = json['current_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    data['total_pages'] = this.totalPages;
    data['current_page'] = this.currentPage;
    return data;
  }
}

class SearchData {
  double dScore;
  Thumbnail thumbnail;
  String apiModel;
  bool isBoosted;
  String apiLink;
  int id;
  String title;
  String timestamp;

  SearchData(
      {this.dScore,
      this.thumbnail,
      this.apiModel,
      this.isBoosted,
      this.apiLink,
      this.id,
      this.title,
      this.timestamp});

  SearchData.fromJson(Map<String, dynamic> json) {
    dScore = json['_score'];
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    apiModel = json['api_model'];
    isBoosted = json['is_boosted'];
    apiLink = json['api_link'];
    id = json['id'];
    title = json['title'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_score'] = this.dScore;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    data['api_model'] = this.apiModel;
    data['is_boosted'] = this.isBoosted;
    data['api_link'] = this.apiLink;
    data['id'] = this.id;
    data['title'] = this.title;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Thumbnail {
  String altText;
  int width;
  String lqip;
  int height;

  Thumbnail({this.altText, this.width, this.lqip, this.height});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    altText = json['alt_text'];
    width = json['width'];
    lqip = json['lqip'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alt_text'] = this.altText;
    data['width'] = this.width;
    data['lqip'] = this.lqip;
    data['height'] = this.height;
    return data;
  }
}

class Info {
  String licenseText;
  List<String> licenseLinks;
  String version;

  Info({this.licenseText, this.licenseLinks, this.version});

  Info.fromJson(Map<String, dynamic> json) {
    licenseText = json['license_text'];
    licenseLinks = json['license_links'].cast<String>();
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['license_text'] = this.licenseText;
    data['license_links'] = this.licenseLinks;
    data['version'] = this.version;
    return data;
  }
}
