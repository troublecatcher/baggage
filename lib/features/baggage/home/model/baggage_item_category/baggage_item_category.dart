import 'package:hive_flutter/hive_flutter.dart';

part 'baggage_item_category.g.dart';

@HiveType(typeId: 1)
enum BaggageItemCategory {
  @HiveField(0)
  clothes(
    name: 'Clothes and shoes',
    assetPath: 'assets/icons/tshirt-crew.svg',
  ),
  @HiveField(1)
  hygiene(
    name: 'Hygiene products',
    assetPath: 'assets/icons/toothbrush-paste.svg',
  ),
  @HiveField(2)
  cosmetics(
    name: 'Cosmetics',
    assetPath: 'assets/icons/bottle-tonic.svg',
  ),
  @HiveField(3)
  electronics(
    name: 'Electronics',
    assetPath: 'assets/icons/devices.svg',
  ),
  @HiveField(4)
  medication(
    name: 'Medication',
    assetPath: 'assets/icons/pill-multiple.svg',
  ),
  @HiveField(5)
  jewelry(
    name: 'Jewelry and valuables',
    assetPath: 'assets/icons/treasure-chest.svg',
  ),
  @HiveField(6)
  documents(
    name: 'Personal documents',
    assetPath: 'assets/icons/file-sign.svg',
  );

  final String name;
  final String assetPath;

  const BaggageItemCategory({required this.name, required this.assetPath});
}
