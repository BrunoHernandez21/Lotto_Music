// To parse this JSON data, do
//
//     final Curso = CursoFromMap(jsonString);

import 'dart:convert';

class Curso {
  Curso({
    this.id,
    this.title,
    this.shortDescription,
    this.description,
    this.outcomes,
    this.language,
    this.categoryId,
    this.subCategoryId,
    this.section,
    this.requirements,
    this.price,
    this.discountFlag,
    this.discountedPrice,
    this.level,
    this.userId,
    this.thumbnail,
    this.videoUrl,
    this.dateAdded,
    this.lastModified,
    this.courseType,
    this.isTopCourse,
    this.isAdmin,
    this.status,
    this.courseOverviewProvider,
    this.metaKeywords,
    this.metaDescription,
    this.isFreeCourse,
    this.multiInstructor,
    this.creator,
    this.rating,
    this.numberOfRatings,
    this.instructorName,
    this.instructorImage,
    this.totalEnrollment,
    this.shareableLink,
    this.completion,
    this.totalNumberOfLessons,
    this.totalNumberOfCompletedLessons,
    this.sections,
    this.isWishlisted,
    this.isPurchased,
    this.includes,
  });

  String? id;
  String? title;
  String? shortDescription;
  String? description;
  List<dynamic>? outcomes;
  String? language;
  String? categoryId;
  String? subCategoryId;
  String? section;
  List<dynamic>? requirements;
  String? price;
  dynamic discountFlag;
  String? discountedPrice;
  String? level;
  String? userId;
  String? thumbnail;
  String? videoUrl;
  String? dateAdded;
  String? lastModified;
  String? courseType;
  String? isTopCourse;
  String? isAdmin;
  String? status;
  String? courseOverviewProvider;
  String? metaKeywords;
  String? metaDescription;
  String? isFreeCourse;
  String? multiInstructor;
  String? creator;
  int? rating;
  int? numberOfRatings;
  String? instructorName;
  String? instructorImage;
  int? totalEnrollment;
  String? shareableLink;
  int? completion;
  int? totalNumberOfLessons;
  int? totalNumberOfCompletedLessons;
  List<Section>? sections;
  bool? isWishlisted;
  int? isPurchased;
  List<String>? includes;

  Curso copyWith({
    String? id,
    String? title,
    String? shortDescription,
    String? description,
    //TODO no se que sea
    List<dynamic>? outcomes,
    String? language,
    String? categoryId,
    String? subCategoryId,
    String? section,
    //TODO no se que sea
    List<dynamic>? requirements,
    String? price,
    //TODO no se que sea
    String? discountFlag,
    String? discountedPrice,
    String? level,
    String? userId,
    String? thumbnail,
    String? videoUrl,
    String? dateAdded,
    String? lastModified,
    String? courseType,
    String? isTopCourse,
    String? isAdmin,
    String? status,
    String? courseOverviewProvider,
    String? metaKeywords,
    String? metaDescription,
    String? isFreeCourse,
    String? multiInstructor,
    String? creator,
    int? rating,
    int? numberOfRatings,
    String? instructorName,
    String? instructorImage,
    int? totalEnrollment,
    String? shareableLink,
    int? completion,
    int? totalNumberOfLessons,
    int? totalNumberOfCompletedLessons,
    List<Section>? sections,
    bool? isWishlisted,
    int? isPurchased,
    List<String>? includes,
  }) =>
      Curso(
        id: id ?? this.id,
        title: title ?? this.title,
        shortDescription: shortDescription ?? this.shortDescription,
        description: description ?? this.description,
        outcomes: outcomes ?? this.outcomes,
        language: language ?? this.language,
        categoryId: categoryId ?? this.categoryId,
        subCategoryId: subCategoryId ?? this.subCategoryId,
        section: section ?? this.section,
        requirements: requirements ?? this.requirements,
        price: price ?? this.price,
        discountFlag: discountFlag ?? this.discountFlag,
        discountedPrice: discountedPrice ?? this.discountedPrice,
        level: level ?? this.level,
        userId: userId ?? this.userId,
        thumbnail: thumbnail ?? this.thumbnail,
        videoUrl: videoUrl ?? this.videoUrl,
        dateAdded: dateAdded ?? this.dateAdded,
        lastModified: lastModified ?? this.lastModified,
        courseType: courseType ?? this.courseType,
        isTopCourse: isTopCourse ?? this.isTopCourse,
        isAdmin: isAdmin ?? this.isAdmin,
        status: status ?? this.status,
        courseOverviewProvider:
            courseOverviewProvider ?? this.courseOverviewProvider,
        metaKeywords: metaKeywords ?? this.metaKeywords,
        metaDescription: metaDescription ?? this.metaDescription,
        isFreeCourse: isFreeCourse ?? this.isFreeCourse,
        multiInstructor: multiInstructor ?? this.multiInstructor,
        creator: creator ?? this.creator,
        rating: rating ?? this.rating,
        numberOfRatings: numberOfRatings ?? this.numberOfRatings,
        instructorName: instructorName ?? this.instructorName,
        instructorImage: instructorImage ?? this.instructorImage,
        totalEnrollment: totalEnrollment ?? this.totalEnrollment,
        shareableLink: shareableLink ?? this.shareableLink,
        completion: completion ?? this.completion,
        totalNumberOfLessons: totalNumberOfLessons ?? this.totalNumberOfLessons,
        totalNumberOfCompletedLessons:
            totalNumberOfCompletedLessons ?? this.totalNumberOfCompletedLessons,
        sections: sections ?? this.sections,
        isWishlisted: isWishlisted ?? this.isWishlisted,
        isPurchased: isPurchased ?? this.isPurchased,
        includes: includes ?? this.includes,
      );

