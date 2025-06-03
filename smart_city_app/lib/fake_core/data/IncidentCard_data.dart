// Fichier : lib/data/incident_data.dart



import 'model/incident.dart';

List<Incident> IncidentArticlesData = [
  Incident(
    image: 'lib/assets/images/plage.jpg', // Chemin correct pour les assets
    title: 'White Island Eruption Horror',
    location: 'White Island, Bay of Plenty',
    date: DateTime(2024, 6, 17),
    description: "On December 9, 2019, White Island, a volcanic island, erupted, killing 22 people and injuring 25 more. The island is a popular tourist destination known for its active volcano and hot springs.",
    initialStatus: 'Reported',
  ),
  Incident(
    image: 'lib/assets/images/plage.jpg', // Autre image d'exemple
    title: 'Christchurch Quake Devastation',
    location: 'Christchurch, Canterbury',
    date: DateTime(2024, 6, 8),
    description: "A powerful earthquake struck Christchurch on February 22, 2011, causing widespread damage and claiming 185 lives. The city continues its recovery efforts.",
    initialStatus: 'Resolved',
  ),
  Incident(
    image: 'lib/assets/images/plage.jpg',
    title: 'Cyclone Gabrielle Wreaks Havoc',
    location: 'Hawke\'s Bay, North Island',
    date: DateTime(2024, 5, 29),
    description: "Cyclone Gabrielle brought devastating floods and landslides to the Hawke's Bay region in February 2023, causing significant damage and displacement.",
    initialStatus: 'In_Progress',
  ),
  Incident(
    image: 'lib/assets/images/plage.jpg',
    title: 'Flash Floods Submerge Orchard Road, Singapore',
    location: 'Orchard Road, Singapore',
    date: DateTime(2024, 11, 29),
    description: "Heavy rainfall led to flash floods, submerging parts of Orchard Road, a major shopping district in Singapore, causing disruptions and property damage.",
    initialStatus: 'Resolved',
  ),
  Incident(
    image: 'lib/assets/images/plage.jpg',
    title: 'Tornado Wreaks Havoc in New York',
    location: 'lib/albany, New York',
    date: DateTime(2024, 11, 27),
    description: "A rare tornado touched down in Albany, New York, causing significant damage to homes and businesses, and disrupting daily life.",
    initialStatus: 'Rejected',
  ),
];