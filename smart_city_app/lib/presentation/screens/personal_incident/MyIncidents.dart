import 'package:flutter/material.dart';

import '../../../domain/dto/IncidentDto.dart';

class IncidentStatusPage extends StatefulWidget {
  const IncidentStatusPage({Key? key}) : super(key: key);

  @override
  State<IncidentStatusPage> createState() => _IncidentStatusPageState();
}

class _IncidentStatusPageState extends State<IncidentStatusPage> {
  String selectedStatus = IncidentStatus.SUBMIT.name;

  final List<Map<String, dynamic>> incidents = [
    {
      "title": "Inondation Et Flaques d'eau",
      "desc": "Les rigoles sont bouchées...",
      "date": "24 Mai, 2025",
      "status": "Reported",
    },
    {
      "title": "Inondation Et Flaques d'eau",
      "desc": "Les rigoles sont bouchées...",
      "date": "24 Mai, 2025",
      "status": "In Progress",
    },
    {
      "title": "Inondation Et Flaques d'eau",
      "desc": "Les rigoles sont bouchées...",
      "date": "24 Mai, 2025",
      "status": "Treated",
    },
    {
      "title": "Inondation Et Flaques d'eau",
      "desc": "Les rigoles sont bouchées...",
      "date": "24 Mai, 2025",
      "status": "Rejected",
    },
  ];

  final List<String> statusTabs = [
    'Reported',
    'In Progress',
    'Treated',
    'Rejected',
  ];

  Color statusColor(IncidentStatus status) {
    switch (status) {
      case IncidentStatus.SUBMIT:
        return Colors.deepPurple;
      case IncidentStatus.PROGRESS:
        return Colors.orange;
      case IncidentStatus.RESOLVED:
        return Colors.green;
      case IncidentStatus.REJECTED:
        return Colors.red;
    }
  }

  double getProgress(IncidentStatus status) {
    switch (status) {
      case IncidentStatus.SUBMIT:
        return 0.25;
      case IncidentStatus.PROGRESS:
        return 0.5;
      case IncidentStatus.RESOLVED:
        return 1.0;
      case IncidentStatus.REJECTED:
        return 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Statut d’incidents",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        //   onPressed: () => Navigator.pop(context),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Status Tabs
              Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: statusTabs.map((status) {
                    bool isSelected = status == selectedStatus;
                    return GestureDetector(
                      onTap: () => setState(() => selectedStatus = status),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.green.shade800
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                "Mes incidents",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),

              Expanded(
                child: ListView.separated(
                  itemCount: incidents
                      .where((e) => e['status'] == selectedStatus)
                      .length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (_, i) {
                    final filtered = incidents
                        .where((e) => e['status'] == selectedStatus)
                        .toList();
                    final incident = filtered[i];
                    final progress = getProgress(incident['status']);
                    final status = incident['status'];

                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade400,
                            ),
                            child: const Icon(
                              Icons.image_outlined,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  incident['title'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  incident['desc'],
                                  style: const TextStyle(color: Colors.grey),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: statusColor(
                                          status,
                                        ).withOpacity(0.15),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            size: 8,
                                            color: statusColor(status),
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            status,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: statusColor(status),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_today,
                                          size: 14,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          incident['date'],
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: LinearProgressIndicator(
                                    value: progress,
                                    minHeight: 6,
                                    backgroundColor: Colors.grey.shade300,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      statusColor(status),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
