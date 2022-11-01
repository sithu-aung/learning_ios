class QuizOne {
  String? multiSelect;
  String? answer;

  QuizOne({
    required this.multiSelect,
    this.answer,
  });
}

List<QuizOne> quizList1 = [
  QuizOne(multiSelect: 'မြေသားအနုအကြမ်း', answer: 'မြေသားအနုအကြမ်း'),
  QuizOne(
      multiSelect: 'မြေဆီလွှာ၏ ဖွဲ့စည်းတည်ဆောက်ပုံ',
      answer: 'မြေဆီလွှာ၏ ဖွဲ့စည်းတည်ဆောက်ပုံ'),
  QuizOne(
    multiSelect: 'မြေဆီလွှာ၏ ပြုမှုများ',
  ),
  QuizOne(
    multiSelect: 'မြေကြီးအနံ့',
  ),
  QuizOne(
    multiSelect: 'ပြောင်းလဲဖလှယ်နိုင်စွမ်း',
  ),
];
