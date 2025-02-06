import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String? getAgeFromBirthDate(DateTime birthDate) {
  DateTime today = DateTime.now();

  int years = today.year - birthDate.year;
  int months = today.month - birthDate.month;
  int days = today.day - birthDate.day;

  // Adjust days and months if necessary
  if (days < 0) {
    months -= 1;
    int prevMonth = today.month - 1;
    if (prevMonth == 0) {
      prevMonth = 12;
    }
    days += DateTime(today.year, prevMonth + 1, 0).day;
  }

  if (months < 0) {
    years -= 1;
    months += 12;
  }

  if (years >= 1) {
    if (years == 1) {
      return '$years year';
    } else {
      return '$years years';
    }
  } else {
    return '$months months $days days';
  }
}

int? getAgeInMonths(DateTime birthDate) {
  DateTime today = DateTime.now();

  int years = today.year - birthDate.year;
  int months = today.month - birthDate.month;
  int days = today.day - birthDate.day;

  int ageInMonths = years * 12 + months;

  // Adjust if the day of the month hasn't occurred yet
  if (days < 0) {
    ageInMonths -= 1;
  }

  // Ensure age in months is not negative
  if (ageInMonths < 0) {
    ageInMonths = 0;
  }

  return ageInMonths;
}

String? calculateVaccineDueDate(
  DateTime birthDate,
  int vaccineDueAgeInMonths,
) {
  // Calculate the total number of months since year 0
  int totalMonths =
      (birthDate.year * 12 + birthDate.month) + vaccineDueAgeInMonths;

  // Calculate the new year and month
  int newYear = totalMonths ~/ 12;
  int newMonth = totalMonths % 12;
  if (newMonth == 0) {
    newYear -= 1;
    newMonth = 12;
  }

  // Adjust the day if the new month has fewer days
  int newDay = birthDate.day;
  int daysInNewMonth = DateTime(newYear, newMonth + 1, 0).day;
  if (newDay > daysInNewMonth) {
    newDay = daysInNewMonth;
  }

  // Create the vaccine due date
  DateTime vaccineDueDate = DateTime(newYear, newMonth, newDay);

  // Format the date as a string
  String formattedDate = DateFormat('yyyy-MM-dd').format(vaccineDueDate);

  return formattedDate;
}

