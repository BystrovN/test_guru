import jquery from "jquery";
import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

import "../utilities/sorting";
import "../utilities/password_confirmation";
import "../utilities/form_inline";
import "../utilities/test_passage_progress";
import "../utilities/timer";

window.$ = jquery;

Rails.start();
Turbolinks.start();
ActiveStorage.start();
