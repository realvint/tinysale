import { Controller } from "@hotwired/stimulus"

const imageTypes = ['image/gif', 'image/jpeg', 'image/jpg', 'image/png']

// Connects to data-controller="product-form"
export default class extends Controller {
  static targets = ['thumbnail', 'thumbnailInput']

  attachThumbnail(e) {
    e.preventDefault()

    const file = e.target.files[0]

    if (!imageTypes.includes(file.type)) {
      alert('Attached file must be an image!')
    }

    this.thumbnailInputTarget.files = e.target.files
    this.thumbnailTarget.src = URL.createObjectURL(file)
  }
}
