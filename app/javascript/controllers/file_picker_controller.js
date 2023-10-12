import { Controller } from '@hotwired/stimulus'
import axios from 'axios'

const files = []

// Connects to data-controller="file-picker"
export default class extends Controller {
  HEADERS = {
    'ACCEPT': 'text/vnd.turbo-stream.html',
    'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
  }

  attachFile(content) {
   content.attachFile(files[0])
   content.uploadFile()
  }

  uploadFiles(e) {
    files.push(e.target.files[0])

    axios.post('/api/contents', {
      name: e.target.files[0].name,
      file_type: e.target.files[0].type,
      file_size: e.target.files[0].size
    }, { headers: this.HEADERS })
      .then((response) => {
        const contentId = response.data.match(/data-content-id=("\d+")/)[1].replace(/"|'/g, '')

        Turbo.renderStreamMessage(response.data)
      })
  }
}
