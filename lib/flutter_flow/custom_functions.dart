import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
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
  DateTime? sleepStart,
  DateTime? sleepEnd,
  DateTime? birthDate,
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
  String sleepQuality;
  String advice;

  if (years < 1) {
    if (totalSleepHours >= 14) {
      sleepQuality = 'جودة النوم ممتازة';
      advice = 'طفلك يحصل على نوم ممتاز. حافظ على جدول نوم منتظم!';
    } else if (totalSleepHours >= 12) {
      sleepQuality = 'جودة النوم جيدة';
      advice = 'طفلك يحصل على نوم جيد. جرب أن تضمن روتين نوم هادئ.';
    } else {
      sleepQuality = 'جودة النوم سيئة';
      advice = 'طفلك لا يحصل على نوم كافٍ. حاول تقليل المشتتات قبل النوم.';
    }
  } else if (years >= 1 && years <= 3) {
    if (totalSleepHours >= 13) {
      sleepQuality = 'جودة النوم ممتازة';
      advice = 'نوم رائع! تأكد من استمرار اتباع روتين نوم منتظم.';
    } else if (totalSleepHours >= 11) {
      sleepQuality = 'جودة النوم جيدة';
      advice = 'طفلك يحصل على نوم جيد، لكن القليل من المزيد قد يكون مفيدًا.';
    } else {
      sleepQuality = 'جودة النوم سيئة';
      advice = 'نوم طفلك يمكن أن يتحسن. حاول تقليل وقت الشاشات قبل النوم.';
    }
  } else if (years > 3 && years <= 5) {
    if (totalSleepHours >= 12) {
      sleepQuality = 'جودة النوم ممتازة';
      advice = 'نوم رائع! حافظ على جدول نوم منتظم.';
    } else if (totalSleepHours >= 10) {
      sleepQuality = 'جودة النوم جيدة';
      advice = 'طفلك يحصل على نوم كافٍ، لكن المزيد من التنظيم قد يساعد.';
    } else {
      sleepQuality = 'جودة النوم سيئة';
      advice = 'قد يحتاج طفلك إلى المزيد من النوم. جرب اتباع روتين نوم ثابت.';
    }
  } else if (years > 5 && years <= 12) {
    if (totalSleepHours >= 11) {
      sleepQuality = 'جودة النوم ممتازة';
      advice = 'عمل رائع! تأكد من وجود بيئة هادئة لنوم مريح.';
    } else if (totalSleepHours >= 9) {
      sleepQuality = 'جودة النوم جيدة';
      advice = 'طفلك يحصل على نوم كافٍ. شجعه على اتباع عادات نوم جيدة.';
    } else {
      sleepQuality = 'جودة النوم سيئة';
      advice =
          'طفلك قد يحتاج إلى المزيد من النوم. حاول تقليل المنبهات مثل الكافيين أو وقت الشاشة.';
    }
  } else {
    if (totalSleepHours >= 9) {
      sleepQuality = 'جودة النوم ممتازة';
      advice = 'نوم رائع! استمر في العمل الجيد مع روتين نوم منتظم.';
    } else if (totalSleepHours >= 7) {
      sleepQuality = 'جودة النوم جيدة';
      advice = 'طفلك يحصل على نوم كافٍ، ولكن المزيد من الراحة قد يكون مفيدًا.';
    } else {
      sleepQuality = 'جودة النوم سيئة';
      advice =
          'حاول تعزيز أوقات النوم المبكرة أو تقليل المشتتات الليلية لتحسين النوم.';
    }
  }

  return '$sleepQuality\n$advice';
}
