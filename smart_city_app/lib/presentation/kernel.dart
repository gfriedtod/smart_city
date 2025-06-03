import 'package:flutter/material.dart';
import 'package:smart_city_app/presentation/screens/home/HomePage.dart';
import 'package:smart_city_app/presentation/screens/profile/ProfilePage.dart';
import 'package:smart_city_app/presentation/screens/form/UploadIncident.dart';

class KernelView extends StatefulWidget {
  const KernelView({super.key});

  @override
  State<KernelView> createState() => _KernelViewState();
}

class _KernelViewState extends State<KernelView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreenContent(),
    Placeholder(), // Page Liste
    Placeholder(), // Page Notifications
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ Contenu avec état conservé
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),

      // ✅ Bouton central flottant (ajout d’incident)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ReportIncidentPage()),
          );
        },
        backgroundColor: Colors.green.shade800,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // ✅ Barre de navigation avec encoche
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.white,
        elevation: 10,
        child: SizedBox(
          height: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home_outlined,
                  color: _selectedIndex == 0 ? Colors.green.shade800 : Colors.grey,
                ),
                onPressed: () => setState(() => _selectedIndex = 0),
              ),
              IconButton(
                icon: Icon(
                  Icons.list_alt,
                  color: _selectedIndex == 1 ? Colors.green.shade800 : Colors.grey,
                ),
                onPressed: () => setState(() => _selectedIndex = 1),
              ),
              const SizedBox(width: 48), // Espace pour le bouton +
              IconButton(
                icon: Icon(
                  Icons.notifications_outlined,
                  color: _selectedIndex == 2 ? Colors.green.shade800 : Colors.grey,
                ),
                onPressed: () => setState(() => _selectedIndex = 2),
              ),
              IconButton(
                icon: const Icon(Icons.account_circle_outlined, color: Colors.grey),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfilePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
