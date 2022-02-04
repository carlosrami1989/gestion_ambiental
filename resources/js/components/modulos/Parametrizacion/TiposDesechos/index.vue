<template>
<div>
  
<v-card
 elevation="5"
 class="mx-auto"
    
    
    >
<v-card-text>
  <v-card-title primary-title>
      TIPOS DE DESECHOS
  </v-card-title>

  <v-form
    ref="form"
    v-model="valid"
    lazy-validation
 
     
  >
    <v-text-field
      v-model="form.name"
      :counter="10"
      :rules="nameRules"
      label="Descripción"
      required
    ></v-text-field>

    

     
    
  
    <v-tooltip bottom>
      <template v-slot:activator="{ on, attrs }">
      <v-btn
      :disabled="!valid"
      color="success"
      class="mr-4"
        v-bind="attrs"
          v-on="on"
      @click="createPaciente()"
      >
        <v-icon>{{ form.icono }}</v-icon>
      </v-btn>
      
      </template>
      <span>Generar/Modificar Registro</span>
    </v-tooltip>

    <v-tooltip bottom>
      <template v-slot:activator="{ on, attrs }">
      <v-btn
      color="error"
      class="mr-4"
      @click="limpiar()"
       v-bind="attrs"
          v-on="on"
    >
     <v-icon>mdi-file-star</v-icon>
    </v-btn>
 
      
      </template>
      <span>Limpiar Registro</span>
    </v-tooltip>

    

    
    </v-form>
     <v-card-title>
      Detalles
      <v-spacer></v-spacer>
      <v-text-field
        v-model="search"
        append-icon="mdi-magnify"
        label="Search"
        single-line
        hide-details
      ></v-text-field>
    </v-card-title>
     <v-data-table
      
      :headers="headers"
      :items="desserts"
      :search="search"
    >
    <template v-slot:item.created_at="{ item }">
        <v-tooltip bottom>
      <template v-slot:activator="{ on, attrs }">
     	<v-icon
						large
						color="purple"
					 @click="agregar(item)"
            v-bind="attrs"
            v-on="on"
						>
						mdi-refresh-circle
						</v-icon>
 
      
      </template>
      <span>Modificar Registro</span>
    </v-tooltip>

				
						 
					 
					</template>
      </v-data-table>
  </v-card-text> 
  </v-card>

   <v-snackbar
      v-model="snackbar"
      :timeout="timeout"
      absolute
      top
       
      top
      :color="color"
    >
    <v-icon>{{ icono }}</v-icon>
    {{ text }}
      <!-- <template v-slot:action="{ attrs }">
        <v-btn
          color="blue" 
          text
          v-bind="attrs"
          @click="snackbar = false"
        >
          Close
        </v-btn>
      </template> -->
    </v-snackbar>
</div>
</template>
<script>
  export default {
    data: () => ({
      valid: true,
      form:{
          icono:"mdi-file-star",
          id:0,
          name:"",
      },
      icono:"mdi-checkbox-marked",
       snackbar: false,
      text: '',
      timeout: 4000,
      color:'purple darken-4',
      name: '',
       search: '',
      nameRules: [
        v => !!v || 'Name is required',
        v => (v && v.length <= 10) || 'Name must be less than 10 characters',
      ],
      email: '',
      emailRules: [
        v => !!v || 'E-mail is required',
        v => /.+@.+\..+/.test(v) || 'E-mail must be valid',
      ],
      select: null,
      items: [
        'Item 1',
        'Item 2',
        'Item 3',
        'Item 4',
      ],
      checkbox: false,
       headers: [
          {
            text: 'codigo',
            align: 'start',
            sortable: false,
            value: 'id',
          },
          { text: 'Descripcion', value: 'descripcion' },
           { text: 'acciones', value: 'created_at' },
          
        ],
        desserts: [
          
        ],
    }),
    mounted() {
      this.consultasPaciente() ;
       this.limpiar();
    },
    methods: {
      limpiar(){
        
           
            this.form.id = 0;
            this.form.name = "";
            this.form.icono = "mdi-content-save-all";
             this.$refs.form.reset();



      },
      agregar(value){

        this.form.id = value.id;
        this.form.name = value.descripcion
        this.form.icono = "mdi-update";

        console.log();
        

      },
      mensajeAler(value,value2){
      if (value2) {
         if (value) {
            this.icono = "mdi-checkbox-marked"
            this.color = "green",
             this.snackbar = true;
            this.text = "Transacción realizada de manera exitosa";
          } else {
             this.icono = "mdi-close-box"
             this.color = "light-blue darken-4",
             this.snackbar = true;
             this.text = "Transacción actualizada de manera exitosa";
           
          }

         
            
          } else {
             this.icono = "mdi-close-box"
             this.color = "red darken-4",
             this.snackbar = true;
             this.text = "Error en el sistema " + value;
            
          }
      },
      createPaciente() {
   this.$refs.form.validate()
        let that = this;
        let url =
          this.$store.getters.getRuta +
          "/modulos/admision/paciente/crearTipoDesechos";
        
        axios
          .post(url,that.form)
          .then(function (response) {
            that.mensajeAler(response.data.data,true);
              that.limpiar();
           

           // loader.hide();
          })
          .catch((error) => {
            let objeto = [];
              objeto = Object.values(error.response.data.errors);
            //   console.log(objeto);
            //   console.log(objeto.length);
              
              for (let index = 0; index < objeto.length; index++) {
                 // const element = array[index];
                   // console.log(objeto.[index][0]);
                  that.mensajeAler(objeto[index][0],false);
                  
              }
         //that.mensajeAler(response.data.data,false);
            //Errores de validación
            //loader.hide();
           
          });
           this.consultasPaciente() ;
      
    },
       consultasPaciente() {
 
        let that = this;
        let url =
          this.$store.getters.getRuta +
          "/modulos/admision/paciente/cargarTipoDesechos";
        
        axios
          .get(url)
          .then(function (response) {
            that.desserts = response.data.data;

          
          })
          .catch((error) => {
            //Errores de validación
            loader.hide();
           
          });
      
    },
      validate () {
      
      },
      reset () {
        this.$refs.form.reset()
      },
      resetValidation () {
        this.$refs.form.resetValidation()
      },
    },
  }
</script>