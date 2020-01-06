class Activities {
  static const String RUNNING = "Running";
  static const String CYCLING = "Cycling";
  static const String SWIMMING = "Swimming";
  static const String YOGA = "Yoga";
  static const String DANCING = "Dancing";
  static const String GYM = "Gym";
}

class HobbyStats {
  final Map<String, List<GraphData>> statsMap;

  HobbyStats({this.statsMap});
}

class GraphData implements Comparable<GraphData> {
  String label;
  int value;

  GraphData(this.label, this.value);

  @override
  int compareTo(GraphData other) {
    return this.value.compareTo(other.value);
  }
}

HobbyStats runningStats = HobbyStats(
  statsMap: {"Day": runningDayData, "Week": runningWeekData, "Month": runningMonthData},
);

HobbyStats cyclingStats = HobbyStats(
  statsMap: {"Day": cyclingDayData, "Week": cyclingWeekData, "Month": cyclingMonthData},
);

HobbyStats swimmingStats = HobbyStats(
  statsMap: {"Day": swimmingDayData, "Week": swimmingWeekData, "Month": swimmingMonthData},
);

HobbyStats yogaStats = HobbyStats(
  statsMap: {"Day": yogaDayData, "Week": yogaWeekData, "Month": yogaMonthData},
);

HobbyStats dancingStats = HobbyStats(
  statsMap: {"Day": dancingDayData, "Week": dancingWeekData, "Month": dancingMonthData},
);

HobbyStats gymStats = HobbyStats(
  statsMap: {"Day": gymDayData, "Week": gymWeekData, "Month": gymMonthData},
);

Map<String, HobbyStats> allStats = {
  Activities.RUNNING: runningStats,
  Activities.CYCLING: cyclingStats,
  Activities.SWIMMING: swimmingStats,
  Activities.YOGA: yogaStats,
  Activities.DANCING: dancingStats,
  Activities.GYM: gymStats,
};

List<GraphData> runningDayData = [
  GraphData("12am", 100),
  GraphData("3am", 80),
  GraphData("6am", 70),
  GraphData("9am", 120),
  GraphData("12pm", 90),
  GraphData("3pm", 160),
  GraphData("6pm", 90),
  GraphData("9pm", 50),
  GraphData("12pm", 80)
];

List<GraphData> cyclingDayData = [
  GraphData("12am", 10),
  GraphData("3am", 40),
  GraphData("6am", 90),
  GraphData("9am", 20),
  GraphData("12pm", 150),
  GraphData("3pm", 60),
  GraphData("6pm", 50),
  GraphData("9pm", 90),
  GraphData("12pm", 60)
];

List<GraphData> swimmingDayData = [
  GraphData("12am", 90),
  GraphData("3am", 30),
  GraphData("6am", 110),
  GraphData("9am", 50),
  GraphData("12pm", 100),
  GraphData("3pm", 70),
  GraphData("6pm", 30),
  GraphData("9pm", 45),
  GraphData("12pm", 40)
];

List<GraphData> yogaDayData = [
  GraphData("12am", 30),
  GraphData("3am", 10),
  GraphData("6am", 60),
  GraphData("9am", 90),
  GraphData("12pm", 30),
  GraphData("3pm", 50),
  GraphData("6pm", 80),
  GraphData("9pm", 90),
  GraphData("12pm", 70)
];

List<GraphData> dancingDayData = [
  GraphData("12am", 90),
  GraphData("3am", 30),
  GraphData("6am", 70),
  GraphData("9am", 30),
  GraphData("12pm", 60),
  GraphData("3pm", 20),
  GraphData("6pm", 100),
  GraphData("9pm", 60),
  GraphData("12pm", 40)
];

List<GraphData> gymDayData = [
  GraphData("12am", 120),
  GraphData("3am", 130),
  GraphData("6am", 90),
  GraphData("9am", 80),
  GraphData("12pm", 90),
  GraphData("3pm", 80),
  GraphData("6pm", 120),
  GraphData("9pm", 50),
  GraphData("12pm", 70)
];

