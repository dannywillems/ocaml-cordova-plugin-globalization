(* -------------------------------------------------------------------------- *)
type format_length =
  | Short [@js "short"]
  | Medium [@js "medium"]
  | Long [@js "long"]
  | Full [@js "full"]
  [@@js.enum]

type selector =
  | Date [@js "date"]
  | Time [@js "time"]
  | Date_and_time [@js "date_and_time"]
  [@@js.enum]

type options_date = private Ojs.t
val create_options_date :
  ?format_length:(format_length [@js.default Short])  ->
  ?selector:(selector [@js.default Date_and_time])    ->
  unit                                                ->
  options_date
[@@js.builder]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
type date_names_type =
  | Wide [@js "wide"]
  | Narrow [@js "narrow"]
  [@@js.enum]

type date_names_item =
  | Months [@js "months"]
  | Days [@js "days"]
  [@@js.enum]

type options_date_names = private Ojs.t
val create_options_date_names :
  ?type_:(date_names_type [@js.default Wide])   ->
  ?item:(date_names_item [@js.default Months])  ->
  unit                                          ->
  options_date_names
[@@js.builder]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
type number_type =
  | Decimal [@js "decimal"]
  | Percent [@js "percent"]
  | Currency [@js "currency"]
  [@@js.enum]

type options_number_pattern = private Ojs.t
val create_options_number_pattern :
  ?type_:(number_type [@js.default Decimal]) ->
  unit                                                  ->
  options_number_pattern
[@@js.builder]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
type number_pattern = private Ojs.t
val number_pattern              : number_pattern -> string
[@@js.get "pattern"]
val number_pattern_symbol       : number_pattern -> string
[@@js.get "symbol"]
val number_pattern_fraction     : number_pattern -> int
[@@js.get "fraction"]
val number_pattern_rounding     : number_pattern -> int
[@@js.get "rounding"]
val number_pattern_positive     : number_pattern -> string
[@@js.get "positive"]
val number_pattern_negative     : number_pattern -> string
[@@js.get "negative"]
val number_pattern_decimal      : number_pattern -> string
[@@js.get "decimal"]
val number_pattern_grouping     : number_pattern -> string
[@@js.get "grouping"]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
type date_pattern = private Ojs.t

val date_pattern : date_pattern -> string
[@@js.get "pattern"]
val date_pattern_timezone : date_pattern -> string
[@@js.get "timezone"]
val date_pattern_utc_offset : date_pattern -> int
[@@js.get "utc_offset"]
val date_pattern_dst_offset : date_pattern -> int
[@@js.get "dst_offset"]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
type boolean = private Ojs.t

val boolean_dst : boolean -> bool
[@@js.get "dst"]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
type l_string = private Ojs.t
val string_value : l_string -> string
[@@js.get "value"]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
type number = private Ojs.t
val number_value : number -> float
[@@js.get "value"]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
type string_array = private Ojs.t
val string_array_value : string_array -> string array
[@@js.get "value"]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
type currency_pattern = private Ojs.t
val currency_pattern          : currency_pattern -> string
[@@js.get "pattern"]
val currency_pattern_code     : currency_pattern -> string
[@@js.get "code"]
val currency_pattern_fraction : currency_pattern -> int
[@@js.get "fraction"]
val currency_pattern_rounding : currency_pattern -> int
[@@js.get "rounding"]
val currency_pattern_decimal  : currency_pattern -> string
[@@js.get "decimal"]
val currency_pattern_grouping : currency_pattern -> string
[@@js.get "grouping"]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
type date = private Ojs.t

val date_year         : date -> int
[@@js.get "year"]
val date_month        : date -> int
[@@js.get "month"]
val date_day          : date -> int
[@@js.get "day"]
val date_hour         : date -> int
[@@js.get "hour"]
val date_minute       : date -> int
[@@js.get "minute"]
val date_second       : date -> int
[@@js.get "second"]
val date_millisecond  : date -> int
[@@js.get "millisecond"]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
val get_preferred_language :
  (l_string -> unit)                                            ->
  (unit -> unit)                                                ->
  unit
[@@js.global "navigator.globalization.getPreferredLanguage"]

val get_locale_name :
  (l_string -> unit)                                            ->
  (unit -> unit)                                                ->
  unit
[@@js.global "navigator.globalization.getLocaleName"]

val date_to_string :
  Js_date.t                                                     ->
  (l_string -> unit)                                            ->
  (unit -> unit)                                                ->
  ?options:(options_date [@js.default create_options_date ()])  ->
  unit                                                          ->
  unit
[@@js.global "navigator.globalization.dateToString"]

val get_currency_pattern :
  string                                                        ->
  (currency_pattern -> unit)                                    ->
  (unit -> unit)                                                ->
  unit
[@@js.global "navigator.globalization.getCurrencyPattern"]

val get_date_names :
  (string_array -> unit)                                        ->
  (unit -> unit)                                                ->
  options_date_names                                            ->
  unit
[@@js.global "navigator.globalization.getDateNames"]

val get_date_pattern :
  (date_pattern -> unit)                                                ->
  (unit -> unit)                                                ->
  ?options:(options_date [@js.default create_options_date ()])  ->
  unit                                                          ->
  unit
[@@js.global "navigator.globalization.getDatePattern"]

val get_first_day_of_week :
  (number -> unit)                                              ->
  (unit -> unit)                                                ->
  unit
[@@js.global "navigator.globalization.getFirstDayOfWeek"]

val get_number_pattern :
  (number -> unit)                                              ->
  (unit -> unit)                                                ->
  ?options:(options_number_pattern [@js.default
    create_options_number_pattern ()])                          ->
  unit                                                          ->
  unit
[@@js.global "navigator.globalization.getNumberPattern"]

val is_day_light_savings_time :
  Js_date.t                                                     ->
  (boolean -> unit)                                             ->
  (unit -> unit)                                                ->
  unit
[@@js.global "navigator.globalization.isDayLightSavingsTime"]

val number_to_string :
  int                                                           ->
  (l_string -> unit)                                            ->
  (unit -> unit)                                                ->
  number_type                                                   ->
  unit
[@@js.global "navigator.globalization.numberToString"]

val string_to_number :
  int                                                           ->
  (number -> unit)                                              ->
  (unit -> unit)                                                ->
  number_type                                                   ->
  unit
[@@js.global "navigator.globalization.stringToNumber"]

val string_to_date :
  string                                                        ->
  (date -> unit)                                                ->
  (unit -> unit)                                                ->
  options_date                                                  ->
  unit
[@@js.global "navigator.globalization.stringToDate"]
(* -------------------------------------------------------------------------- *)
