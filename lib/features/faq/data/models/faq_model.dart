class FaqModel {
  final String question;
  final String answer;

  FaqModel({required this.question, required this.answer});
}

List<FaqModel> getFaqList() {
  return [
    FaqModel(
      question: "What is Life?",
      answer: "Life is a convenient app that connects you with qualified nurses for home care, post-surgery support, and more.",
    ),
    FaqModel(
      question: "How do I book a nurse?",
      answer: "Simply open the app, select the care type, choose a schedule, and confirm your booking.",
    ),
    FaqModel(
      question: "Are the nurses qualified and certified?",
      answer: "Yes, all nurses are licensed professionals who have passed thorough background checks.",
    ),
    FaqModel(
      question: "Can I request a nurse for a family member?",
      answer: "Yes! You can book a nurse for yourself or a loved one through the app.",
    ),
    FaqModel(
      question: "What services do the nurses provide?",
      answer: "Our nurses offer home care, post-surgery recovery, elderly care, medication management, and more.",
    ),
    FaqModel(
      question: "How much does it cost to hire a nurse?",
      answer: "Pricing varies based on service type and duration. Estimated costs are shown before booking.",
    ),
    FaqModel(
      question: "Can I request emergency nursing care?",
      answer: "Yes, we offer on-demand urgent care. However, for life-threatening emergencies, call emergency services.",
    ),
    FaqModel(
      question: "How can I pay for the service?",
      answer: "We accept credit/debit cards, mobile wallets, and in-app payment methods.",
    ),
    FaqModel(
      question: "Can I schedule a recurring visit?",
      answer: "Yes! You can book a nurse for daily, weekly, or monthly visits.",
    ),
    FaqModel(
      question: "What if I need to cancel or reschedule my booking?",
      answer: "You can cancel or reschedule through the app, subject to the cancellation policy.",
    ),
  ];
}
