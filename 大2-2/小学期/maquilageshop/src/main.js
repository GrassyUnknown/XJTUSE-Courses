// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css';
import axios from 'axios'
import footer from './components/sys/footer'
import header from './components/sys/header'


Vue.component("my-header",header)
Vue.component("my-footer",footer)
Vue.config.productionTip = false

//设置全局使用axios
Vue.prototype.$axios=axios
axios.defaults.baseURL="http://localhost:8888"
axios.defaults.withCredentials=true
Vue.use(ElementUI);



/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
