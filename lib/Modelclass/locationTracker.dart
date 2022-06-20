import 'package:hive/hive.dart';
part 'locationTracker.g.dart';

@HiveType(typeId: 0)
class locationTracker extends HiveObject {
  @HiveField(0)
  late String location;
  @HiveField(1)
  late double latitude;
  @HiveField(2)
  late double longitude;
  locationTracker(this.location, this.latitude, this.longitude);
}
