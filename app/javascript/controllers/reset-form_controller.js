import { Controller } from "stimulus"

export default class extends Controller {
  reset() {
    this.element.reset()
    const stars = document.getElementsByClassName("rating-stars")
    Array.from(stars).forEach( star => {
      star.classList.remove('fas')
      star.classList.add('far')
    })
  }
}