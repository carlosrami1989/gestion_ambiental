<template>

    <div>

    
      
   
      <home-app-bar :user="this.$props.user" />

        <!-- <home-view /> -->

      
    
    </div>  
</template>

<script>
export default {
   props: {
    user: {
      type: Object,
    },
  },
    name: "HomeLayout",
data() {
      return {
         drawer: true,
          group: null,
      }
    },
    mounted() {
   this.$store.state.usuario = this.$props.user;
        // console.log(this.$props);

        // console.log('este');
        // console.log(this.$store.state.usuario);
        
    },
    watch: {
      group () {
        this.drawer = false
      },
    },
    components: {
      //HomeAppBar: () => import("./components/home/components/AppBar.vue"),

        // HomeView: () => import("./components/View"),

        // HomeFooter: () => import("./components/Footer"),

        /* ,
        HomeSettings: () => import("@/layouts/home/Settings"),
         */
    }
};
</script>
