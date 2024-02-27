import jquery from "jquery";
import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

import "../utilities/sorting";
import "../utilities/password_confirmation";
import "../utilities/form_inline";

window.$ = jquery;

Rails.start();
Turbolinks.start();
ActiveStorage.start();
