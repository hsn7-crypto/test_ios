import 'package:test_ios/constants.dart';
import 'package:test_ios/core/utils/app_hive.dart';
import 'package:test_ios/core/utils/app_router.dart';
import 'package:test_ios/core/utils/functions/my_show_dialog.dart';
import 'package:test_ios/core/utils/functions/show_snack_bar.dart';
import 'package:test_ios/core/utils/functions/sum_salary/main_function.dart';
import 'package:test_ios/features/add_trip/domain/entitys/trip_data_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quiver/time.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../main_information/domain/entitys/main_information_entity.dart';

part 'update_trip_state.dart';

class UpdateTripCubit extends Cubit<UpdateTripState> {
  UpdateTripCubit(this.index) : super(UpdateTripInitial());
  bool isShowChildrenNum = false;
  ////////////////////////////////////////////////////////////////////
  late TextEditingController mainSalaryController;
  late TextEditingController numberOfHoursPerDayController;
  late TextEditingController childrenNumController;

  String overnight = '';
  String maritalStatus = '';

  MainInformationEntity? mainInformation;

  double bonuses = 0;
  double discounts = 0;

  DateTime? startTripDate;
  DateTime? endTripDate;

  List<DateTime> tripHolidays = [];

  List<DateTime> jobdays = [];
  List<DateTime> holidays = [];
  List<DateTime> fridayAndSaturdayHoliday = [];
  /////////////////////////////////////////////////////////////////////
  final int index;

  int indexPage = 0;
  late PageController pageController = PageController();
  late DateRangePickerController dateRangePickerController;

  TextEditingController bonusesTextController = TextEditingController(
    text: '0',
  );

  TextEditingController discountsTextController = TextEditingController(
    text: '0',
  );

  @override
  Future<void> close() {
    dateRangePickerController.dispose();
    pageController.dispose();
    bonusesTextController.dispose();
    discountsTextController.dispose();
    mainSalaryController.dispose();
    return super.close();
  }

  void init() {
    dateRangePickerController = DateRangePickerController();

    TripDataEntity tripData = getTripData();

    mainInformation = tripData.mainInformation;

    startTripDate = tripData.startTripDate;
    endTripDate = tripData.endTripDate;
    jobdays.addAll(tripData.jobdays);
    holidays.addAll(tripData.holidays);
    tripHolidays.addAll(tripData.holidays);
    fridayAndSaturdayHoliday.addAll(tripData.fridayAndSaturdayHoliday);
    bonuses = tripData.bonuses;
    discounts = tripData.discounts;

    mainSalaryController = TextEditingController(
      text: tripData.mainInformation.mainSalary.toString(),
    );
    numberOfHoursPerDayController = TextEditingController(
      text: tripData.mainInformation.numberOfHoursPerDay.toString(),
    );
    childrenNumController = TextEditingController(
      text: tripData.mainInformation.childrenNum.toString(),
    );
    overnight = tripData.mainInformation.overnight.toString();
    maritalStatus = tripData.mainInformation.maritalStatus.toString();

    canShowChildrenNum(maritalStatus: maritalStatus);

    emit(UpdateTripInitialStartAndEndTrip());
  }

  TripDataEntity getTripData() {
    Box<TripDataEntity> tripDataBox = Hive.box<TripDataEntity>(
      AppHive.tripData,
    );

    List<TripDataEntity> trips = tripDataBox.values.toList();

    trips.sort((a, b) => a.startTripDate!.compareTo(b.startTripDate!));
    TripDataEntity tripData = trips.elementAt(index);
    return tripData;
  }

  void updateTrip(TripDataEntity tripData) {
    Box<TripDataEntity> tripDataBox = Hive.box(AppHive.tripData);
    tripDataBox.putAt(index, tripData);
  }

