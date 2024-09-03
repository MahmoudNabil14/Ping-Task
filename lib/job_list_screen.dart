import 'package:flutter/material.dart';
import 'package:flutter_interview/job_provider.dart';
import 'package:flutter_interview/selected_jobs_screen.dart';
import 'package:provider/provider.dart';

class JobListScreen extends StatelessWidget {
  const JobListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => JobProvider(),
      child: Builder(builder: (context) {
        final jobProvider = Provider.of<JobProvider>(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Job List'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: jobProvider.jobs.length,
                    itemBuilder: (context, index) {
                      final job = jobProvider.jobs[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(value: jobProvider.selectedJobs.contains(job), onChanged: (value) {}),
                          Text('${job.name} (${job.percentage}%)'),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  jobProvider.addJob(job);
                                },
                                icon: const Icon(Icons.add),
                              ),
                              IconButton(
                                onPressed: () {
                                  jobProvider.removeJob(job);
                                },
                                icon: const Icon(Icons.remove),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SelectedJobsScreen(selectedJobs: jobProvider.selectedJobs,),
                    ));
                  },
                  child: const Text('View Selected Jobs'),
                ),
                const SizedBox(height: 30),
                // clear selection button
                ElevatedButton(
                  onPressed: () {
                    jobProvider.clearSelection();
                  },
                  child: const Text('Clear Selection', style: TextStyle(color: Colors.red)),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      }),
    );
  }
}
