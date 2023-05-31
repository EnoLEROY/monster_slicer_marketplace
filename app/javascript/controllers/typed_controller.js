
import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"; // You need to import this to use new Typed()

export default class extends Controller {
  static values = {
  }

  connect() {
    new Typed(this.element, {

      strings: ['Welcome travelers ^1000 to the </br> Monster Slicer™ marketplace'],
      typeSpeed: 40,
      showCursor:false,
      smartBackspace: true
    });
  }
}
