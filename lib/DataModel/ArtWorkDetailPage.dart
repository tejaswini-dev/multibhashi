class ArtWorksDetailedPage {
  Data data;
  Info info;
  Config config;

  ArtWorksDetailedPage({this.data, this.info, this.config});

  ArtWorksDetailedPage.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    config =
        json['config'] != null ? new Config.fromJson(json['config']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    if (this.info != null) {
      data['info'] = this.info.toJson();
    }
    if (this.config != null) {
      data['config'] = this.config.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String apiModel;
  String apiLink;
  bool isBoosted;
  String title;
  var altTitles;
  Thumbnail thumbnail;
  String mainReferenceNumber;
  bool hasNotBeenViewedMuch;
  var boostRank;
  int dateStart;
  int dateEnd;
  String dateDisplay;
  String dateQualifierTitle;
  var dateQualifierId;
  String artistDisplay;
  String placeOfOrigin;
  String dimensions;
  String mediumDisplay;
  var inscriptions;
  String creditLine;
  String publicationHistory;
  String exhibitionHistory;
  String provenanceText;
  String publishingVerificationLevel;
  int internalDepartmentId;
  int fiscalYear;
  var fiscalYearDeaccession;
  bool isPublicDomain;
  bool isZoomable;
  int maxZoomWindowSize;
  var copyrightNotice;
  bool hasMultimediaResources;
  bool hasEducationalResources;
  double colorfulness;
  Color color;
  var latitude;
  var longitude;
  var latlon;
  bool isOnView;
  String onLoanDisplay;
  var galleryTitle;
  var galleryId;
  var artworkTypeTitle;
  var artworkTypeId;
  String departmentTitle;
  String departmentId;
  var artistId;
  var artistTitle;
  List altArtistIds;
  List artistIds;
  List artistTitles;
  List<String> categoryIds;
  List<String> categoryTitles;
  List artworkCatalogueIds;
  List<String> termTitles;
  String styleId;
  String styleTitle;
  List<String> altStyleIds;
  List<String> styleIds;
  List<String> styleTitles;
  String classificationId;
  String classificationTitle;
  List<String> altClassificationIds;
  List<String> classificationIds;
  List<String> classificationTitles;
  var subjectId;
  List altSubjectIds;
  List subjectIds;
  List subjectTitles;
  var materialId;
  List altMaterialIds;
  List materialIds;
  List materialTitles;
  var techniqueId;
  List altTechniqueIds;
  List techniqueIds;
  List techniqueTitles;
  List themeTitles;
  String imageId;
  List altImageIds;
  List documentIds;
  List soundIds;
  List videoIds;
  List textIds;
  List sectionIds;
  List sectionTitles;
  List siteIds;
  List<SuggestAutocompleteAll> suggestAutocompleteAll;
  String lastUpdatedSource;
  String lastUpdated;
  String timestamp;

  Data(
      {this.id,
      this.apiModel,
      this.apiLink,
      this.isBoosted,
      this.title,
      this.altTitles,
      this.thumbnail,
      this.mainReferenceNumber,
      this.hasNotBeenViewedMuch,
      this.boostRank,
      this.dateStart,
      this.dateEnd,
      this.dateDisplay,
      this.dateQualifierTitle,
      this.dateQualifierId,
      this.artistDisplay,
      this.placeOfOrigin,
      this.dimensions,
      this.mediumDisplay,
      this.inscriptions,
      this.creditLine,
      this.publicationHistory,
      this.exhibitionHistory,
      this.provenanceText,
      this.publishingVerificationLevel,
      this.internalDepartmentId,
      this.fiscalYear,
      this.fiscalYearDeaccession,
      this.isPublicDomain,
      this.isZoomable,
      this.maxZoomWindowSize,
      this.copyrightNotice,
      this.hasMultimediaResources,
      this.hasEducationalResources,
      this.colorfulness,
      this.color,
      this.latitude,
      this.longitude,
      this.latlon,
      this.isOnView,
      this.onLoanDisplay,
      this.galleryTitle,
      this.galleryId,
      this.artworkTypeTitle,
      this.artworkTypeId,
      this.departmentTitle,
      this.departmentId,
      this.artistId,
      this.artistTitle,
      this.altArtistIds,
      this.artistIds,
      this.artistTitles,
      this.categoryIds,
      this.categoryTitles,
      this.artworkCatalogueIds,
      this.termTitles,
      this.styleId,
      this.styleTitle,
      this.altStyleIds,
      this.styleIds,
      this.styleTitles,
      this.classificationId,
      this.classificationTitle,
      this.altClassificationIds,
      this.classificationIds,
      this.classificationTitles,
      this.subjectId,
      this.altSubjectIds,
      this.subjectIds,
      this.subjectTitles,
      this.materialId,
      this.altMaterialIds,
      this.materialIds,
      this.materialTitles,
      this.techniqueId,
      this.altTechniqueIds,
      this.techniqueIds,
      this.techniqueTitles,
      this.themeTitles,
      this.imageId,
      this.altImageIds,
      this.documentIds,
      this.soundIds,
      this.videoIds,
      this.textIds,
      this.sectionIds,
      this.sectionTitles,
      this.siteIds,
      this.suggestAutocompleteAll,
      this.lastUpdatedSource,
      this.lastUpdated,
      this.timestamp});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    apiModel = json['api_model'];
    apiLink = json['api_link'];
    isBoosted = json['is_boosted'];
    title = json['title'];
    altTitles = json['alt_titles'];
    thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
    mainReferenceNumber = json['main_reference_number'];
    hasNotBeenViewedMuch = json['has_not_been_viewed_much'];
    boostRank = json['boost_rank'];
    dateStart = json['date_start'];
    dateEnd = json['date_end'];
    dateDisplay = json['date_display'];
    dateQualifierTitle = json['date_qualifier_title'];
    dateQualifierId = json['date_qualifier_id'];
    artistDisplay = json['artist_display'];
    placeOfOrigin = json['place_of_origin'];
    dimensions = json['dimensions'];
    mediumDisplay = json['medium_display'];
    inscriptions = json['inscriptions'];
    creditLine = json['credit_line'];
    publicationHistory = json['publication_history'];
    exhibitionHistory = json['exhibition_history'];
    provenanceText = json['provenance_text'];
    publishingVerificationLevel = json['publishing_verification_level'];
    internalDepartmentId = json['internal_department_id'];
    fiscalYear = json['fiscal_year'];
    fiscalYearDeaccession = json['fiscal_year_deaccession'];
    isPublicDomain = json['is_public_domain'];
    isZoomable = json['is_zoomable'];
    maxZoomWindowSize = json['max_zoom_window_size'];
    copyrightNotice = json['copyright_notice'];
    hasMultimediaResources = json['has_multimedia_resources'];
    hasEducationalResources = json['has_educational_resources'];
    colorfulness = json['colorfulness'];
    color = json['color'] != null ? new Color.fromJson(json['color']) : null;
    latitude = json['latitude'];
    longitude = json['longitude'];
    latlon = json['latlon'];
    isOnView = json['is_on_view'];
    onLoanDisplay = json['on_loan_display'];
    galleryTitle = json['gallery_title'];
    galleryId = json['gallery_id'];
    artworkTypeTitle = json['artwork_type_title'];
    artworkTypeId = json['artwork_type_id'];
    departmentTitle = json['department_title'];
    departmentId = json['department_id'];
    artistId = json['artist_id'];
    artistTitle = json['artist_title'];
//    if (json['alt_artist_ids'] != null) {
//      altArtistIds = new List<Null>();
//      json['alt_artist_ids'].forEach((v) {
//        altArtistIds.add(new Null.fromJson(v));
//      });
//    }
//    if (json['artist_ids'] != null) {
//      artistIds = new List<Null>();
//      json['artist_ids'].forEach((v) {
//        artistIds.add(new Null.fromJson(v));
//      });
//    }
//    if (json['artist_titles'] != null) {
//      artistTitles = new List<Null>();
//      json['artist_titles'].forEach((v) {
//        artistTitles.add(new Null.fromJson(v));
//      });
//    }
//    categoryIds = json['category_ids'].cast<String>();
//    categoryTitles = json['category_titles'].cast<String>();
//    if (json['artwork_catalogue_ids'] != null) {
//      artworkCatalogueIds = new List<Null>();
//      json['artwork_catalogue_ids'].forEach((v) {
//        artworkCatalogueIds.add(new Null.fromJson(v));
//      });
//    }
    termTitles = json['term_titles'].cast<String>();
    styleId = json['style_id'];
    styleTitle = json['style_title'];
    altStyleIds = json['alt_style_ids'].cast<String>();
    styleIds = json['style_ids'].cast<String>();
    styleTitles = json['style_titles'].cast<String>();
    classificationId = json['classification_id'];
    classificationTitle = json['classification_title'];
    altClassificationIds = json['alt_classification_ids'].cast<String>();
    classificationIds = json['classification_ids'].cast<String>();
    classificationTitles = json['classification_titles'].cast<String>();
    subjectId = json['subject_id'];
//    if (json['alt_subject_ids'] != null) {
//      altSubjectIds = new List<Null>();
//      json['alt_subject_ids'].forEach((v) {
//        altSubjectIds.add(new Null.fromJson(v));
//      });
//    }
//    if (json['subject_ids'] != null) {
//      subjectIds = new List<Null>();
//      json['subject_ids'].forEach((v) {
//        subjectIds.add(new Null.fromJson(v));
//      });
//    }
//    if (json['subject_titles'] != null) {
//      subjectTitles = new List<Null>();
//      json['subject_titles'].forEach((v) {
//        subjectTitles.add(new Null.fromJson(v));
//      });
//    }
//    materialId = json['material_id'];
//    if (json['alt_material_ids'] != null) {
//      altMaterialIds = new List<Null>();
//      json['alt_material_ids'].forEach((v) {
//        altMaterialIds.add(new Null.fromJson(v));
//      });
//    }
//    if (json['material_ids'] != null) {
//      materialIds = new List<Null>();
//      json['material_ids'].forEach((v) {
//        materialIds.add(new Null.fromJson(v));
//      });
//    }
//    if (json['material_titles'] != null) {
//      materialTitles = new List<Null>();
//      json['material_titles'].forEach((v) {
//        materialTitles.add(new Null.fromJson(v));
//      });
//    }
//    techniqueId = json['technique_id'];
//    if (json['alt_technique_ids'] != null) {
//      altTechniqueIds = new List<Null>();
//      json['alt_technique_ids'].forEach((v) {
//        altTechniqueIds.add(new Null.fromJson(v));
//      });
//    }
//    if (json['technique_ids'] != null) {
//      techniqueIds = new List<Null>();
//      json['technique_ids'].forEach((v) {
//        techniqueIds.add(new Null.fromJson(v));
//      });
//    }
//    if (json['technique_titles'] != null) {
//      techniqueTitles = new List<Null>();
//      json['technique_titles'].forEach((v) {
//        techniqueTitles.add(new Null.fromJson(v));
//      });
//    }
//    if (json['theme_titles'] != null) {
//      themeTitles = new List<Null>();
//      json['theme_titles'].forEach((v) {
//        themeTitles.add(new Null.fromJson(v));
//      });
//    }
//    imageId = json['image_id'];
//    if (json['alt_image_ids'] != null) {
//      altImageIds = new List<Null>();
//      json['alt_image_ids'].forEach((v) {
//        altImageIds.add(new Null.fromJson(v));
//      });
//    }
//    if (json['document_ids'] != null) {
//      documentIds = new List<Null>();
//      json['document_ids'].forEach((v) {
//        documentIds.add(new Null.fromJson(v));
//      });
//    }
//    if (json['sound_ids'] != null) {
//      soundIds = new List<Null>();
//      json['sound_ids'].forEach((v) {
//        soundIds.add(new Null.fromJson(v));
//      });
//    }
//    if (json['video_ids'] != null) {
//      videoIds = new List<Null>();
//      json['video_ids'].forEach((v) {
//        videoIds.add(new Null.fromJson(v));
//      });
//    }
//    if (json['text_ids'] != null) {
//      textIds = new List<Null>();
//      json['text_ids'].forEach((v) {
//        textIds.add(new Null.fromJson(v));
//      });
//    }
//    if (json['section_ids'] != null) {
//      sectionIds = new List<Null>();
//      json['section_ids'].forEach((v) {
//        sectionIds.add(new Null.fromJson(v));
//      });
//    }
//    if (json['section_titles'] != null) {
//      sectionTitles = new List<Null>();
//      json['section_titles'].forEach((v) {
//        sectionTitles.add(new Null.fromJson(v));
//      });
//    }
//    if (json['site_ids'] != null) {
//      siteIds = new List<Null>();
//      json['site_ids'].forEach((v) {
//        siteIds.add(new Null.fromJson(v));
//      });
//    }
    if (json['suggest_autocomplete_all'] != null) {
      suggestAutocompleteAll = new List<SuggestAutocompleteAll>();
      json['suggest_autocomplete_all'].forEach((v) {
        suggestAutocompleteAll.add(new SuggestAutocompleteAll.fromJson(v));
      });
    }
    lastUpdatedSource = json['last_updated_source'];
    lastUpdated = json['last_updated'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['api_model'] = this.apiModel;
    data['api_link'] = this.apiLink;
    data['is_boosted'] = this.isBoosted;
    data['title'] = this.title;
    data['alt_titles'] = this.altTitles;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    data['main_reference_number'] = this.mainReferenceNumber;
    data['has_not_been_viewed_much'] = this.hasNotBeenViewedMuch;
    data['boost_rank'] = this.boostRank;
    data['date_start'] = this.dateStart;
    data['date_end'] = this.dateEnd;
    data['date_display'] = this.dateDisplay;
    data['date_qualifier_title'] = this.dateQualifierTitle;
    data['date_qualifier_id'] = this.dateQualifierId;
    data['artist_display'] = this.artistDisplay;
    data['place_of_origin'] = this.placeOfOrigin;
    data['dimensions'] = this.dimensions;
    data['medium_display'] = this.mediumDisplay;
    data['inscriptions'] = this.inscriptions;
    data['credit_line'] = this.creditLine;
    data['publication_history'] = this.publicationHistory;
    data['exhibition_history'] = this.exhibitionHistory;
    data['provenance_text'] = this.provenanceText;
    data['publishing_verification_level'] = this.publishingVerificationLevel;
    data['internal_department_id'] = this.internalDepartmentId;
    data['fiscal_year'] = this.fiscalYear;
    data['fiscal_year_deaccession'] = this.fiscalYearDeaccession;
    data['is_public_domain'] = this.isPublicDomain;
    data['is_zoomable'] = this.isZoomable;
    data['max_zoom_window_size'] = this.maxZoomWindowSize;
    data['copyright_notice'] = this.copyrightNotice;
    data['has_multimedia_resources'] = this.hasMultimediaResources;
    data['has_educational_resources'] = this.hasEducationalResources;
    data['colorfulness'] = this.colorfulness;
    if (this.color != null) {
      data['color'] = this.color.toJson();
    }
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['latlon'] = this.latlon;
    data['is_on_view'] = this.isOnView;
    data['on_loan_display'] = this.onLoanDisplay;
    data['gallery_title'] = this.galleryTitle;
    data['gallery_id'] = this.galleryId;
    data['artwork_type_title'] = this.artworkTypeTitle;
    data['artwork_type_id'] = this.artworkTypeId;
    data['department_title'] = this.departmentTitle;
    data['department_id'] = this.departmentId;
    data['artist_id'] = this.artistId;
    data['artist_title'] = this.artistTitle;
//    if (this.altArtistIds != null) {
//      data['alt_artist_ids'] =
//          this.altArtistIds.map((v) => v.toJson()).toList();
//    }
//    if (this.artistIds != null) {
//      data['artist_ids'] = this.artistIds.map((v) => v.toJson()).toList();
//    }
//    if (this.artistTitles != null) {
//      data['artist_titles'] = this.artistTitles.map((v) => v.toJson()).toList();
//    }
    data['category_ids'] = this.categoryIds;
    data['category_titles'] = this.categoryTitles;
//    if (this.artworkCatalogueIds != null) {
//      data['artwork_catalogue_ids'] =
//          this.artworkCatalogueIds.map((v) => v.toJson()).toList();
//    }
    data['term_titles'] = this.termTitles;
    data['style_id'] = this.styleId;
    data['style_title'] = this.styleTitle;
    data['alt_style_ids'] = this.altStyleIds;
    data['style_ids'] = this.styleIds;
    data['style_titles'] = this.styleTitles;
    data['classification_id'] = this.classificationId;
    data['classification_title'] = this.classificationTitle;
    data['alt_classification_ids'] = this.altClassificationIds;
    data['classification_ids'] = this.classificationIds;
    data['classification_titles'] = this.classificationTitles;
    data['subject_id'] = this.subjectId;
//    if (this.altSubjectIds != null) {
//      data['alt_subject_ids'] =
//          this.altSubjectIds.map((v) => v.toJson()).toList();
//    }
//    if (this.subjectIds != null) {
//      data['subject_ids'] = this.subjectIds.map((v) => v.toJson()).toList();
//    }
//    if (this.subjectTitles != null) {
//      data['subject_titles'] =
//          this.subjectTitles.map((v) => v.toJson()).toList();
//    }
//    data['material_id'] = this.materialId;
//    if (this.altMaterialIds != null) {
//      data['alt_material_ids'] =
//          this.altMaterialIds.map((v) => v.toJson()).toList();
//    }
//    if (this.materialIds != null) {
//      data['material_ids'] = this.materialIds.map((v) => v.toJson()).toList();
//    }
//    if (this.materialTitles != null) {
//      data['material_titles'] =
//          this.materialTitles.map((v) => v.toJson()).toList();
//    }
//    data['technique_id'] = this.techniqueId;
//    if (this.altTechniqueIds != null) {
//      data['alt_technique_ids'] =
//          this.altTechniqueIds.map((v) => v.toJson()).toList();
//    }
//    if (this.techniqueIds != null) {
//      data['technique_ids'] = this.techniqueIds.map((v) => v.toJson()).toList();
//    }
//    if (this.techniqueTitles != null) {
//      data['technique_titles'] =
//          this.techniqueTitles.map((v) => v.toJson()).toList();
//    }
//    if (this.themeTitles != null) {
//      data['theme_titles'] = this.themeTitles.map((v) => v.toJson()).toList();
//    }
//    data['image_id'] = this.imageId;
//    if (this.altImageIds != null) {
//      data['alt_image_ids'] = this.altImageIds.map((v) => v.toJson()).toList();
//    }
//    if (this.documentIds != null) {
//      data['document_ids'] = this.documentIds.map((v) => v.toJson()).toList();
//    }
//    if (this.soundIds != null) {
//      data['sound_ids'] = this.soundIds.map((v) => v.toJson()).toList();
//    }
//    if (this.videoIds != null) {
//      data['video_ids'] = this.videoIds.map((v) => v.toJson()).toList();
//    }
//    if (this.textIds != null) {
//      data['text_ids'] = this.textIds.map((v) => v.toJson()).toList();
//    }
//    if (this.sectionIds != null) {
//      data['section_ids'] = this.sectionIds.map((v) => v.toJson()).toList();
//    }
//    if (this.sectionTitles != null) {
//      data['section_titles'] =
//          this.sectionTitles.map((v) => v.toJson()).toList();
//    }
//    if (this.siteIds != null) {
//      data['site_ids'] = this.siteIds.map((v) => v.toJson()).toList();
//    }
    if (this.suggestAutocompleteAll != null) {
      data['suggest_autocomplete_all'] =
          this.suggestAutocompleteAll.map((v) => v.toJson()).toList();
    }
    data['last_updated_source'] = this.lastUpdatedSource;
    data['last_updated'] = this.lastUpdated;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class Thumbnail {
  String lqip;
  int width;
  int height;
  String altText;

  Thumbnail({this.lqip, this.width, this.height, this.altText});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    lqip = json['lqip'];
    width = json['width'];
    height = json['height'];
    altText = json['alt_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lqip'] = this.lqip;
    data['width'] = this.width;
    data['height'] = this.height;
    data['alt_text'] = this.altText;
    return data;
  }
}

class Color {
  int h;
  int l;
  int s;
  double percentage;
  int population;

  Color({this.h, this.l, this.s, this.percentage, this.population});

  Color.fromJson(Map<String, dynamic> json) {
    h = json['h'];
    l = json['l'];
    s = json['s'];
    percentage = json['percentage'];
    population = json['population'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['h'] = this.h;
    data['l'] = this.l;
    data['s'] = this.s;
    data['percentage'] = this.percentage;
    data['population'] = this.population;
    return data;
  }
}

class SuggestAutocompleteAll {
  List<String> input;
  Contexts contexts;
  int weight;

  SuggestAutocompleteAll({this.input, this.contexts, this.weight});

  SuggestAutocompleteAll.fromJson(Map<String, dynamic> json) {
    input = json['input'].cast<String>();
    contexts = json['contexts'] != null
        ? new Contexts.fromJson(json['contexts'])
        : null;
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['input'] = this.input;
    if (this.contexts != null) {
      data['contexts'] = this.contexts.toJson();
    }
    data['weight'] = this.weight;
    return data;
  }
}

class Contexts {
  List<String> groupings;

  Contexts({this.groupings});

  Contexts.fromJson(Map<String, dynamic> json) {
    groupings = json['groupings'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupings'] = this.groupings;
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

class Config {
  String iiifUrl;
  String websiteUrl;

  Config({this.iiifUrl, this.websiteUrl});

  Config.fromJson(Map<String, dynamic> json) {
    iiifUrl = json['iiif_url'];
    websiteUrl = json['website_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iiif_url'] = this.iiifUrl;
    data['website_url'] = this.websiteUrl;
    return data;
  }
}
