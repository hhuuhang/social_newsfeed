timeCreated(String timeCreate) {
  DateTime now = DateTime.now().toUtc();
  String dayNow =
      "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

  String hourNow = "${now.hour.toString().padLeft(2, '0')}";

  String minNow = "${now.minute.toString().padLeft(2, '0')}";

  String day = timeCreate.substring(0, 10);

  String hour = timeCreate.substring(11, 13);
  String min = timeCreate.substring(14, 16);

  int hNow = int.parse(hourNow);
  int h = int.parse(hour);
  int t = hNow - h;

  int mNow = int.parse(minNow);
  int m = int.parse(min);
  int minmin = mNow - m;
  int minfix = mNow + 60 - m;

  String finalHour = "$t giờ trước";
  String finalMin = "$minfix phút trước";
  String finalMinMin = "$minmin phút trước";

  String finalTime = "$day lúc $hour:$min";

  if (day == dayNow) {
    if (t > 1) {
      return finalHour;
    }
    if (t == 1) {
      return finalMin;
    } else {
      return finalMinMin;
    }
  } else {
    return finalTime;
  }
}
