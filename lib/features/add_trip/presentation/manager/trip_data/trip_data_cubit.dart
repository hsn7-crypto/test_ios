import 'package:test_ios/core/utils/app_hive.dart';
import 'package:test_ios/core/errors/error.dart';
import 'package:test_ios/core/utils/app_router.dart';
import 'package:test_ios/core/utils/functions/show_snack_bar.dart';
import 'package:test_ios/core/utils/functions/sum_salary/main_function.dart';
import 'package:test_ios/features/add_trip/data/models/trip_data.model.dart';
import 'package:test_ios/features/add_trip/domain/entitys/trip_data_entity.dart';
import 'package:test_ios/features/add_trip/domain/use_cases/save_trip_data_use_case.dart';
import 'package:test_ios/features/main_information/domain/entitys/main_information_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:quiver/time.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

part 'trip_data_state.dart';

class TripDataCubit extends Cubit<TripDataState> {
  final SaveTripDataUseCase saveTripDataUseCase;
  TripDataCubit({required this.saveTripDataUseCase}) : super(TripDataInitial());

  TripDataModel tripData = TripDataModel.empty();

  int indexPage = 0;
  PageController pageController = PageController();
  DateRangePickerController dateRangePickerController =
      DateRangePickerController();

  TextEditingController bonusesFirstMonthTextController = TextEditingController(
    text: '0',
  );
  TextEditingController bonusesSecondMonthTextController =
      TextEditingController(text: '0');
  TextEditingController discountsFirstMonthTextController =
      TextEditingController(text: '0');
  TextEditingController discountsSecondMonthTextController =
      TextEditingController(text: '0');

  List<DateTime> fridayAndSaturdayHoliday = [];
  List<DateTime> jobdays = [];
  List<DateTime> holidays = [];

  @override
  Future<void> close() {
    pageController.dispose();
    dateRangePickerController.dispose();
    bonusesFirstMonthTextController.dispose();
    bonusesSecondMonthTextController.dispose();
    discountsFirstMonthTextController.dispose();
    discountsSecondMonthTextController.dispose();
    return super.close();
  }

  void saveTripData({required TripDataEntity tripData}) {
    Either<Failure, bool> result = saveTripDataUseCase.call(tripData);

    result.fold(
      (Failure failure) {
        emit(TripDataFailure(message: failure.message));
      },
      (bool seved) {
        updatePersonalLoanAndPersonalLoanInstallment(
          personalLoan: tripData.mainInformation.personalLoan,
          personalLoanInstallment:
              tripData.mainInformation.personalLoanInstallment,
        );

        emit(TripDataLoaded());
        //showToastSuccess(msg: 'تم حفظ البينات بنجاح');
      },
    );
  }

  void updatePersonalLoanAndPersonalLoanInstallment({
    required double personalLoan,
    required double personalLoanInstallment,
  }) {
    Box<MainInformationEntity> mainInformationBox =
        Hive.box<MainInformationEntity>(AppHive.mainInformation);
    MainInformationEntity mainInformationData = mainInformationBox.values.first
        .clone();

    mainInformationData.setPersonalLoan =
        (personalLoan - personalLoanInstallment).toString();
    mainInformationData.setPersonalLoanInstallment =
        (personalLoan - personalLoanInstallment == 0
                ? 0
                : personalLoanInstallment)
            .toString();

    mainInformationBox.put(AppHive.mainInformation, mainInformationData);
  }

  Future<bool> backButton() async {
    if (indexPage == 0) {
      return true;
    } else {
      previousPage();
    }
    return false;
  }

  bool isHoliday(MonthCellDetails details) {
    return tripData.holidays.contains(details.date) ||
        tripData.fridayAndSaturdayHoliday.contains(details.date);
  }

