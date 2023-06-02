import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calculate-amount"
export default class extends Controller {
  static targets = ["input", "endDate", "startDate"]
  static values = {
    price: Number
  }

  calculateTotal() {
    // et la faut que je calcule le prix à partir des 2 inputs de date et de produit
    if(this.endDateTarget.value != "" && this.startDateTarget.value != "") {
      this.inputTarget.value = this.priceValue * ((Date.parse(this.endDateTarget.value) - Date.parse(this.startDateTarget.value)) / (1000*60*60*24) + 1)
    }
  }
}
