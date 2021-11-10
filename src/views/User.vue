<template>
  <v-card>
    <v-toolbar flat>
      <v-btn
        text
        exact
        :to="{name: 'users'}">
        <v-icon>mdi-arrow-left</v-icon>
      </v-btn>
      <v-toolbar-title>User {{user_id}}</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn
        text
        color="#c00000"
        @click="delete_user()">
        <v-icon>mdi-delete</v-icon>
        <span class="ml-2">Delete</span>
      </v-btn>
    </v-toolbar>
    <v-divider />

    <template v-if="user">
      <v-card-text>
        <v-row>
          <v-col>
            Name: {{user.name}}
          </v-col>
        </v-row>
        <v-row>
          <v-col>
            Encoding: {{!!user.face_encoding}}
          </v-col>
        </v-row>
      </v-card-text>
    </template>

    <v-card-text
      class="text-align"
      v-if="loading">
      <v-progress-circular indeterminate/>
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
        user: null,
        loading: false,
      }
    },
    mounted(){
      this.get_user()
    },
    methods:{
      get_user(){
        this.loading = true
        this.user = null


        const url = `${process.env.VUE_APP_API_URL}/users/${this.user_id}`
        this.axios.get(url)
          .then( ({data}) => {
            this.user = data
          })
          .catch( (error) => {

            if(error.response) console.error(error.response.data)
            else console.error(error)

            alert(error)

          })
          .finally( () => {
            this.loading = false
          })
      },
      delete_user(){
        if(!confirm(`Delete user ${this.user.name} ?`)) return
        this.loading = true

        const url = `${process.env.VUE_APP_API_URL}/users/${this.user_id}`
        this.axios.delete(url)
          .then( () => {
            this.$router.push({name:'users'})
          })
          .catch( (error) => {

            if(error.response) console.error(error.response.data)
            else console.error(error)

            alert(error)

          })
          .finally( () => {
            this.loading = false
          })
      }
    },
    computed: {
      user_id(){
        return this.$route.params.user_id
      }
    }
  }
</script>
