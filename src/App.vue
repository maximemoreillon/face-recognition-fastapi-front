<template>
  <AppTemplate
    :options="options">

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
    options: {
      skip_greetings: process.env.NODE_ENV === 'development',
      title: 'Face manager',
      authenticate: true,
      login_url: process.env.VUE_APP_AUTHENTICATION_API_URL ? `${process.env.VUE_APP_AUTHENTICATION_API_URL}/login` : undefined,
      identification_url: process.env.VUE_APP_AUTHENTICATION_API_URL ? `${process.env.VUE_APP_AUTHENTICATION_API_URL}/v2/whoami` : undefined,
    },
    nav: [
      {title: 'Home', to: {name: 'Home'}, icon: 'mdi-home'},
      {title: 'About', to: {name: 'About'}, icon: 'mdi-information-outline'},
    ]
  }),

  methods: {

  }
};
</script>
