let t = Cordova_globalization.t () in
t#is_day_light_savings_time
  (Js_date.now ())
  (fun e -> ())
  (fun () -> ())
