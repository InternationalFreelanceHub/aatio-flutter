class DictEntry {
  final String name;
  final String text;
  const DictEntry(this.name, this.text);
}

class DictPage {
  final String title;
  final List<DictEntry> entries;
  const DictPage(this.title, this.entries);
}
