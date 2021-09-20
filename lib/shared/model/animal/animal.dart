class Animal {
  final String name;

  Animal(this.name);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Animal && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return 'Animal{name: $name}';
  }
}