// Fichier : lib/models/disaster.dart

class Incident {
  final String image;
  final String title;
  final String location;
  final DateTime date;
  final String? timeAgo;
  final int? deaths;

  Incident({
    required this.image,
    required this.title,
    required this.location,
    required this.date,
    this.timeAgo,
    this.deaths,
  });

  factory Incident.fromMap(Map<String, dynamic> map) {
    return Incident(
      image: map['image'] as String,
      title: map['title'] as String,
      location: map['location'] as String,
      date: map['date'] as DateTime,
      timeAgo: map['timeAgo'] as String?,
      deaths: map['deaths'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'location': location,
      'date': date,
      'timeAgo': timeAgo,
      'deaths': deaths,
    };
  }

  Incident copyWith({
    String? image,
    String? title,
    String? location,
    DateTime? date,
    String? timeAgo,
    int? deaths,
  }) {
    return Incident(
      image: image ?? this.image,
      title: title ?? this.title,
      location: location ?? this.location,
      date: date ?? this.date,
      timeAgo: timeAgo ?? this.timeAgo,
      deaths: deaths ?? this.deaths,
    );
  }
}
