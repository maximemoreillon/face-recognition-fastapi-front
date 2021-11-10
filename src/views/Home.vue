<template>
  <v-card>
    <v-card-title>Home</v-card-title>
    <v-card-text>
      <v-btn
        :to="{name: 'user_registration'}">Create</v-btn>
    </v-card-text>
  </v-card>
</template>

<script>

  export default {
    name: 'Home',
    components: {
    },
  }
</script>
