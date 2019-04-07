fun is_older(date1: int * int * int, date2: int * int * int) =
  let
    val year1 = #1 date1
    val month1 = #2 date1
    val day1 = #3 date1
    val year2 = #1 date2
    val month2 = #2 date2
    val day2 = #3 date2
  in
    year1 < year2 orelse
    (
      year1 = year2 andalso
      (
        month1 < month2 orelse
        (month1 = month2 andalso
          day1 < day2
        )
      )
    )
  end


(*
 * number_in_month(
 *   [(1900, 2, 45), (1900, 2, 17), (1900, 3, 54)],
 *   3
 * ) --> 1 (only one date is in month 3)
 *
 *)
fun number_in_month(dates: (int * int * int) list, month: int) =
  let
    fun seconds(triples: (int * int * int) list) =
      if null triples then
        []
      else
        (#2 (hd triples))::seconds(tl triples)

    fun countOccurrences(haystack: int list, needle: int) =
      if null haystack then
        0
      else
        if needle = hd haystack then
          1 + countOccurrences(tl haystack, needle)
        else
          0 + countOccurrences(tl haystack, needle)
  in
    let
      val monthsOnly = seconds(dates)
    in
      countOccurrences(monthsOnly, month)
    end
  end

fun number_in_months(dates: (int * int * int) list, months: int list) =
  if null months then
    0
  else
    number_in_month(dates, hd months) + number_in_months(dates, tl months)

fun dates_in_month(dates: (int * int * int) list, month: int) =
  if null dates then
    []
  else
    if #2 (hd dates) = month then
      (hd dates)::dates_in_month(tl dates, month)
    else
      dates_in_month(tl dates, month)


fun dates_in_months(dates: (int * int * int) list, months: int list) =
  if null months then
    []
  else
    dates_in_month(dates, hd months)@dates_in_months(dates, tl months)

fun get_nth(items: string list, index: int) =
  if index = 1 then
    hd items
  else
    get_nth(tl items, index - 1)

(* (2014, 12, 19) --> "December 19, 2014" *)
fun date_to_string(date: (int * int * int)) =
  let
    val year = #1 date
    val month = #2 date
    val day = #3 date
    val months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ]
  in
    get_nth(months, month) ^
    " " ^
    Int.toString(day) ^ ", " ^
    Int.toString(year)
  end

fun number_before_reaching_sum(sum: int, numbers: int list) =
  let
    fun addUntilSum(currentSum: int, nums: int list) =
      if currentSum + hd nums >= sum then
        0
      else
        1 + addUntilSum(currentSum + hd nums, tl nums)
  in
    addUntilSum(0, numbers)
  end

fun what_month(dayOfYear: int) =
  let
    val daysInMonths = [
      31,
      28,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ]
  in
    1 + number_before_reaching_sum(dayOfYear, daysInMonths)
  end

fun month_range(dayOfYear1, dayOfYear2) =
  if dayOfYear1 > dayOfYear2 then
    []
  else
    what_month(dayOfYear1)::month_range(dayOfYear1 + 1, dayOfYear2)

fun oldest(dates: (int * int * int) list) =
  let
    fun oldestInNonEmpty(dates: (int * int * int) list) =
      if null (tl dates) then
        hd dates
      else
        let
          val oldestAmongRest = oldestInNonEmpty(tl dates)
        in
          if is_older(hd dates, oldestAmongRest) then
            hd dates
          else
            oldestAmongRest
        end
  in
    if null dates then
      NONE
    else
      SOME (oldestInNonEmpty dates)
  end


(* HELPERS for "challenge" problems *)
fun has(haystack: int list, needle: int) =
  if null haystack then
    false
  else if needle = hd haystack then
    true
  else
    has(tl haystack, needle: int)

fun unique(someList: int list) =
  if null someList then
    []
  else
    if has(tl someList, hd someList) then
      unique(tl someList)
    else
      (hd someList)::unique(tl someList)

(* CHALLENGE problems *)
fun number_in_months_challenge(dates: (int * int * int) list, months: int list) =
  number_in_months(dates, unique(months))

fun dates_in_months_challenge(dates: (int * int * int) list, months: int list) =
  dates_in_months(dates, unique(months))

fun reasonable_date(date: int * int * int) =
  let
    val year = #1 date
    val month = #2 date
    val day = #3 date
    val daysInMonths = [
      31,
      28,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ]

    fun get_nthInt(items: int list, index: int) =
      if index = 1 then
        hd items
      else
        get_nthInt(tl items, index - 1)

    fun isDivisible(dividend: int, divisor: int) =
      if dividend = divisor then
        true
      else if dividend < divisor then
        false
      else
        isDivisible(dividend - divisor, divisor)

    fun isLeapYear(year: int) =
        isDivisible(year, 400) orelse (
          isDivisible(year, 4) andalso (isDivisible(year, 100) = false)
        )
  in
    year > 0 andalso month > 0 andalso month < 13 andalso day > 0 andalso (
      (month = 2 andalso
        (
          (isLeapYear(year) andalso day <= 29)
          orelse
          (isLeapYear(year) = false andalso day <= 28)
        )
      )
      orelse
      (month <> 2 andalso day <= get_nthInt(daysInMonths, month))
    )
  end
