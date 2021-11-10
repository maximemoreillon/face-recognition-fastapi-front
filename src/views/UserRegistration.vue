<template>
  <v-card>
    <v-toolbar flat>
      <v-btn
        text
        exact
        :to="{name: 'users'}">
        <v-icon>mdi-arrow-left</v-icon>
      </v-btn>
      <v-toolbar-title>User registration</v-toolbar-title>
    </v-toolbar>
    <v-divider/>

    <v-card-text>
      <v-form @submit.prevent="create_user()">

        <v-row align="center">
          <v-col>
            <v-file-input
              label="image"
              v-model="image"/>
          </v-col>
          <v-col>
            <v-text-field
              label="User name"
              v-model="name"/>
          </v-col>
          <v-col cols="auto">
            <v-btn
              :loading="processing"
              type="submit">Create</v-btn>
          </v-col>
        </v-row>

      </v-form>
    </v-card-text>
  </v-card>
</template>

<script>

  export default {
    name: 'Home',
    components: {
    },
    data(){
      return {
        image: null,
        name: '',
        processing: false,
      }
    },
    methods: {
      create_user(){
        this.processing = true

        const formData = new FormData()
        formData.append('image', this.image)
        formData.append('name', this.name)

        const url = `${process.env.VUE_APP_API_URL}/users`
        this.axios.post(url, formData)
          .then( ({data}) => {
            this.$router.push({name: 'user', params: {user_id: data._id}})
          })
          .catch( (error) => {

            if(error.response) console.error(error.response.data)
            else console.error(error)

          })
          .finally( () => {
            this.processing = false
          })
      }
    }
  }
</script>