String getSleepQuality(
  DateTime? birthDate,
  DateTime? sleepStart,
  DateTime? sleepEnd,
) {
  /// Check for null values
  if (sleepStart == null || sleepEnd == null || birthDate == null) {
    return 'تأكد من إدخال جميع البيانات المطلوبة: وقت النوم، وقت الاستيقاظ، وتاريخ الميلاد.';
  }

  // Calculate sleep duration
  Duration sleepDuration = sleepEnd.difference(sleepStart);
  double totalSleepHours = sleepDuration.inMinutes / 60;

  // Calculate age based on birth date
  DateTime today = DateTime.now();
  int years = today.year - birthDate.year;
  int months = today.month - birthDate.month;
  int days = today.day - birthDate.day;

  // Adjust days and months if necessary
  if (days < 0) {
    months -= 1;
    int prevMonth = today.month - 1;
    if (prevMonth == 0) {
      prevMonth = 12;
    }
    days += DateTime(today.year, prevMonth + 1, 0).day;
  }

  if (months < 0) {
    years -= 1;
    months += 12;
  }

  // Determine sleep quality
  /// نتيجة تقييم النوم
class SleepEvaluationResult {
  final String sleepQuality;  // مثال: "جودة النوم ممتازة" أو "ساعات زائدة"...
  final String advice;        // النصيحة المرتبطة بالحالة
  final bool isError;         // في حال كان هناك خطأ أو قيم غير منطقية

  SleepEvaluationResult({
    required this.sleepQuality,
    required this.advice,
    this.isError = false,
  });
}

////////////////////////////////////////////////////////////////////////////

/// تمثيل لكل شريحة عمرية وحدود النوم المرتبطة بها
class AgeSleepRange {
  final int minAge;             // أقل عمر في الشريحة (بالسنوات)
  final int maxAge;             // أكبر عمر في الشريحة (بالسنوات)
  final double recommendedMin;  // الحد الأدنى الموصى به
  final double recommendedMax;  // الحد الأعلى الموصى به
  final double oversleepLimit;  // اعتباره "نوم زائد" إذا تجاوز هذا الحد

  AgeSleepRange({
    required this.minAge,
    required this.maxAge,
    required this.recommendedMin,
    required this.recommendedMax,
    required this.oversleepLimit,
  });

  /// التحقق ما إذا كان العمر يقع ضمن هذه الشريحة
  bool inRange(int years) => years >= minAge && years <= maxAge;
}

////////////////////////////////////////////////////////////////////////////

// يمكنك تخصيص هذه القيم حسب توصياتك أو المراجع المعتمدة
final List<AgeSleepRange> ageRanges = [
  // من 0 إلى أقل من سنة
  AgeSleepRange(
    minAge: 0,
    maxAge: 0,        // استخدام 0 هنا يعني أقل من سنة
    recommendedMin: 12,
    recommendedMax: 16,
    oversleepLimit: 16, // ما بعد 16 نعتبره نوم زائد
  ),
  // من سنة إلى 3 سنوات
  AgeSleepRange(
    minAge: 1,
    maxAge: 3,
    recommendedMin: 11,
    recommendedMax: 14,
    oversleepLimit: 14,
  ),
  // من 4 إلى 5 سنوات (يمكنك دمج 3-5 بدلاً من تقسيمها إن أردت)
  AgeSleepRange(
    minAge: 4,
    maxAge: 5,
    recommendedMin: 10,
    recommendedMax: 13,
    oversleepLimit: 13,
  ),
  // من 6 إلى 12 سنة
  AgeSleepRange(
    minAge: 6,
    maxAge: 12,
    recommendedMin: 9,
    recommendedMax: 12,
    oversleepLimit: 12,
  ),
  // 13 سنة وأكثر (يمكنك تخصيصه لما بعد 12)
  AgeSleepRange(
    minAge: 13,
    maxAge: 99,       // حد كبير افتراضي
    recommendedMin: 7,
    recommendedMax: 10,
    oversleepLimit: 10,
  ),
];

////////////////////////////////////////////////////////////////////////////

/// دالة لتقييم ساعات النوم وإعطاء ملخص "جودة النوم" + "نصيحة"
SleepEvaluationResult evaluateSleepQuality(int years, double totalSleepHours) {
  // 1) معالجة بعض الحالات غير المنطقية:
  if (years < 0) {
    return SleepEvaluationResult(
      sleepQuality: 'خطأ في العمر',
      advice: 'العمر لا يمكن أن يكون سالباً.',
      isError: true,
    );
  }
  if (totalSleepHours < 0) {
    return SleepEvaluationResult(
      sleepQuality: 'خطأ في عدد الساعات',
      advice: 'عدد ساعات النوم لا يمكن أن يكون سالباً.',
      isError: true,
    );
  }

  // 2) إيجاد الشريحة العمرية المناسبة
  AgeSleepRange? range;
  // التعامل مع العمر تحت السنة (years == 0 يعني أقل من سنة)،
  // أو البحث في القائمة إذا كان >= 1
  if (years == 0) {
    // أقل من سنة
    range = ageRanges.firstWhere((r) => r.minAge == 0 && r.maxAge == 0, orElse: () => ageRanges[0]);
  } else {
    range = ageRanges.firstWhere(
      (r) => r.inRange(years),
      orElse: () => ageRanges.last, // إذا لم نجد شريحة صريحة، نختار الأخيرة
    );
  }

  // في حال لم يتم العثور على شريحة لأي سبب
  if (range == null) {
    return SleepEvaluationResult(
      sleepQuality: 'شريحة عمرية غير محددة',
      advice: 'لم يتم العثور على توصيات لعمر: $years',
      isError: true,
    );
  }

  // 3) تحديد ما إذا كان نومًا زائدًا
  if (totalSleepHours > range.oversleepLimit) {
    return SleepEvaluationResult(
      sleepQuality: 'ساعات زائدة من النوم',
      advice:
          'قد يشير النوم الزائد إلى إرهاقٍ شديد أو سببٍ صحي آخر. في حال استمر ذلك، يُنصح باستشارة طبيب.',
    );
  }

  // 4) مقارنة ساعات النوم بالقيم الموصى بها لتحديد الجودة:
  //    - ممتازة: عند أو فوق الحد الأعلى الموصى به (لكن ضمن حد النوم الزائد)
  //    - جيدة: بين الحد الأدنى والحد الأعلى
  //    - سيئة: أقل من الحد الأدنى
  if (totalSleepHours >= range.recommendedMax) {
    return SleepEvaluationResult(
      sleepQuality: 'جودة النوم ممتازة',
      advice: 'استمر بهذه العادات الجيدة وواصل تقديم بيئة نوم مناسبة.',
    );
  } else if (totalSleepHours >= range.recommendedMin) {
    return SleepEvaluationResult(
      sleepQuality: 'جودة النوم جيدة',
      advice: 'طفلك يحصل على نوم كافٍ. الاستمرارية والتنظيم مفيدان على المدى الطويل.',
    );
  } else {
    return SleepEvaluationResult(
      sleepQuality: 'جودة النوم سيئة',
      advice: 'طفلك لا يحصل على نوم كافٍ. حاول مراجعة روتين النوم وتقليل المشتتات.',
    );
  }
}

////////////////////////////////////////////////////////////////////////////

/// دالة لحساب مدة النوم من وقت البداية والنهاية
String calculateSleepDuration(
  DateTime? sleepStart,
  DateTime? sleepEnd,
) {
  if (sleepStart == null || sleepEnd == null) {
    return '0 ساعات و 0 دقائق'; // مدخلات غير صالحة
  }

  // إذا وقت النهاية قبل وقت البداية، نفترض أن وقت النهاية في اليوم التالي:
  if (sleepEnd.isBefore(sleepStart)) {
    // نتحقق إن كان الفرق في حدود معقولة (<= 12 ساعة فرق)
    final diffHours = sleepEnd.difference(sleepStart).inHours.abs();
    if (diffHours <= 12) {
      // نضيف يوماً واحداً لتصحيح التاريخ
      sleepEnd = sleepEnd.add(const Duration(days: 1));
    } else {
      // فرق غير منطقي (مثل يوم سابق)، نُعيد رسالة خطأ
      return "خطأ: وقت النهاية قبل وقت البداية بزمن غير منطقي.";
    }
  }

  // نحسب المدة
  final Duration sleepDuration = sleepEnd.difference(sleepStart);
  final int hours = sleepDuration.inHours;
  final int minutes = sleepDuration.inMinutes % 60;

  if (hours < 0 || minutes < 0) {
    return '0 ساعات و 0 دقائق';
  }

  return '$hours ساعة و $minutes دقيقة';
}

////////////////////////////////////////////////////////////////////////////

/// مثال على استخدام الدالتين
void main() {
  // نفترض أن العمر 2 سنوات، وساعات النوم المحسوبة 15 ساعة:
  final evaluation = evaluateSleepQuality(2, 15.0);

  print('جودة النوم: ${evaluation.sleepQuality}');
  print('النصيحة: ${evaluation.advice}');
  if (evaluation.isError) {
    print('تنبيه: هناك خطأ في المدخلات أو الحساب.');
  }

  // حساب مدة نوم من 10 مساءً إلى 6 صباحاً
  final sleepStart = DateTime(2025, 2, 6, 22, 0); // 10 PM
  final sleepEnd   = DateTime(2025, 2, 7, 6, 0);  // 6 AM
  final duration = calculateSleepDuration(sleepStart, sleepEnd);
  print('مدة النوم: $duration');
}

String? formatMealCount(double? mealCount) {
  if (mealCount == 1) {
    return '$mealCount وجبة';
  } else if (mealCount! > 1) {
    return '$mealCount وجبات';
  } else {
    return 'عدد الوجبات غير محدد';
  }
}