  void addFridayOrSaturdayDays(MonthCellDetails details) {
    if (details.date.isAfter(
          tripData.startTripDate!.add(const Duration(days: -1)),
        ) &&
        details.date.isBefore(
          tripData.endTripDate!.add(const Duration(days: 1)),
        )) {
      if (details.date.weekday == DateTime.friday ||
          details.date.weekday == DateTime.saturday) {
        if (!tripData.fridayAndSaturdayHoliday.contains(details.date)) {
          fridayAndSaturdayHoliday.add(details.date);
        }
      } else {
        if (!tripData.jobdays.contains(details.date)) {
          jobdays.add(details.date);
        }
      }
    }
    // if (details.date
    //         .isAfter(tripData.startTripDate!.add(const Duration(days: -1))) &&
    //     details.date
    //         .isBefore(tripData.endTripDate!.add(const Duration(days: 1)))) {
    //   if (details.date.weekday == DateTime.friday ||
    //       details.date.weekday == DateTime.saturday) {
    //     if (!tripData.fridayAndSaturdayHoliday.contains(details.date)) {
    //       tripData.fridayAndSaturdayHoliday.add(details.date);
    //     }
    //   } else {
    //     if (!tripData.jobdays.contains(details.date)) {
    //       tripData.jobdays.add(details.date);
    //     }
    //   }
    // }
    emit(state);
  }

  void nextButton(BuildContext context) {
    if (indexPage == 0) {
      toggleStartAndEndTripDate(context);
    } else if (indexPage == 2) {
      if (canSaveTrip()) {
        saveData();
        showSnackBarSuccess(context, message: 'تم حفظ البينات بنجاح');
        GoRouter.of(context).pop();
        GoRouter.of(context).pushReplacement(AppRouter.layoutView);
      }
    } else {
      nextPage();
    }
  }

  void addDayInList() {
    fridayAndSaturdayHoliday.clear();
    holidays.clear();
    jobdays.clear();
    PickerDateRange selectedRange = dateRangePickerController.selectedRange!;

    for (
      DateTime date = selectedRange.startDate!;
      date.isBefore(selectedRange.endDate!.add(const Duration(days: 1)));
      date = date.add(const Duration(days: 1))
    ) {
      if (date.weekday == DateTime.friday ||
          date.weekday == DateTime.saturday) {
        if (!tripData.fridayAndSaturdayHoliday.contains(date)) {
          fridayAndSaturdayHoliday.add(date);
        }
      } else {
        if (!tripData.jobdays.contains(date)) {
          jobdays.add(date);
        }
      }
    }
    emit(state);
  }

  Future<void> saveData() async {
    Box<TripDataEntity> tripDataBox = Hive.box<TripDataEntity>(
      AppHive.tripData,
    );

    if (tripDataBox.isNotEmpty) {
      TripDataEntity tripLocalData = tripDataBox.values.last;

      if (tripData.startTripDate!.month != tripData.endTripDate!.month &&
          tripData.startTripDate!.year == tripData.endTripDate!.year) {
        if (tripLocalData.endTripDate!.month == tripData.startTripDate!.month) {
          saveMoreThanMonth(tripLocalData);
        } else {
          //////////الشهر اللي ماخدمهنش ومابين اخر شهر خدمه والشهر اللي توا////////////
          saveOffMonthData(tripLocalData);
          //////////////////////////////////
          saveMoreThanMonthEmptyData();
        }
      } else {
        if (tripLocalData.endTripDate!.month == tripData.startTripDate!.month &&
            tripLocalData.endTripDate!.year == tripData.startTripDate!.year) {
          TripDataEntity? result = salaryCalculation(
            fridayAndSaturdayHoliday:
                tripLocalData.fridayAndSaturdayHoliday +
                fridayAndSaturdayHoliday,
            holidays: tripLocalData.holidays + holidays,
            jobdays: tripLocalData.jobdays + jobdays,
          );
          // TripDataEntity? result = salaryCalculation(
          //   fridayAndSaturdayHoliday: tripLocalData.fridayAndSaturdayHoliday +
          //       tripData.fridayAndSaturdayHoliday,
          //   holidays: tripLocalData.holidays + holidays,
          //   jobdays: tripLocalData.jobdays + jobdays,
          // );
          await deleteTripData();
          saveTripData(tripData: result!);
        } else {
          /////////////الشهر اللي ماخدمهنش ومابين اخر شهر خدمه والشهر اللي توا/////////////////////
          saveOffMonthData(tripLocalData);
          /////////////////////////////////////////////////////////////////////////////
          TripDataEntity? result = salaryCalculation(
            fridayAndSaturdayHoliday: fridayAndSaturdayHoliday,
            holidays: holidays,
            jobdays: jobdays,
          );
          // TripDataEntity? result = salaryCalculation(
          //   fridayAndSaturdayHoliday: tripData.fridayAndSaturdayHoliday,
          //   holidays: tripData.holidays,
          //   jobdays: tripData.jobdays,
          // );

          saveTripData(tripData: result!);
        }
      }
    } else {
      if (tripData.startTripDate!.month != tripData.endTripDate!.month) {
        saveMoreThanMonthEmptyData();
      } else {
        TripDataEntity? result = salaryCalculation(
          fridayAndSaturdayHoliday: fridayAndSaturdayHoliday,
          holidays: holidays,
          jobdays: jobdays,
        );
        saveTripData(tripData: result!);
      }
    }
  }

