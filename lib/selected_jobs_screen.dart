import 'package:flutter/material.dart';
import 'package:flutter_interview/job_model.dart';
import 'package:flutter_interview/job_provider.dart';
import 'package:provider/provider.dart';

class SelectedJobsScreen extends StatelessWidget {
  final List<Job> selectedJobs;
  const SelectedJobsScreen({super.key, required this.selectedJobs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selected Jobs'),
      ),
      body: ListView.builder(
        itemCount: selectedJobs.length,
        itemBuilder: (context, index) {
          final job = selectedJobs[index];
          return ListTile(
            title: Text('${job.name} (${job.percentage}%)'),
          );
        },
      ),
    );
  }
}