List<GraphData> runningWeekData = [
  GraphData("Sunday", 2000),
  GraphData("Monday", 1800),
  GraphData("Tuesday", 1900),
  GraphData("Wednesday", 1300),
  GraphData("Thursday", 1500),
  GraphData("Friday", 3500),
  GraphData("Saturday", 4000)
];

List<GraphData> cyclingWeekData = [
  GraphData("Sunday", 1000),
  GraphData("Monday", 1500),
  GraphData("Tuesday", 1300),
  GraphData("Wednesday", 1100),
  GraphData("Thursday", 1900),
  GraphData("Friday", 1200),
  GraphData("Saturday", 3000)
];

List<GraphData> swimmingWeekData = [
  GraphData("Sunday", 1200),
  GraphData("Monday", 1100),
  GraphData("Tuesday", 1000),
  GraphData("Wednesday", 800),
  GraphData("Thursday", 1200),
  GraphData("Friday", 1100),
  GraphData("Saturday", 900)
];

List<GraphData> yogaWeekData = [
  GraphData("Sunday", 1000),
  GraphData("Monday", 500),
  GraphData("Tuesday", 900),
  GraphData("Wednesday", 300),
  GraphData("Thursday", 500),
  GraphData("Friday", 2500),
  GraphData("Saturday", 2000)
];

List<GraphData> dancingWeekData = [
  GraphData("Sunday", 600),
  GraphData("Monday", 900),
  GraphData("Tuesday", 1000),
  GraphData("Wednesday", 700),
  GraphData("Thursday", 700),
  GraphData("Friday", 1200),
  GraphData("Saturday", 800)
];

List<GraphData> gymWeekData = [
  GraphData("Sunday", 800),
  GraphData("Monday", 700),
  GraphData("Tuesday", 900),
  GraphData("Wednesday", 600),
  GraphData("Thursday", 900),
  GraphData("Friday", 1000),
  GraphData("Saturday", 500)
];

List<GraphData> runningMonthData = [
  GraphData("01", 2000),
  GraphData("02", 500),
  GraphData("03", 320),
  GraphData("04", 490),
  GraphData("05", 450),
  GraphData("06", 600),
  GraphData("07", 650),
  GraphData("08", 700),
  GraphData("09", 670),
  GraphData("10", 350),
  GraphData("11", 420),
  GraphData("12", 450),
  GraphData("13", 800),
  GraphData("14", 300),
  GraphData("15", 900),
  GraphData("16", 750),
  GraphData("17", 650),
  GraphData("18", 200),
  GraphData("19", 950),
  GraphData("20", 1600),
  GraphData("21", 1800),
  GraphData("22", 1100),
  GraphData("23", 1000),
  GraphData("24", 950),
  GraphData("25", 500),
  GraphData("26", 600),
  GraphData("27", 650),
  GraphData("28", 360),
  GraphData("29", 100),
  GraphData("30", 300),
];

List<GraphData> cyclingMonthData = [
  GraphData("01", 200),
  GraphData("02", 100),
  GraphData("03", 520),
  GraphData("04", 990),
  GraphData("05", 150),
  GraphData("06", 300),
  GraphData("07", 950),
  GraphData("08", 700),
  GraphData("09", 670),
  GraphData("10", 350),
  GraphData("11", 420),
  GraphData("12", 450),
  GraphData("13", 800),
  GraphData("14", 100),
  GraphData("15", 900),
  GraphData("16", 750),
  GraphData("17", 650),
  GraphData("18", 200),
  GraphData("19", 950),
  GraphData("20", 600),
  GraphData("21", 800),
  GraphData("22", 700),
  GraphData("23", 1000),
  GraphData("24", 950),
  GraphData("25", 500),
  GraphData("26", 600),
  GraphData("27", 650),
  GraphData("28", 560),
  GraphData("29", 200),
  GraphData("30", 500),
];

