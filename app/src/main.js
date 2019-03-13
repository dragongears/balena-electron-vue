import Vue from 'vue'
import App from './App.vue'

Vue.config.productionTip = false

let env = {}

// In production mode get VUE_APP_* environment variables from the background process
if (process.env.NODE_ENV === 'production') {
  const { ipcRenderer } = require('electron')

  env = ipcRenderer.sendSync('synchronous-message', 'synchronous-message from renderer process')

}

// Make environment variables available as $env in Vue components
Vue.prototype.$env = Object.assign({}, process.env, env)

new Vue({
  render: h => h(App),
}).$mount('#app')
