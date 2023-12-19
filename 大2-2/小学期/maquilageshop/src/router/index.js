import Vue from 'vue'
import Router from 'vue-router'
import index from '@/components/index'
import login from '@/components/login'
import user from '@/components/user'
import main from '@/components/sys/main'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'login',
      component: login
    },
    {
      path:'/main',
      name:"main",
      component: main,
      children:[
        {
          path:"index",
          name:'index',
          component: index
        },{
          path:"user",
          name:'user',
          component: user
        },
      ]
    }
  ]
})