  void saveOffMonthData(TripDataEntity tripLocalData) {
    int monthBetween = getMonthBetween(tripLocalData);
    DateTime startTripDate = tripLocalData.endTripDate!;
    for (int i = 1; i < monthBetween; i++) {
      DateTime date = DateTime(startTripDate.year, startTripDate.month + i, 1);
      TripDataEntity? monthsBetweenResult = SumSalary(
        dayCount: 0,
        holidayCount: 0,
      ).getResultOffMonth(startTripDate: date, endTripDate: date);
      saveTripData(tripData: monthsBetweenResult!);
    }
  }

  int getMonthBetween(TripDataEntity tripLocalData) {
    int yearsDiff =
        tripData.startTripDate!.year - tripLocalData.endTripDate!.year;
    int monthsDiff =
        tripData.startTripDate!.month - tripLocalData.endTripDate!.month;
    int monthBetween = yearsDiff * 12 + monthsDiff;
    return monthBetween;
  }

  void saveMoreThanMonthEmptyData() {
    Map<String, List<DateTime>> dateGroups = getGroupDates(
      dates: jobdays + holidays + fridayAndSaturdayHoliday,
    );
    // Map<String, List<DateTime>> dateGroups = getGroupDates(
    //   dates: tripData.jobdays +
    //       tripData.holidays +
    //       tripData.fridayAndSaturdayHoliday,
    // );

    dateGroups.forEach((key, value) {
      List<DateTime> monthHolidays = [];
      List<DateTime> monthFridayAndSaturdayHoliday = [];
      List<DateTime> monthJobdays = [];

      TripDataEntity? result;
      for (DateTime date in value) {
        value.sort((a, b) {
          return a.compareTo(b);
        });

        if (holidays.contains(date)) {
          monthHolidays.add(date);
        } else if (fridayAndSaturdayHoliday.contains(date)) {
          monthFridayAndSaturdayHoliday.add(date);
        } else {
          monthJobdays.add(date);
        }
      }

      result = salaryCalculationEmptyData(
        startDate: value.first,
        endDate: value.last,
        fridayAndSaturdayHoliday: monthFridayAndSaturdayHoliday,
        holidays: monthHolidays,
        jobdays: monthJobdays,
      );

      saveTripData(tripData: result!);
    });
  }

  TripDataEntity? salaryCalculationEmptyData({
    required DateTime startDate,
    required DateTime endDate,
    required List<DateTime> jobdays,
    required List<DateTime> holidays,
    required List<DateTime> fridayAndSaturdayHoliday,
  }) {
    double bonuses = _getBonuses();
    double discounts = _getDiscounts();

    int holidayCount = holidays.length + fridayAndSaturdayHoliday.length;
    int dayCount = jobdays.length + holidayCount;

    TripDataEntity? result =
        SumSalary(dayCount: dayCount, holidayCount: holidayCount).getResult(
          bonuses: bonuses,
          discounts: discounts,
          startTripDate: startDate,
          endTripDate: endDate,
          jobdays: jobdays,
          holidays: holidays,
          fridayAndSaturdayHoliday: fridayAndSaturdayHoliday,
        );
    return result;
  }