  factory Curso.fromJson(String str) => Curso.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Curso.fromMap(Map<String, dynamic> json) => Curso(
        id: json["id"],
        title: json["title"],
        shortDescription: json["short_description"],
        description: json["description"],
        outcomes: List<dynamic>.from(json["outcomes"].map((x) => x)),
        language: json["language"],
        categoryId: json["category_id"],
        subCategoryId: json["sub_category_id"],
        section: json["section"],
        requirements: List<dynamic>.from(json["requirements"].map((x) => x)),
        price: json["price"],
        discountFlag: json["discount_flag"],
        discountedPrice: json["discounted_price"],
        level: json["level"],
        userId: json["user_id"],
        thumbnail: json["thumbnail"],
        videoUrl: json["video_url"],
        dateAdded: json["date_added"],
        lastModified: json["last_modified"],
        courseType: json["course_type"],
        isTopCourse: json["is_top_course"],
        isAdmin: json["is_admin"],
        status: json["status"],
        courseOverviewProvider: json["course_overview_provider"],
        metaKeywords: json["meta_keywords"],
        metaDescription: json["meta_description"],
        isFreeCourse: json["is_free_course"],
        multiInstructor: json["multi_instructor"],
        creator: json["creator"],
        rating: json["rating"],
        numberOfRatings: json["number_of_ratings"],
        instructorName: json["instructor_name"],
        instructorImage: json["instructor_image"],
        totalEnrollment: json["total_enrollment"],
        shareableLink: json["shareable_link"],
        completion: json["completion"],
        totalNumberOfLessons: json["total_number_of_lessons"],
        totalNumberOfCompletedLessons:
            json["total_number_of_completed_lessons"],
        sections:
            List<Section>.from(json["sections"].map((x) => Section.fromMap(x))),
        isWishlisted: json["is_wishlisted"],
        isPurchased: json["is_purchased"],
        includes: List<String>.from(json["includes"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "short_description": shortDescription,
        "description": description,
        "outcomes": List<dynamic>.from(outcomes?.map((x) => x) ?? []),
        "language": language,
        "category_id": categoryId,
        "sub_category_id": subCategoryId,
        "section": section,
        "requirements": List<dynamic>.from(requirements?.map((x) => x) ?? []),
        "price": price,
        "discount_flag": discountFlag,
        "discounted_price": discountedPrice,
        "level": level,
        "user_id": userId,
        "thumbnail": thumbnail,
        "video_url": videoUrl,
        "date_added": dateAdded,
        "last_modified": lastModified,
        "course_type": courseType,
        "is_top_course": isTopCourse,
        "is_admin": isAdmin,
        "status": status,
        "course_overview_provider": courseOverviewProvider,
        "meta_keywords": metaKeywords,
        "meta_description": metaDescription,
        "is_free_course": isFreeCourse,
        "multi_instructor": multiInstructor,
        "creator": creator,
        "rating": rating,
        "number_of_ratings": numberOfRatings,
        "instructor_name": instructorName,
        "instructor_image": instructorImage,
        "total_enrollment": totalEnrollment,
        "shareable_link": shareableLink,
        "completion": completion,
        "total_number_of_lessons": totalNumberOfLessons,
        "total_number_of_completed_lessons": totalNumberOfCompletedLessons,
        "sections": List<dynamic>.from(sections?.map((x) => x.toMap()) ?? []),
        "is_wishlisted": isWishlisted,
        "is_purchased": isPurchased,
        "includes": List<dynamic>.from(includes?.map((x) => x) ?? []),
      };
}

class Section {
  Section({
    this.id,
    this.title,
    this.courseId,
    this.order,
    this.lessons,
    this.totalDuration,
    this.lessonCounterStarts,
    this.lessonCounterEnds,
    this.completedLessonNumber,
    this.userValidity,
  });

  String? id;
  String? title;
  String? courseId;
  String? order;
  List<Lesson>? lessons;
  String? totalDuration;
  int? lessonCounterStarts;
  int? lessonCounterEnds;
  int? completedLessonNumber;
  bool? userValidity;

  Section copyWith({
    String? id,
    String? title,
    String? courseId,
    String? order,
    List<Lesson>? lessons,
    String? totalDuration,
    int? lessonCounterStarts,
    int? lessonCounterEnds,
    int? completedLessonNumber,
    bool? userValidity,
  }) =>
      Section(
        id: id ?? this.id,
        title: title ?? this.title,
        courseId: courseId ?? this.courseId,
        order: order ?? this.order,
        lessons: lessons ?? this.lessons,
        totalDuration: totalDuration ?? this.totalDuration,
        lessonCounterStarts: lessonCounterStarts ?? this.lessonCounterStarts,
        lessonCounterEnds: lessonCounterEnds ?? this.lessonCounterEnds,
        completedLessonNumber:
            completedLessonNumber ?? this.completedLessonNumber,
        userValidity: userValidity ?? this.userValidity,
      );

  factory Section.fromJson(String str) => Section.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Section.fromMap(Map<String, dynamic> json) => Section(
        id: json["id"],
        title: json["title"],
        courseId: json["course_id"],
        order: json["order"],
        lessons:
            List<Lesson>.from(json["lessons"].map((x) => Lesson.fromMap(x))),
        totalDuration: json["total_duration"],
        lessonCounterStarts: json["lesson_counter_starts"],
        lessonCounterEnds: json["lesson_counter_ends"],
        completedLessonNumber: json["completed_lesson_number"],
        userValidity: json["user_validity"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "course_id": courseId,
        "order": order,
        "lessons": List<dynamic>.from(lessons?.map((x) => x.toMap()) ?? []),
        "total_duration": totalDuration,
        "lesson_counter_starts": lessonCounterStarts,
        "lesson_counter_ends": lessonCounterEnds,
        "completed_lesson_number": completedLessonNumber,
        "user_validity": userValidity,
      };
}

class Lesson {
  Lesson({
    this.id,
    this.title,
    this.duration,
    this.courseId,
    this.sectionId,
    this.videoType,
    this.videoUrl,
    this.videoUrlWeb,
    this.videoTypeWeb,
    this.lessonType,
    this.attachment,
    this.attachmentUrl,
    this.attachmentType,
    this.summary,
    this.isCompleted,
    this.userValidity,
  });

  String? id;
  String? title;
  String? duration;
  String? courseId;
  String? sectionId;
  String? videoType;
  String? videoUrl;
  String? videoUrlWeb;
  String? videoTypeWeb;
  String? lessonType;
  String? attachment;
  String? attachmentUrl;
  String? attachmentType;
  String? summary;
  int? isCompleted;
  bool? userValidity;

  Lesson copyWith({
    String? id,
    String? title,
    String? duration,
    String? courseId,
    String? sectionId,
    String? videoType,
    String? videoUrl,
    String? videoUrlWeb,
    String? videoTypeWeb,
    String? lessonType,
    String? attachment,
    String? attachmentUrl,
    String? attachmentType,
    String? summary,
    int? isCompleted,
    bool? userValidity,
  }) =>
      Lesson(
        id: id ?? this.id,
        title: title ?? this.title,
        duration: duration ?? this.duration,
        courseId: courseId ?? this.courseId,
        sectionId: sectionId ?? this.sectionId,
        videoType: videoType ?? this.videoType,
        videoUrl: videoUrl ?? this.videoUrl,
        videoUrlWeb: videoUrlWeb ?? this.videoUrlWeb,
        videoTypeWeb: videoTypeWeb ?? this.videoTypeWeb,
        lessonType: lessonType ?? this.lessonType,
        attachment: attachment ?? this.attachment,
        attachmentUrl: attachmentUrl ?? this.attachmentUrl,
        attachmentType: attachmentType ?? this.attachmentType,
        summary: summary ?? this.summary,
        isCompleted: isCompleted ?? this.isCompleted,
        userValidity: userValidity ?? this.userValidity,
      );

  factory Lesson.fromJson(String str) => Lesson.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Lesson.fromMap(Map<String, dynamic> json) => Lesson(
        id: json["id"],
        title: json["title"],
        duration: json["duration"],
        courseId: json["course_id"],
        sectionId: json["section_id"],
        videoType: json["video_type"],
        videoUrl: json["video_url"],
        videoUrlWeb: json["video_url_web"],
        videoTypeWeb: json["video_type_web"],
        lessonType: json["lesson_type"],
        attachment: json["attachment"] == null ? null : json["attachment"],
        attachmentUrl: json["attachment_url"],
        attachmentType: json["attachment_type"],
        summary: json["summary"],
        isCompleted: json["is_completed"],
        userValidity: json["user_validity"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "duration": duration,
        "course_id": courseId,
        "section_id": sectionId,
        "video_type": videoType,
        "video_url": videoUrl,
        "video_url_web": videoUrlWeb,
        "video_type_web": videoTypeWeb,
        "lesson_type": lessonType,
        "attachment": attachment == null ? null : attachment,
        "attachment_url": attachmentUrl,
        "attachment_type": attachmentType,
        "summary": summary,
        "is_completed": isCompleted,
        "user_validity": userValidity,
      };
}
