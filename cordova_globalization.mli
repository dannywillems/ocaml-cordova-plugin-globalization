(* -------------------------------------------------------------------------- *)
type format_length =
  | Short  [@js "short"]
  | Medium [@js "medium"]
  | Long   [@js "long"]
  | Full   [@js "full"]
  [@@js.enum]

type selector =
  | Date          [@js "date"]
  | Time          [@js "time"]
  | Date_and_time [@js "date_and_time"]
  [@@js.enum]

module OptionsDate: sig
  type t
  val create:
    ?format_length:(format_length [@js.default Short])  ->
    ?selector:(selector [@js.default Date_and_time])    ->
    unit                                                ->
    t
  [@@js.builder]
end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
type date_names_type =
  | Wide   [@js "wide"]
  | Narrow [@js "narrow"]
  [@@js.enum]

type date_names_item =
  | Months [@js "months"]
  | Days   [@js "days"]
  [@@js.enum]

module OptionsDateNames: sig
  type t
  val create:
    ?type_:(date_names_type [@js.default Wide])    ->
    ?item: (date_names_item [@js.default Months])  ->
    unit                                           ->
    t
  [@@js.builder]
end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
type number_type =
  | Decimal  [@js "decimal"]
  | Percent  [@js "percent"]
  | Currency [@js "currency"]
  [@@js.enum]


module OptionsNumberPattern: sig
  type t
  val create:
    ?type_:(number_type [@js.default Decimal]) ->
    unit                                       ->
    t
  [@@js.builder]
end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module NumberPattern: sig
  type t
  val pattern  : t -> string [@@js.get]
  val symbol   : t -> string [@@js.get]
  val fraction : t -> int [@@js.get]
  val rounding : t -> int [@@js.get]
  val positive : t -> string [@@js.get]
  val negative : t -> string [@@js.get]
  val decimal  : t -> string [@@js.get]
  val grouping : t -> string [@@js.get]
end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module DatePattern: sig
  type t
  val pattern:    t -> string [@@js.get]
  val timezone:   t -> string [@@js.get]
  val utc_offset: t -> int [@@js.get]
  val dts_offset: t -> int [@@js.get]
end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module Boolean: sig
  type t
  val dst: t -> bool
end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module LString: sig
  type t
  val value: t -> string [@@js.get]
end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module Number: sig
  type t
  val value: t -> float [@@js.get]
end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module StringArray: sig
  type t
  val value : t -> string array [@@js.get]
end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module CurrencyPattern: sig
  type t
  val pattern : t -> string [@@js.get]
  val code    : t -> string [@@js.get]
  val fraction: t -> int [@@js.get]
  val rounding: t -> int [@@js.get]
  val decimal : t -> string [@@js.get]
  val grouping: t -> string [@@js.get]
end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
module Date: sig
  type t
  val year         : t -> int [@@js.get]
  val month        : t -> int [@@js.get]
  val day          : t -> int [@@js.get]
  val hour         : t -> int [@@js.get]
  val minute       : t -> int [@@js.get]
  val second       : t -> int [@@js.get]
  val millisecond  : t -> int [@@js.get]
end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
val get_preferred_language :
  (LString.t -> unit) ->
  (unit -> unit)      ->
  unit
[@@js.global "navigator.globalization.getPreferredLanguage"]

val get_locale_name :
  (LString.t -> unit) ->
  (unit -> unit)      ->
  unit
[@@js.global "navigator.globalization.getLocaleName"]

val date_to_string :
  Js_date.t                                                     ->
  (LString.t -> unit)                                           ->
  (unit -> unit)                                                ->
  ?options:(OptionsDate.t [@js.default OptionsDate.create ()]) ->
  unit                                                          ->
  unit
[@@js.global "navigator.globalization.dateToString"]

val get_currency_pattern :
  string                                                        ->
  (CurrencyPattern.t -> unit)                                   ->
  (unit -> unit)                                                ->
  unit
[@@js.global "navigator.globalization.getCurrencyPattern"]

val get_date_names :
  (StringArray.t -> unit) ->
  (unit -> unit)          ->
  OptionsDateNames.t      ->
  unit
[@@js.global "navigator.globalization.getDateNames"]

val get_date_pattern :
  (DatePattern.t -> unit)                                       ->
  (unit -> unit)                                                ->
  ?options:(OptionsDate.t [@js.default OptionsDate.create ()])  ->
  unit                                                          ->
  unit
[@@js.global "navigator.globalization.getDatePattern"]

val get_first_day_of_week :
  (Number.t -> unit)                                            ->
  (unit -> unit)                                                ->
  unit
[@@js.global "navigator.globalization.getFirstDayOfWeek"]

val get_number_pattern :
  (Number.t -> unit)                                            ->
  (unit -> unit)                                                ->
  ?options:(OptionsNumberPattern.t [@js.default
    OptionsNumberPattern.create ()])                            ->
  unit                                                          ->
  unit
[@@js.global "navigator.globalization.getNumberPattern"]

val is_day_light_savings_time :
  Js_date.t                                                     ->
  (Boolean.t -> unit)                                           ->
  (unit -> unit)                                                ->
  unit
[@@js.global "navigator.globalization.isDayLightSavingsTime"]

val number_to_string :
  int                                                           ->
  (LString.t -> unit)                                           ->
  (unit -> unit)                                                ->
  number_type                                                   ->
  unit
[@@js.global "navigator.globalization.numberToString"]

val string_to_number :
  int                                                           ->
  (Number.t -> unit)                                            ->
  (unit -> unit)                                                ->
  number_type                                                   ->
  unit
[@@js.global "navigator.globalization.stringToNumber"]

val string_to_date :
  string                                                        ->
  (Date.t -> unit)                                              ->
  (unit -> unit)                                                ->
  OptionsDate.t                                                 ->
  unit
[@@js.global "navigator.globalization.stringToDate"]
(* -------------------------------------------------------------------------- *)
