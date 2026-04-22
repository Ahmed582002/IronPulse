class EndPoint {
  static String baseUrl = "https://fitness-d9b5b-default-rtdb.firebaseio.com";

  static String plans = "/plans.json";
  static String trainers = "/trainers.json";
}

class ApiKey {
  static String status = "status";
  static String errorMessage = "message";

  //! Plans
  static String id = "id";
  static String name = "name";
  static String description = "description";
  static String level = "level";
  static String durationWeeks = "durationWeeks";
  static String image = "image";
  static String steps = "steps";

  //! Steps
  static String week = "week";
  static String day = "day";
  static String workoutName = "workoutName";
  static String duration = "duration";
  static String reps = "reps";

  //! Trainers
  static String trainers = "trainers";
  static String specialty = "specialty";
  static String rating = "rating";
  static String experienceYears = "experienceYears";
}
