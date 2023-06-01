import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import rangePlugin from "flatpickrRangePlugin";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = [ 'startDateInput', 'endDateInput' ]
  connect() {
    const unavailableDates = JSON.parse(document.querySelector('.getUnavailable').dataset.unavailable)
    console.log(unavailableDates)
    flatpickr(this.startDateInputTarget, {
      mode: 'range',
      "plugins": [new rangePlugin({ input: this.endDateInputTarget})],
      disable: unavailableDates
    })
  }
}