  void saveMoreThanMonth(TripDataEntity tripLocalData) {
    Map<String, List<DateTime>> dateGroups = getGroupDates(
      dates: jobdays + holidays + fridayAndSaturdayHoliday,
    );

    // Map<String, List<DateTime>> dateGroups = getGroupDates(
    //   dates: tripData.jobdays +
    //       tripData.holidays +
    //       tripData.fridayAndSaturdayHoliday,
    // );

    dateGroups.forEach((key, value) async {
      List<DateTime> monthHolidays = [];
      List<DateTime> monthFridayAndSaturdayHoliday = [];
      List<DateTime> monthJobdays = [];
      int lastMonth = value.first.month;
      TripDataEntity? result;

      for (DateTime date in value) {
        if (holidays.contains(date)) {
          monthHolidays.add(date);
        } else if (fridayAndSaturdayHoliday.contains(date)) {
          monthFridayAndSaturdayHoliday.add(date);
        } else {
          monthJobdays.add(date);
        }
        // if (tripData.holidays.contains(date)) {
        //   holidays.add(date);
        // } else if (tripData.fridayAndSaturdayHoliday.contains(date)) {
        //   fridayAndSaturdayHoliday.add(date);
        // } else {
        //   jobdays.add(date);
        // }
      }

      if (lastMonth == tripLocalData.startTripDate!.month) {
        result = salaryCalculationUpdateLocalData(
          tripLocalData: tripLocalData,
          fridayAndSaturdayHoliday:
              monthFridayAndSaturdayHoliday, //fridayAndSaturdayHoliday,
          holidays: monthHolidays, // holidays,
          jobdays: monthJobdays, //jobdays,
        );

        await deleteTripData();

        saveTripData(tripData: result!);
      } else {
        result = salaryCalculation(
          fridayAndSaturdayHoliday: monthFridayAndSaturdayHoliday,
          holidays: monthHolidays,
          jobdays: monthJobdays,
        );
        // result = salaryCalculation(
        //   fridayAndSaturdayHoliday: fridayAndSaturdayHoliday,
        //   holidays: holidays,
        //   jobdays: jobdays,
        // );

        saveTripData(tripData: result!);
      }

      lastMonth = value.first.month;
    });
  }

  Future<void> deleteTripData() async {
    Box<TripDataEntity> box = Hive.box<TripDataEntity>(AppHive.tripData);
    await box.deleteAt(box.length - 1);
  }

  TripDataEntity? salaryCalculation({
    required List<DateTime> jobdays,
    required List<DateTime> holidays,
    required List<DateTime> fridayAndSaturdayHoliday,
  }) {
    double bonuses = _getBonuses();
    double discounts = _getDiscounts();

    int holidayCount = holidays.length + fridayAndSaturdayHoliday.length;
    int dayCount = jobdays.length + holidayCount;

    int year = tripData.endTripDate!.year;
    int month = tripData.endTripDate!.month;
    DateTime startDate = DateTime(year, month, 1);

    TripDataEntity? result =
        SumSalary(dayCount: dayCount, holidayCount: holidayCount).getResult(
          bonuses: bonuses,
          discounts: discounts,
          startTripDate: startDate,
          endTripDate: tripData.endTripDate!,
          jobdays: jobdays,
          holidays: holidays,
          fridayAndSaturdayHoliday: fridayAndSaturdayHoliday,
        );

    return result;
  }

  TripDataEntity? salaryCalculationUpdateLocalData({
    required TripDataEntity tripLocalData,
    required List<DateTime> jobdays,
    required List<DateTime> holidays,
    required List<DateTime> fridayAndSaturdayHoliday,
  }) {
    double bonuses = _getBonuses();
    double discounts = _getDiscounts();

    int holidayCount =
        tripLocalData.holidays.length +
        tripLocalData.fridayAndSaturdayHoliday.length +
        holidays.length +
        fridayAndSaturdayHoliday.length;

    int dayCount = tripLocalData.jobdays.length + jobdays.length + holidayCount;

    int year = tripLocalData.startTripDate!.year;
    int month = tripLocalData.startTripDate!.month;
    int endDay = daysInMonth(year, month);
    DateTime endDate = DateTime(year, month, endDay);

    TripDataEntity? result =
        SumSalary(dayCount: dayCount, holidayCount: holidayCount).getResult(
          bonuses: bonuses + tripLocalData.bonuses,
          discounts: discounts + tripLocalData.discounts,
          startTripDate: tripLocalData.startTripDate!,
          endTripDate: endDate,
          jobdays: tripLocalData.jobdays + jobdays,
          holidays: tripLocalData.holidays + holidays,
          fridayAndSaturdayHoliday:
              tripLocalData.fridayAndSaturdayHoliday + fridayAndSaturdayHoliday,
        );
    return result;
  }

  int getCountMonthOff({required List<DateTime> dates}) {
    dates.sort((a, b) {
      return a.compareTo(b);
    });

    Map<String, String> groupDates = {};

    DateFormat formatter = DateFormat('yyyy-MM');
    int monthCount = 0;
    for (var date in dates) {
      String month = formatter.format(date);
      if (!groupDates.containsKey(month)) {
        groupDates[month] = '';
        monthCount++;
      }
    }
    return monthCount;
  }

