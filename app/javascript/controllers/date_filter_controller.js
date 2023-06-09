import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import rangePlugin from "flatpickrRangePlugin";


// Connects to data-controller="date-filter"
export default class extends Controller {
  static targets = ['startDateInput','endDateInput']
  connect() {
    flatpickr(this.startDateInputTarget, {
      mode: 'range',
      "plugins": [new rangePlugin({ input: this.endDateInputTarget})],
    })
  }
}