List<GraphData> swimmingMonthData = [
  GraphData("01", 900),
  GraphData("02", 300),
  GraphData("03", 220),
  GraphData("04", 1290),
  GraphData("05", 1050),
  GraphData("06", 310),
  GraphData("07", 650),
  GraphData("08", 300),
  GraphData("09", 570),
  GraphData("10", 850),
  GraphData("11", 920),
  GraphData("12", 550),
  GraphData("13", 600),
  GraphData("14", 500),
  GraphData("15", 700),
  GraphData("16", 350),
  GraphData("17", 450),
  GraphData("18", 1200),
  GraphData("19", 1050),
  GraphData("20", 900),
  GraphData("21", 300),
  GraphData("22", 300),
  GraphData("23", 200),
  GraphData("24", 650),
  GraphData("25", 900),
  GraphData("26", 1100),
  GraphData("27", 1350),
  GraphData("28", 500),
  GraphData("29", 500),
  GraphData("30", 700),
];

List<GraphData> yogaMonthData = [
  GraphData("01", 1900),
  GraphData("02", 1300),
  GraphData("03", 120),
  GraphData("04", 190),
  GraphData("05", 550),
  GraphData("06", 810),
  GraphData("07", 450),
  GraphData("08", 200),
  GraphData("09", 170),
  GraphData("10", 650),
  GraphData("11", 320),
  GraphData("12", 850),
  GraphData("13", 900),
  GraphData("14", 300),
  GraphData("15", 900),
  GraphData("16", 650),
  GraphData("17", 950),
  GraphData("18", 1000),
  GraphData("19", 750),
  GraphData("20", 600),
  GraphData("21", 500),
  GraphData("22", 600),
  GraphData("23", 700),
  GraphData("24", 950),
  GraphData("25", 500),
  GraphData("26", 900),
  GraphData("27", 350),
  GraphData("28", 1500),
  GraphData("29", 500),
  GraphData("30", 300),
];

List<GraphData> dancingMonthData = [
  GraphData("01", 900),
  GraphData("02", 800),
  GraphData("03", 720),
  GraphData("04", 590),
  GraphData("05", 950),
  GraphData("06", 610),
  GraphData("07", 950),
  GraphData("08", 600),
  GraphData("09", 570),
  GraphData("10", 150),
  GraphData("11", 720),
  GraphData("12", 550),
  GraphData("13", 800),
  GraphData("14", 600),
  GraphData("15", 700),
  GraphData("16", 950),
  GraphData("17", 350),
  GraphData("18", 1100),
  GraphData("19", 1250),
  GraphData("20", 900),
  GraphData("21", 800),
  GraphData("22", 400),
  GraphData("23", 600),
  GraphData("24", 850),
  GraphData("25", 600),
  GraphData("26", 800),
  GraphData("27", 550),
  GraphData("28", 500),
  GraphData("29", 900),
  GraphData("30", 700),
];

List<GraphData> gymMonthData = [
  GraphData("01", 1900),
  GraphData("02", 1200),
  GraphData("03", 1700),
  GraphData("04", 890),
  GraphData("05", 650),
  GraphData("06", 810),
  GraphData("07", 550),
  GraphData("08", 800),
  GraphData("09", 470),
  GraphData("10", 750),
  GraphData("11", 620),
  GraphData("12", 750),
  GraphData("13", 700),
  GraphData("14", 500),
  GraphData("15", 800),
  GraphData("16", 750),
  GraphData("17", 650),
  GraphData("18", 100),
  GraphData("19", 250),
  GraphData("20", 700),
  GraphData("21", 600),
  GraphData("22", 700),
  GraphData("23", 500),
  GraphData("24", 950),
  GraphData("25", 900),
  GraphData("26", 200),
  GraphData("27", 350),
  GraphData("28", 400),
  GraphData("29", 800),
  GraphData("30", 200),
];
