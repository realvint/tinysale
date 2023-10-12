import { Controller } from '@hotwired/stimulus'
import axios from 'axios'

let files = []

// Connects to data-controller="file-picker"
export default class extends Controller {
  HEADERS = {
    'ACCEPT': 'text/vnd.turbo-stream.html',
    // 'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
  }

  attachFile(content) {
    const contentId = content.element.dataset.contentId
    const fileIndex = files.findIndex(file => file.contentId == contentId)
    content.attachFile(files[fileIndex])
    files = files.splice(fileIndex, fileIndex)
    content.uploadFile()
  }

  uploadFiles(e) {
    Array.from(e.target.files).forEach((file) => {
      axios.post('/api/contents', {
        name: file.name,
        file_type: file.type,
        file_size: file.size
      }, { headers: this.HEADERS })
        .then((response) => {
          const contentId = response.data.match(/data-content-id=("\d+")/)[1].replace(/"|'/g, '')
          file['contentId'] = parseInt(contentId)
          files.push(file)
          Turbo.renderStreamMessage(response.data)
        })
    })
  }
}
