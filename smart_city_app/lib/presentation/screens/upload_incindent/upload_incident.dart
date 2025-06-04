import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localstorage/localstorage.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:smart_city_app/domain/dto/CategoryDto.dart';
import 'package:smart_city_app/domain/dto/UserDto.dart';
import 'package:smart_city_app/fake_core/data/model/incident.dart';
import 'package:smart_city_app/presentation/components/CustomTextField.dart';
import 'package:smart_city_app/presentation/components/button_comp.dart';
import 'package:smart_city_app/presentation/screens/onboarding/color.dart';

import '../../../domain/dto/AuthResponse.dart';
import '../../../domain/dto/IncidentDto.dart';
import '../../components/open_street_map_search_and_pick.dart';
import '../../providers/incident/incident_bloc.dart';

class ReportIncidentPage extends StatefulWidget {
  const ReportIncidentPage({Key? key}) : super(key: key);

  @override
  State<ReportIncidentPage> createState() => _ReportIncidentPageState();
}

class _ReportIncidentPageState extends State<ReportIncidentPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _pickedImage;
  File? _imagePath;
  CategoryDto? _selectedCategory;
  double? _latitude;
  double? _longitude;
  String? _address;

  Future<void> _showImageSourceDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select Image Source'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Take a photo'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Choose from gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: 80, // Compression quality
        maxWidth: 800, // Max image width
        maxHeight: 800, // Max image height
      );
      if (pickedFile != null) {
        setState(() {
          _imagePath = File(pickedFile.path);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error picking image: $e')));
    }
  }

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
    var categorys = context.watch<IncidentBloc>().categorys;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signaler un incident"),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  label: 'Nom',
                  hint: 'nom',
                  controller: _nomController,
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  label: 'Description',
                  hint: 'Description',
                  controller: _descriptionController,
                ),
                const SizedBox(height: 20),

                const Text("Catégorie", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 6),
                DropdownButtonFormField(
                  dropdownColor: Colors.white,
                  decoration: const InputDecoration(border: OutlineInputBorder()),
                  value: _selectedCategory,
                  hint: const Text("Sélectionner"),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                  items: categorys
                      .map(
                        (cat) =>
                            DropdownMenuItem(value: cat, child: Text(cat.name)),
                      )
                      .toList(),
                ),
                const SizedBox(height: 20),

                GestureDetector(
                  onTap: () {
                    _showImageSourceDialog();
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    decoration: BoxDecoration(
                      border: Border.all(color: primaryColor),
                      borderRadius: BorderRadius.circular(12),
                      image: _imagePath == null
                          ? null
                          : DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(_imagePath!),
                            ),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.upload, color: primaryColor),
                        const SizedBox(height: 8),
                        Text(
                          "Téléverser une image",
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    showAdaptiveDialog(
                      context: context,
                      builder: (context) {
                        return Scaffold(
                          backgroundColor: Colors.white,
                          body: OpenStreetMapSearchAndPick(
                            buttonColor: primaryColor,
                            locationPinIconColor: primaryColor,
                            buttonText: 'Set Current Location',
                            onPicked: (pickedData) async {
                              setState(() {
                                _longitude = pickedData.latLong.longitude;
                                _latitude = pickedData.latLong.latitude;
                                _address = pickedData.addressName;
                                Navigator.pop(context);
                              });
                            },
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: primaryColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Icon(LucideIcons.map, color: primaryColor),
                        const SizedBox(height: 8),
                        Text(
                          _address ?? "Localiser l'incident",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                BlocConsumer<IncidentBloc, IncidentState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      success: (){
                       ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text("Incident signalé avec succès")));
                      } ,
                      error: (message) => ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(message))),
                    );
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => ButtonComp(
                        title: 'Signaler',
                        onPressed: () {
                          context.read<IncidentBloc>().add(
                            IncidentEvent.createIncident(
                              incident: IncidentDto().copyWith(
                                name: _nomController.text,
                                description: _descriptionController.text,
                                category: _selectedCategory!,
                                image: _imagePath!.path,
                                longitude: _longitude,
                                latitude: _latitude,
                                address: _address,
                                createdAt: DateTime.now(),
                                updatedAt: DateTime.now(),
                                status: IncidentStatus.SUBMIT,
                                user: AuthResponse.fromJson(
                                  jsonDecode(localStorage.getItem('user')!),
                                ).user,
                              ),
                              image: _imagePath!,
                            ),
                          );
                        },
                        width: double.infinity,
                      ),
                      loading: () => ButtonComp(
                        title: 'Signaler',
                        onPressed: () {},
                        width: double.infinity,
                        isLoading: true,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
