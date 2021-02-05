import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "billing_same_as_shipping" ]
  toggle(event) {

    // If checked, hide billing address form
    var billing = document.getElementsByClassName("billing-address")
    if(event.target.checked) {
      billing[0].classList.add('hide')
    } else {
      billing[0].classList.remove('hide')
    }
  }
}