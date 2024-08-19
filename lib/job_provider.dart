import 'package:flutter/material.dart';
import 'package:flutter_interview/job_model.dart';

class JobProvider with ChangeNotifier {
  final List<Job> _jobs = [
    Job(id: 1, name: "Job 1", percentage: 50.0),
    Job(id: 2, name: "Job 2", percentage: 60.0),
    Job(id: 3, name: "Job 3", percentage: 70.0),
    Job(id: 4, name: "Job 1", percentage: 80.0),
    Job(id: 5, name: "Job 4", percentage: 90.0),
    Job(id: 6, name: "Job 5", percentage: 100.0),

  ];

  List<Job> get jobs => _jobs;

  final List<Job> _selectedJobs = [];

  List<Job> get selectedJobs => _selectedJobs;

  void addJob(Job job) {
    _selectedJobs.add(job);
    notifyListeners();
  }

  void removeJob(Job job) {
    _selectedJobs.remove(job);
    notifyListeners();
  }




  void clearSelection() {
    _selectedJobs.clear();
  }
}
