<template>
  <AppTemplate
    :options="template_options">

    <template v-slot:nav>
      <v-list
        dense
        nav >
        <v-list-item
          v-for="(item, index) in nav"
          :key="`nav_item_${index}`"
          :to="item.to"
          exact>
          <v-list-item-icon>
            <v-icon>{{item.icon}}</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>{{item.title}}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </template>

  </AppTemplate>
</template>

<script>
import AppTemplate from '@moreillon/vue_application_template_vuetify'
export default {
  name: 'App',

  components: {
    AppTemplate
  },

  data: () => ({

    nav: [
      {title: 'Home', to: {name: 'Home'}, icon: 'mdi-home'},
      {title: 'About', to: {name: 'About'}, icon: 'mdi-information-outline'},
    ]
  }),

  computed:{
    login_url(){
      if(!process.env.VUE_APP_AUTHENTICATION_API_URL) return null
      if(!process.env.VUE_APP_AUTHENTICATION_API_URL.length) return null
      return `${process.env.VUE_APP_AUTHENTICATION_API_URL}/login`
    },
    identification_url(){
      if(!process.env.VUE_APP_AUTHENTICATION_API_URL) return null
      if(!process.env.VUE_APP_AUTHENTICATION_API_URL.length) return null
      return `${process.env.VUE_APP_AUTHENTICATION_API_URL}/v2/whoami`
    },
    template_options(){
      return {
        skip_greetings: process.env.NODE_ENV === 'development',
        title: 'Face recognition',
        login_url: this.login_url,
        identification_url: this.identification_url,
      }

    }
  }


};
</script>
