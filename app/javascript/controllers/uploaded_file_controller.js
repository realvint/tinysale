import { Controller } from '@hotwired/stimulus'

let file = null

// Connects to data-controller="uploaded-file"
export default class extends Controller {
  static targets = ['form', 'open', 'close', 'delete']
  static outlets = ['file-picker']

  connect() {
    this.filePickerOutlets[0].attachFile(this)
  }

  attachFile(attachedFile) {
    file = attachedFile
    console.log(file)
  }

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
