import { Controller } from "@hotwired/stimulus"

const imageTypes = ['image/gif', 'image/jpeg', 'image/jpg', 'image/png']

// Connects to data-controller="product-form"
export default class extends Controller {
  static targets = ['thumbnail', 'thumbnailInput', 'coverInput', 'cover', 'coverUploadSection', 'coverSection']

  attachThumbnail(e) {
    e.preventDefault()

    const file = e.target.files[0]

    if (!imageTypes.includes(file.type)) {
      alert('Attached file must be an image!')
    } else {
      this.thumbnailInputTarget.files = e.target.files
      this.thumbnailTarget.src = URL.createObjectURL(file)
    }
  }

  changeCover(e) {
    e.preventDefault()

    this.coverInputTarget.click()
  }

  attachCover(e) {
    e.preventDefault()

    const file = e.target.files[0]

    if (!imageTypes.includes(file.type)) {
      alert('Attached file must be an image!')
    } else {
      this.coverInputTarget.files = e.target.files
      this.coverTarget.src = URL.createObjectURL(file)
      this.coverUploadSectionTarget.classList.add('hidden')
      this.coverSectionTarget.classList.remove('hidden')
    }
  }
}
