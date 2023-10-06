import { Controller } from '@hotwired/stimulus'
import { enter, leave } from 'el-transition'

// Connects to data-controller="sidenav"
export default class extends Controller {
  static targets = ['sidebar', 'backdrop', 'canvas']

  openSidenav() {
    enter(this.sidebarTarget)
    enter(this.backdropTarget)
    enter(this.canvasTarget)

  }

  closeSidenav() {
    leave(this.backdropTarget)
    leave(this.canvasTarget)

    setTimeout(() => {
      leave(this.sidebarTarget)
    }, 300)
  }
}
