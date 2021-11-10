<template>
  <v-card>
    <v-toolbar flat>

      <v-toolbar-title>Users</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn
        text
        :to="{name: 'recognize'}">
        <v-icon>mdi-face-recognition</v-icon>
        <span class="ml-2">Recognize</span>

      </v-btn>
      <v-btn
        text
        :to="{name: 'user_registration'}">
        <v-icon>mdi-plus</v-icon>
        <span class="ml-2">Register</span>

      </v-btn>
    </v-toolbar>
    <v-divider/>
    
    <v-card-text>
      <v-data-table
        :loading="loading"
        :headers="headers"
        :items="users"
        @click:row="row_clicked($event)">

        <template v-slot:item.image="{ item }">
        <v-img
          width="6em"
          height="6em"
          contain
          :src="image_src(item)" />
      </template>


      </v-data-table>

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
        loading: false,
        users: [],
        headers: [
          {text:'Image', value: 'image'},
          {text:'Name', value: 'name'}
        ]
      }
    },
    mounted(){
      this.get_users()
    },
    methods:{
      get_users(){
        this.loading = true
        this.users = []


        const url = `${process.env.VUE_APP_API_URL}/users`
        this.axios.get(url)
          .then( ({data}) => {
            this.users = data
          })
          .catch( (error) => {

            if(error.response) console.error(error.response.data)
            else console.error(error)

          })
          .finally( () => {
            this.loading = false
          })
      },
      row_clicked(user){
        this.$router.push({name: 'user', params: {user_id: user._id.$oid}})
      },
      image_src(user){
        return `${process.env.VUE_APP_API_URL}/users/${user._id.$oid}/image`
      }
    }
  }
</script>
