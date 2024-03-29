
/// Enum for Text Field
enum TextFieldType {
  EMAIL,
  EMAIL_ENHANCED,
  PASSWORD,
  NAME,
  @Deprecated('Use MULTILINE instead. ADDRESS will be removed in major update')
  ADDRESS,
  MULTILINE,
  OTHER,
  PHONE,
  URL,
  NUMBER,
  DATE,
  USERNAME
}
enum JobStatus{
  newJob,
  applied,
  active,
  booked,
  inactive,
  rejected,
  offered,
  requestedReschedule,
  rescheduled,
  cancelled,
  completed,
  rescheduleDeclined,
  alternativeProposed,
  alternativeDeclined,
  alternativeAccepted
}
