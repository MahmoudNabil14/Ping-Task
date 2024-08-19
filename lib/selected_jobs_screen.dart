import 'package:flutter/material.dart';
import 'package:flutter_interview/job_provider.dart';
import 'package:provider/provider.dart';

class SelectedJobsScreen extends StatelessWidget {
  const SelectedJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final jobProvider = Provider.of<JobProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selected Jobs'),
      ),
      body: ListView.builder(
        itemCount: jobProvider.selectedJobs.length,
        itemBuilder: (context, index) {
          final job = jobProvider.selectedJobs[index];
          return ListTile(
            title: Text('${job.name} (${job.percentage}%)'),
          );
        },
      ),
    );
  }
}
