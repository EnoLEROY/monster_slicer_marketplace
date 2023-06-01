import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="card-disappear"
export default class extends Controller {
  static values = {
    accept: String,
    deny: String
  }

  #disappear () {
    this.element.classList.add("card-disappear")
  }

  accept () {
    this.#disappear()

    fetch(this.acceptValue, {
      method: "GET",
      headers: { "Accept": "application/json" }
    })
  }

  deny () {
    this.#disappear()

    fetch(this.denyValue, {
      method: "GET",
      headers: { "Accept": "application/json" }
    })
  }
}
