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

[@@@js.stop]
val short : format_length
val medium : format_length
val long : format_length
val full : format_length

val s_date : selector
val s_time : selector
val s_date_and_time : selector
[@@@js.start]

[@@@js.implem
let short = Short
let medium = Medium
let long = Long
let full = Full

let s_date = Date
let s_time = Time
let s_date_and_time = Date_and_time
]

class options_date : Ojs.t ->
  object
    inherit Ojs.obj

    method format_length  : format_length
    method selector       : selector
  end

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

[@@@js.stop]
val date_names_wide : date_names_type
val date_names_narrow : date_names_type

val date_names_months : date_names_item
val date_names_days : date_names_item
[@@@js.start]

[@@@js.implem
let date_names_wide = Wide
let date_names_narrow = Narrow

let date_names_months = Months
let date_names_days = Days
]

class options_date_names : Ojs.t ->
  object
    inherit Ojs.obj

    method type_ : date_names_type
    [@@js.get "type"]
    method item : date_names_item
  end

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

[@@@js.stop]
val number_pattern_decimal    : number_type
val number_pattern_percent    : number_type
val number_pattern_currency   : number_type
[@@@js.start]

[@@@js.implem
let number_pattern_decimal  = Decimal
let number_pattern_percent  = Percent
let number_pattern_currency = Currency
]

class options_number_pattern : Ojs.t ->
  object
    inherit Ojs.obj

    method type_ : number_type
    [@@js.get "type"]
  end

val create_options_number_pattern :
  ?type_:(number_type [@js.default Decimal]) ->
  unit                                                  ->
  options_number_pattern
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class parameter_number_pattern : Ojs.t ->
  object
    inherit Ojs.obj

    method pattern      : string
    method symbol       : string
    method fraction     : int
    method rounding     : int
    method positive     : string
    method negative     : string
    method decimal      : string
    method grouping     : string
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class parameter_date_pattern : Ojs.t ->
  object
    inherit Ojs.obj

    method pattern : string
    method timezone : string
    method utc_offset : int
    [@@js.get "utc_offset"]
    method dst_offset : int
    [@@js.get "dst_offset"]
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class parameter_boolean : Ojs.t ->
  object
    inherit Ojs.obj

    method dst : bool
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class parameter_string : Ojs.t ->
  object
    inherit Ojs.obj

    method value : string
  end

class parameter_number : Ojs.t ->
  object
    inherit Ojs.obj

    method value : float
  end

class parameter_string_array : Ojs.t ->
  object
    inherit Ojs.obj

    method value : string array
  end

class parameter_currency_pattern : Ojs.t ->
  object
    inherit Ojs.obj

    method pattern  : string
    method code     : string
    method fraction : int
    method rounding : int
    method decimal  : string
    method grouping : string
  end

class parameter_date : Ojs.t ->
  object
    inherit Ojs.obj

    method year         : int
    method month        : int
    method day          : int
    method hour         : int
    method minute       : int
    method second       : int
    method millisecond  : int
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class globalization : Ojs.t ->
  object
    inherit Ojs.obj

    method get_preferred_language   :
      (parameter_string -> unit)  ->
      (unit -> unit)              ->
      unit
   [@@js.call "getPreferredLanguage"]

    method get_locale_name :
      (parameter_string -> unit)  ->
      (unit -> unit)              ->
      unit
   [@@js.call "getLocaleName"]

    method date_to_string           :
      Js_date.date                                                  ->
      (parameter_string -> unit)                                    ->
      (unit -> unit)                                                ->
      ?options:(options_date [@js.default create_options_date ()])  ->
      unit                                                          ->
      unit

    method get_currency_pattern :
      string                                ->
      (parameter_currency_pattern -> unit)  ->
      (unit -> unit)                        ->
      unit
    [@@js.call "getCurrencyPattern"]

    method get_date_names           :
      (parameter_string_array -> unit)  ->
      (unit -> unit)                    ->
      options_date_names                ->
      unit
    [@@js.call "getDateNames"]

    method get_date_pattern :
      (parameter_date_pattern -> unit)                              ->
      (unit -> unit)                                                ->
      ?options:(options_date [@js.default create_options_date ()])  ->
      unit                                                          ->
      unit
    [@@js.call "getDatePattern"]

    method get_first_day_of_week    :
      (parameter_number -> unit) ->
      (unit -> unit)          ->
      unit
    [@@js.call "getFirstDayOfWeek"]

    method get_number_pattern       :
      (parameter_number_pattern -> unit)              ->
      (unit -> unit)                                  ->
      ?options:(options_number_pattern [@js.default
        create_options_number_pattern ()])            ->
      unit                                            ->
      unit

    method is_day_light_savings_time :
      Js_date.date                                    ->
      (parameter_boolean -> unit)                     ->
      (unit -> unit)                                  ->
      unit

    method number_to_string :
      int                                             ->
      (parameter_string -> unit)                      ->
      (unit -> unit)                                  ->
      number_type                                     ->
      unit

    method string_to_number :
      int                                             ->
      (parameter_number -> unit)                      ->
      (unit -> unit)                                  ->
      number_type                                     ->
      unit

    method string_to_date :
      string                                          ->
      (parameter_date -> unit)                        ->
      (unit -> unit)                                  ->
      options_date                                    ->
      unit
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
val t : unit -> globalization
[@@js.get "navigator.globalization"]
(* -------------------------------------------------------------------------- *)
