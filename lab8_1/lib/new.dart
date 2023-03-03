class New {
  final String title;
  final String date;
  final String text;
  final String icon;
  final String url;

  New({
    required this.title, 
    required this.date, 
    required this.text,
    required this.icon,
    required this.url,
    });


factory New.fromJson(Map<String, dynamic> json) {
  return New(
    title: json['TITLE'] as String,
    url: json['DETAIL_PAGE_URL'] as String,
    date: json['ACTIVE_FROM'] as String,
    text: json['PREVIEW_TEXT'] as String,
    icon: json['PREVIEW_PICTURE_SRC'] as String,
    );
}
}