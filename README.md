# ocaml-cordova-plugin-globalization

Binding to
[cordova-plugin-globalization](https://github.com/apache/cordova-plugin-globalization)

[Example
application](https://github.com/dannywillems/ocaml-cordova-plugin-globalization-example).
**Not developed**

## What does cordova-plugin-globalization do ?

```
This plugin obtains information and performs operations specific to the user's
locale, language, and timezone. Note the difference between locale and language:
locale controls how numbers, dates, and times are displayed for a region, while
language determines what language text appears as, independently of locale
settings. Often developers use locale to set both settings, but there is no
reason a user couldn't set her language to "English" but locale to "French", so
that text is displayed in English but dates, times, etc., are displayed as they
are in France. Unfortunately, most mobile platforms currently do not make a
distinction between these settings.
```

Source: [cordova-plugin-globalization](https://github.com/apache/cordova-plugin-globalization)

## Repository branches and tags

Only gen_js_api version is provided.

The binding has not been tested but it compiles.

## How to use ?

* You need to have the date binding. See [this binding](https://github.com/dannywillems/ocaml-js-stdlib) to the ocaml standard javascript library.

* Each method needs an error callback. In the cordova plugin, this callback takes a GlobalizationError object but it doesn't in the binding because this object contains only one error code which is specific to the method.