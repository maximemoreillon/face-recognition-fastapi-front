<template>
  <v-card>
    <v-card-title>About</v-card-title>

    <v-card-text>
      <p>Author: Maxime MOREILLON</p>
      <v-data-table
        hide-default-footer
        :itemsPerPage="-1"
        :headers="headers"
        :items="services"/>
    </v-card-text>


  </v-card>
</template>

<script>
import pjson from '@/../package.json'
export default {
  name: 'About',
  data () {
    return {
      headers: [
        {text: 'Service', value: "name"},
        {text: 'Version', value: "version"},
        {text: 'URL', value: "url"},

      ],
      services: [
        {
          name: 'GUI',
          url: window.location.origin,
          version: pjson.version
        },
        {
          name: 'Back-end',
          url: process.env.VUE_APP_API_URL,
          version: null
        },
        {
          name: 'Authentication',
          url: process.env.VUE_APP_AUTHENTICATION_API_URL,
        },
      ],
    }
  },
  mounted () {
    this.get_services_version()
  },
  methods: {

    get_services_version () {
      this.services.forEach((service) => {
        if (service.version) return
        service.version = 'Connecting...'
        this.axios.get(service.url)
          .then(({ data }) => { service.version = data.version })
          .catch(() => { service.version = 'Unable to connect' })
      })
    }
  }

}
</script>

<style scoped>


</style>
