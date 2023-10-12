import { Controller } from '@hotwired/stimulus'
import axios from 'axios'

let file = null

// Connects to data-controller="uploaded-file"
export default class extends Controller {
  static targets = ['form', 'open', 'close', 'delete']
  static outlets = ['file-picker']

  HEADERS = {
    'ACCEPT': 'application/json',
    'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
  }

  connect() {
    this.filePickerOutlets[0].attachFile(this)
  }

  attachFile(attachedFile) {
    file = attachedFile
  }

  uploadFile() {
    const config = {
      onUploadProgress: (progressEvent) => {
        const percentCompleted = Math.round((progressEvent.loaded * 100) / progressEvent.total)
        console.log('progressEvent: ', progressEvent)
        console.log('percentCompleted: ', percentCompleted)
      },
      headers: this.HEADERS
    }
    const data = new FormData()
    data.append('content[file]', file)

    axios.put(`/api/contents/${this.element.dataset.contentId}`, data, config)
      .then((response) => {
        console.log('uploadFile response: ', response)
      })
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
