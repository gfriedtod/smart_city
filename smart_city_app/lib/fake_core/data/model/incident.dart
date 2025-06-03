// Fichier : lib/models/incident.dart

class Incident {
  final String image; // Une seule image, pas une liste d'URLs
  final String title;
  final String location;
  final DateTime date;
  final String? description; // Ajouté pour la description de l'incident
  final String? initialStatus; // Pour le statut initial de l'incident

  Incident({
    required this.image,
    required this.title,
    required this.location,
    required this.date,
     this.description, // Requis pour la page de détails
     this.initialStatus, // Requis pour la page de détails
  });

  factory Incident.fromMap(Map<String, dynamic> map) {
    return Incident(
      image: map['image'] as String,
      title: map['title'] as String,
      location: map['location'] as String,
      date: map['date'] as DateTime,
      description: map['description'] as String?,
      initialStatus: map['initialStatus'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'title': title,
      'location': location,
      'date': date,
      'description': description,
      'initialStatus': initialStatus,
    };
  }
}