import 'package:flutter/material.dart';

class ReportIncidentPage extends StatefulWidget {
  const ReportIncidentPage({Key? key}) : super(key: key);

  @override
  State<ReportIncidentPage> createState() => _ReportIncidentPageState();
}

class _ReportIncidentPageState extends State<ReportIncidentPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _selectedCategory;

  final List<String> categories = [
    "Infrastructure",
    "Hygiène",
    "Sécurité",
    "Environnement",
    "Circulation",
    "Éclairage public",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signaler un incident",style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green.shade800,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Nom", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _nomController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              const Text("Description", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 6),
              TextFormField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              const Text("Catégorie", style: TextStyle(fontSize: 16)),
              const SizedBox(height: 6),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(border: OutlineInputBorder()),
                value: _selectedCategory,
                hint: const Text("Sélectionner"),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                items: categories
                    .map((cat) => DropdownMenuItem(
                  value: cat,
                  child: Text(cat),
                ))
                    .toList(),
              ),
              const SizedBox(height: 20),

              GestureDetector(
                onTap: () {
                  // TODO: Ajouter le chargement d'image
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green.shade800),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.upload, color: Colors.green.shade800),
                      const SizedBox(height: 8),
                      Text("Téléverser une image",
                          style: TextStyle(
                              color: Colors.green.shade800,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Validation et envoi
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade800,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text("ENVOYER", style: TextStyle(fontSize: 16)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
