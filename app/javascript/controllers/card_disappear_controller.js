import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="card-disappear"
export default class extends Controller {
  static targets = ["card"]
  static values = {
    url: String
  }

  disappear () {
    this.cardTarget.classList.add("card-disappear")

    fetch(this.urlValue, {
      method: "PATCH",
      headers: { "Accept": "application/json" }
    })
  }
}