  void nextButton(BuildContext context) {
    if (indexPage == 0) {
      toggleStartAndEndTripDate();
      bonusesTextController.text = bonuses.toString();
      discountsTextController.text = discounts.toString();
    } else if (indexPage == 2) {
      if (canSaveTrip()) {
        myShowDialog(
          context,
          yesTap: () {
            nextPage();
            GoRouter.of(context).pop();
          },
          noTap: () {
            upateData(false, context);
            showSnackBarSuccess(context, message: 'تم تعديل البيانات بنجاح');
            GoRouter.of(context).pop();
            GoRouter.of(context).go(AppRouter.layoutView);
          },
        );
      }
    } else if (indexPage == 3) {
      upateData(true, context);
      showSnackBarSuccess(context, message: 'تم تعديل البيانات بنجاح');
      GoRouter.of(context).go(AppRouter.layoutView);
    } else {
      nextPage();
    }
  }

  Future<void> upateData(bool yes, BuildContext context) async {
    if (yes) {
      Either<bool, String> isEmpty = checkEmptyTextField(context);
      isEmpty.fold((isNotEmpty) {
        mainInformation!.setMainSalary = mainSalaryController.text;
        mainInformation!.setNumberOfHoursPerDay =
            numberOfHoursPerDayController.text;
        mainInformation!.setOvernight = overnight;
        mainInformation!.maritalStatus = maritalStatus;
        mainInformation!.setChildrenNum = childrenNumController.text;

        TripDataEntity? result = salaryCalculation(
          mainInformation: mainInformation!,
          fridayAndSaturdayHoliday: fridayAndSaturdayHoliday,
          holidays: holidays,
          jobdays: jobdays,
        );

        updateTrip(result!);
      }, (message) => showSnackBarInfo(context, message: message));
    } else {
      TripDataEntity? result = salaryCalculation(
        mainInformation: mainInformation!,
        fridayAndSaturdayHoliday: fridayAndSaturdayHoliday,
        holidays: holidays,
        jobdays: jobdays,
      );
      updateTrip(result!);
    }
  }

  Either<bool, String> checkEmptyTextField(BuildContext context) {
    if (mainSalaryController.text.isEmpty) {
      return right('يرجى إدخال المرتب الأساسي, لا تتركه فارغاً');
    }
    if (numberOfHoursPerDayController.text.isEmpty) {
      return right('يرجى إدخال عدد الساعات لليوم الواحد, لا تتركه فارغاً');
    }
    return left(true);
  }

  TripDataEntity? salaryCalculation({
    required List<DateTime> jobdays,
    required List<DateTime> holidays,
    required List<DateTime> fridayAndSaturdayHoliday,
    required MainInformationEntity mainInformation,
  }) {
    double bonuses = _getBonuses();
    double discounts = _getDiscounts();

    int holidayCount = holidays.length + fridayAndSaturdayHoliday.length;
    int dayCount = jobdays.length + holidayCount;

    int year = endTripDate!.year;
    int month = endTripDate!.month;
    DateTime startDate = DateTime(year, month, 1);

    TripDataEntity? result =
        SumSalary(
          dayCount: dayCount,
          holidayCount: holidayCount,
        ).getResultFromUpdateSalary(
          mainInformation: mainInformation,
          bonuses: bonuses,
          discounts: discounts,
          startTripDate: startDate,
          endTripDate: endTripDate!,
          jobdays: jobdays,
          holidays: holidays,
          fridayAndSaturdayHoliday: fridayAndSaturdayHoliday,
        );

    return result;
  }

  double _getBonuses() {
    return double.parse(bonusesTextController.text);
  }

  double _getDiscounts() {
    return double.parse(discountsTextController.text);
  }

  void toggleStartAndEndTripDate() {
    if (isSelectedTripDate()) {
      jobdays.clear();
      holidays.clear();
      fridayAndSaturdayHoliday.clear();

      List<PickerDateRange> selectedRanges =
          dateRangePickerController.selectedRanges!;
      for (int i = 0; i < selectedRanges.length; i++) {
        PickerDateRange dateRange = selectedRanges[i];
        for (
          DateTime date = dateRange.startDate!;
          date.isBefore(dateRange.endDate!.add(const Duration(days: 1)));
          date = date.add(const Duration(days: 1))
        ) {
          if (date.weekday == DateTime.friday ||
              date.weekday == DateTime.saturday) {
            if (!fridayAndSaturdayHoliday.contains(date)) {
              fridayAndSaturdayHoliday.add(date);
            }
          } else {
            if (tripHolidays.contains(date)) {
              holidays.add(date);
            } else if (!jobdays.contains(date)) {
              jobdays.add(date);
            }
          }
        }
      }

      bool isToggle = toggleStartAndEndTripDateFromRangeDate(
        rangeDate: dateRangePickerController.selectedRanges,
      );

      if (isToggle) {
        nextPage();
      }
    }
  }