  Map<String, List<DateTime>> getGroupDates({required List<DateTime> dates}) {
    dates.sort((a, b) {
      return a.compareTo(b);
    });

    Map<String, List<DateTime>> groupDates = {};
    DateFormat formatter = DateFormat('yyyy-MM');
    for (var date in dates) {
      String month = formatter.format(date);
      if (!groupDates.containsKey(month)) {
        groupDates[month] = [];
      }
      groupDates[month]!.add(date);
    }
    return groupDates;
  }

  double _getBonuses() {
    return double.parse(bonusesFirstMonthTextController.text) +
        double.parse(bonusesSecondMonthTextController.text);
  }

  double _getDiscounts() {
    return double.parse(discountsFirstMonthTextController.text) +
        double.parse(discountsSecondMonthTextController.text);
  }

  void previousButton(BuildContext context) {
    if (indexPage == 0) {
      GoRouter.of(context).pop();
    }
    previousPage();
  }

  bool canSaveTrip() {
    return (tripData.startTripDate != null &&
        tripData.endTripDate != null &&
        bonusesFirstMonthTextController.text.isNotEmpty &&
        discountsFirstMonthTextController.text.isNotEmpty &&
        (monthCount() != 1
            ? bonusesSecondMonthTextController.text.isNotEmpty &&
                  discountsSecondMonthTextController.text.isNotEmpty
            : true));
  }

  void selectedDay({required CalendarTapDetails selectedDay}) {
    if (holidays.contains(selectedDay.date)) {
      holidays.remove(selectedDay.date);
      jobdays.add(selectedDay.date!);
      emit(TripDataDeleteHolidayInTrip());
    } else {
      holidays.add(selectedDay.date!);
      jobdays.remove(selectedDay.date);
      emit(TripDataAddHolidayInTrip());
    }
    // if (tripData.jobdays.contains(selectedDay.date) ||
    //     tripData.holidays.contains(selectedDay.date)) {}
    // if (tripData.holidays.contains(selectedDay.date)) {
    //   deleteHolidayInTrip(selectedDay: selectedDay);
    //   tripData.jobdays.add(selectedDay.date!);
    // } else {
    //   addHolidayInTrip(selectedDay: selectedDay);
    //   tripData.jobdays.remove(selectedDay.date);
    // }
    //log('--------------------------------------------------------');
    //log(holidays.toString());
    //log(jobdays.toString());
    //log('--------------------------------------------------------');
  }

  void addHolidayInTrip({required CalendarTapDetails selectedDay}) {
    tripData.holidays.add(selectedDay.date!);
    emit(TripDataAddHolidayInTrip());
  }

  void deleteHolidayInTrip({required CalendarTapDetails selectedDay}) {
    tripData.holidays.remove(selectedDay.date);

    emit(TripDataDeleteHolidayInTrip());
  }

  void changeIndexPage({required int index}) {
    indexPage = index;
  }

  void toggleStartAndEndTripDate(BuildContext context) {
    if (isSelectedTripDate()) {
      tripData.jobdays.clear();
      tripData.holidays.clear();

      tripData.fridayAndSaturdayHoliday.clear();

      bool isToggle = tripData.toggleStartAndEndTripDate(
        date: dateRangePickerController.selectedRange,
      );

      addDayInList();

      if (isToggle) {
        nextPage();
      }
    } else {
      showSnackBarInfo(context, message: 'الرجاء إختيار تاريخ الرحلة');
    }
  }

  DateTime? getMinAndDate() {
    Box<TripDataEntity> box = Hive.box<TripDataEntity>(AppHive.tripData);
    if (box.isNotEmpty) {
      return box.values.last.endTripDate!.add(const Duration(days: 1));
    }
    return null;
  }

  bool isSelectedTripDate() {
    return dateRangePickerController.selectedRange?.startDate != null &&
        dateRangePickerController.selectedRange?.endDate != null;
  }

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
  }

  void previousPage() {
    if (indexPage == 1) {
      //tripData.clearjobdayAndholiday();
    }
    pageController.previousPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  int monthCount() {
    if (tripData.startTripDate!.month == tripData.endTripDate!.month) {
      return 1;
    }

    int yearsDifference =
        tripData.endTripDate!.year - tripData.startTripDate!.year;
    int monthsDifference =
        tripData.endTripDate!.month - tripData.startTripDate!.month;

    int result = yearsDifference * 12 + monthsDifference;

    return result + 1;
  }
}
