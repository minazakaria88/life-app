class PostMediationModel
{
  final int experience;
  final int job;
  final int nationality;
  final int visaNumber;

  PostMediationModel({
    required this.experience,
    required this.job,
    required this.nationality,
    required this.visaNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'experience': experience,
      'job': job,
      'nationality': nationality,
      'visa_number': visaNumber,
    };
  }

}