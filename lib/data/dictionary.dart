import 'dictionary_models.dart';
import 'dictionary_part1.dart';
import 'dictionary_part2.dart';
import 'dictionary_part3.dart';

final List<DictPage> dictionaryPages = [...dictPart1, ...dictPart2, ...dictPart3];

const String alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

// Which dictionary page each letter opens (page numbers start at 0).
const Map<String, int> letterToPage = {
  'A': 0, 'B': 0, 'C': 0,
  'D': 1, 'E': 1, 'F': 1,
  'G': 2, 'H': 2,
  'I': 3, 'J': 3,
  'K': 4, 'L': 4,
  'M': 5,
  'N': 6, 'O': 6, 'P': 6,
  'Q': 7, 'R': 7,
  'S': 8, 'T': 8,
  'U': 9, 'V': 9, 'W': 9,
  'X': 10, 'Y': 10, 'Z': 10,
};