  bool toggleStartAndEndTripDateFromRangeDate({
    required List<PickerDateRange>? rangeDate,
  }) {
    bool isToggle = false;
    if (rangeDate != null) {
      isToggle = true;
      startTripDate = rangeDate.first.startDate;
      endTripDate = rangeDate.last.endDate;
    }

    return isToggle;
  }

  void selectedDay({required CalendarTapDetails selectedDay}) {
    if (jobdays.contains(selectedDay.date) ||
        holidays.contains(selectedDay.date)) {
      if (holidays.contains(selectedDay.date)) {
        deleteHolidayInTrip(selectedDay: selectedDay);
        jobdays.add(selectedDay.date!);
      } else {
        addHolidayInTrip(selectedDay: selectedDay);
        jobdays.remove(selectedDay.date);
      }
    }
  }

  void deleteHolidayInTrip({required CalendarTapDetails selectedDay}) {
    holidays.remove(selectedDay.date);

    emit(UpdateTripDeleteHolidayInTrip());
  }

  void addHolidayInTrip({required CalendarTapDetails selectedDay}) {
    holidays.add(selectedDay.date!);
    emit(UpdateTripAddHolidayInTrip());
  }

  void changeIndexPage({required int index}) {
    indexPage = index;
  }

  bool canSaveTrip() {
    return startTripDate != null &&
        endTripDate != null &&
        bonusesTextController.text.isNotEmpty &&
        discountsTextController.text.isNotEmpty;
  }

  bool isSelectedTripDate() {
    return dateRangePickerController.selectedRanges != null &&
        dateRangePickerController.selectedRanges!.isNotEmpty;
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

  List<PickerDateRange>? initialSelectedRanges() {
    List<DateTime> dates = jobdays + holidays + fridayAndSaturdayHoliday;
    if (dates.isEmpty) {
      return null;
    }
    dates.sort((a, b) => a.day.compareTo(b.day));

    List<PickerDateRange>? pickerDateRange = [];

    DateTime startDate = dates.first;

    for (int i = 0; i < dates.length - 1; i++) {
      if ((dates[i + 1].day - dates[i].day) > 1) {
        pickerDateRange.add(PickerDateRange(startDate, dates[i]));
        startDate = dates[i + 1];
      }
    }
    pickerDateRange.add(PickerDateRange(startDate, dates.last));

    return pickerDateRange;
  }

  DateTime? getMinDate() {
    DateTime? startDate;
    if (startTripDate != null) {
      startDate = DateTime(startTripDate!.year, startTripDate!.month, 1);
    }
    return startDate;
  }

  DateTime? getMaxDate() {
    DateTime? endDate;
    if (endTripDate != null) {
      int day = daysInMonth(endTripDate!.year, endTripDate!.month);
      endDate = DateTime(endTripDate!.year, endTripDate!.month, day);
    }
    return endDate;
  }

  Future<bool> backButton(BuildContext context) async {
    if (indexPage == 0) {
      return true;
    } else {
      previousPage();
    }
    return false;
  }

  void previousButton(BuildContext context) {
    if (indexPage == 0) {
      GoRouter.of(context).pop();
    }
    if (indexPage == 1) {
      //init();
      //dateRangePickerController.selectedRanges = initialSelectedRanges();
    }
    previousPage();
  }

  void canShowChildrenNum({required String maritalStatus}) {
    isShowChildrenNum = maritalStatus == genderList.last;
    emit(UpdateTripCanShowChildrenNum());
  }
}
