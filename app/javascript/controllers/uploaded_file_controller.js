import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="uploaded-file"
export default class extends Controller {
  static targets = ['form', 'open', 'close', 'delete' ]

  open(e) {
   e.preventDefault()
   this.openTarget.classList.add('hidden')
   this.closeTarget.classList.remove('hidden')
   this.formTarget.classList.remove('hidden')
  }

  close(e) {
    e.preventDefault()
    this.closeTarget.classList.add('hidden')
    this.openTarget.classList.remove('hidden')
    this.formTarget.classList.add('hidden')
  }

  delete(e) {
    e.preventDefault()
    this.element.remove()
  }
}
