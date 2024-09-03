class Job {
  final int id;
  final String name;
  final double percentage;

  Job({required this.id, required this.name, required this.percentage});

  @override
  bool operator ==(Object other) => identical(this, other) || other is Job && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => name.hashCode;
}
