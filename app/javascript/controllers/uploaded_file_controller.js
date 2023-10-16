import { Controller } from '@hotwired/stimulus'
import axios from 'axios'
import prettyBytes from 'pretty-bytes'

let file = null

// Connects to data-controller="uploaded-file"
export default class extends Controller {
  static targets = ['form', 'open', 'close', 'delete', 'metadata', 'uploadProgress', 'spinner']
  static outlets = ['file-picker']

  HEADERS = {
    'ACCEPT': 'application/json',
    'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
  }

  connect() {
    if(this.element.dataset.uploadCompleted !== 'true') {
      this.filePickerOutlet.attachFile(this)
    }
  }

  attachFile(attachedFile) {
    file = attachedFile
  }

  uploadProgressText(percentCompleted, uploadRate) {
    const totalFileSize = this.uploadProgressTarget.dataset.fileSize
    const fileType = this.uploadProgressTarget.dataset.fileType

    if(uploadRate) {
      return `${fileType} · ${percentCompleted}% of ${totalFileSize} (${prettyBytes(uploadRate).toUpperCase()}/second)` }
  }

  uploadFile() {
    const config = {
      onUploadProgress: (progressEvent) => {
        const percentCompleted = Math.round((progressEvent.loaded * 100) / progressEvent.total)
        this.uploadProgressTarget.classList.remove('hidden')
        this.metadataTarget.classList.add('hidden')
        this.uploadProgressTarget.textContent = this.uploadProgressText(percentCompleted, progressEvent.rate)
      },
     headers: this.HEADERS
    }
    const data = new FormData()
    data.append('content[file]', file)

    axios.put(`/api/contents/${this.element.dataset.contentId}`, data, config)
      .then((response) => {
        this.uploadProgressTarget.classList.add('hidden')
        this.spinnerTarget.classList.add('hidden')
        this.metadataTarget.classList.remove('hidden')
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

    axios.delete(`/api/contents/${this.element.dataset.contentId}`, { headers: this.HEADERS })
      .then(() => {
        this.element.remove()
      })
  }
}
