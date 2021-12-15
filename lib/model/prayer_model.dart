class PrayerModel {
  PrayerModel({
    this.code,
    this.status,
    this.results,
  });

  int? code;
  String? status;
  Results? results;

  factory PrayerModel.fromJson(Map<String, dynamic> json) => PrayerModel(
    code: json["code"],
    status: json["status"],
    results: Results.fromJson(json["results"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "results": results!.toJson(),
  };
}

class Results {
  Results({
    this.datetime,

  });

  List<Datetime>? datetime;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    datetime: List<Datetime>.from(json["datetime"].map((x) => Datetime.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "datetime": List<dynamic>.from(datetime!.map((x) => x.toJson())),
  };
}

class Datetime {
  Datetime({
    this.times,
    this.date,
  });

  Times? times;
  Date? date;

  factory Datetime.fromJson(Map<String, dynamic> json) => Datetime(
    times: Times.fromJson(json["times"]),
    date: Date.fromJson(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "times": times!.toJson(),
    "date": date!.toJson(),
  };
}

class Date {
  Date({
    this.timestamp,
    this.gregorian,
    this.hijri,
  });

  int? timestamp;
  DateTime? gregorian;
  DateTime? hijri;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    timestamp: json["timestamp"],
    gregorian: DateTime.parse(json["gregorian"]),
    hijri: DateTime.parse(json["hijri"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp,
    "gregorian": "${gregorian!.year.toString().padLeft(4, '0')}-${gregorian!.month.toString().padLeft(2, '0')}-${gregorian!.day.toString().padLeft(2, '0')}",
    "hijri": "${hijri!.year.toString().padLeft(4, '0')}-${hijri!.month.toString().padLeft(2, '0')}-${hijri!.day.toString().padLeft(2, '0')}",
  };
}

class Times {
  Times({
    this.imsak,
    this.sunrise,
    this.fajr,
    this.dhuhr,
    this.asr,
    this.sunset,
    this.maghrib,
    this.isha,
    this.midnight,
  });

  String? imsak;
  String? sunrise;
  String? fajr;
  String? dhuhr;
  String? asr;
  String? sunset;
  String? maghrib;
  String? isha;
  String? midnight;

  factory Times.fromJson(Map<String, dynamic> json) => Times(
    imsak: json["Imsak"],
    sunrise: json["Sunrise"],
    fajr: json["Fajr"],
    dhuhr: json["Dhuhr"],
    asr: json["Asr"],
    sunset: json["Sunset"],
    maghrib: json["Maghrib"],
    isha: json["Isha"],
    midnight: json["Midnight"],
  );

  Map<String, dynamic> toJson() => {
    "Imsak": imsak,
    "Sunrise": sunrise,
    "Fajr": fajr,
    "Dhuhr": dhuhr,
    "Asr": asr,
    "Sunset": sunset,
    "Maghrib": maghrib,
    "Isha": isha,
    "Midnight": midnight,
  };
}


