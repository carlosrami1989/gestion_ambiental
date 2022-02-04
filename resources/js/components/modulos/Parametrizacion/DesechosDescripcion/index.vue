<template>
<div>
  
<v-card
 elevation="5"
 class="mx-auto"
    
    
    >
<v-card-text>
  <v-card-title primary-title>
      Clasificación de Desechos por Descripción
  </v-card-title>

  <v-form
    ref="form"
    v-model="valid"
    lazy-validation
 
     
  >
    <v-select
    v-model="form.tipo_desechos"
          :items="tipos_desechos_"
          label="Seleccionar Tipos de Desechos"
           item-text="descripcion"
          item-value="id"
          @change="consultasTipoDesechosClasificacion(form.tipo_desechos)"
          dense
          outlined
        ></v-select>


          <v-select
    v-model="form.clasificacion_desechos"
          :items="clasificacion_desechos_"
          label="Seleccionar Clasificación de Desechos"
           item-text="descripcion"
          item-value="id"
          dense
          outlined
        ></v-select>


    <v-text-field
      v-model="form.name"
      :counter="1000"
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
      @click="createClasificacion()"
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
      :items="clasificacion_desechos_descripcion_"
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
          tipo_desechos:0,
          clasificacion_desechos:0,
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
        v => (v && v.length <= 1000) || 'Name must be less than 10 characters',
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
          { text: 'Tipo desechos', value: 'des_tipo_desechos' },
          { text: 'Tipo Clasificación', value: 'des_clasificacion_desechos' },
          { text: 'Descripcion', value: 'descripcion' },
           { text: 'acciones', value: 'created_at' },
          
        ],
        tipos_desechos_: [
          
        ],
         clasificacion_desechos_:[],
        clasificacion_desechos_descripcion_:[],

    }),
    mounted() {
      this.consultasTipoDesechos() ;

      this.consultasClasificacionDesechos() ;
      
       this.limpiar();
    },
    methods: {
      limpiar(){
        
           
            this.form.id = 0;
            this.form.name = "";
            this.form.icono = "mdi-content-save-all";
            this.form.tipo_desechos = 0,
            this.form.clasificacion_desechos = 0,

             this.$refs.form.reset();



      },
      agregar(value){

        this.form.id = value.id;
        this.form.name = value.descripcion;
        this.form.icono = "mdi-update";
        this.form.tipo_desechos = value.id_tipo_desechos;
        this.form.clasificacion_desechos = value.id_claificacion_desechos;



        console.log(value);
        

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
      createClasificacion() {
   this.$refs.form.validate()
        let that = this;
        let url =
          this.$store.getters.getRuta +
          "/modulos/admision/paciente/createClasificacionDesechosDescripcion";
        
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
        
            //Errores de validación
            //loader.hide();
           
          });
           this.consultasClasificacionDesechos() ;
      
    },
    consultasClasificacionDesechos() {
 
        let that = this;
        let url =
          this.$store.getters.getRuta +
          "/modulos/admision/paciente/cargarClasificacionDescripcion";
        
        axios
          .get(url)
          .then(function (response) {
            that.clasificacion_desechos_descripcion_ = response.data.data;

          
          })
          .catch((error) => {
            //Errores de validación
           
           
          });
      
    },
       consultasTipoDesechos() {
 
        let that = this;
        let url =
          this.$store.getters.getRuta +
          "/modulos/admision/paciente/cargarTipoDesechos";
        
        axios
          .get(url)
          .then(function (response) {
            that.tipos_desechos_ = response.data.data;

          
          })
          .catch((error) => {
            //Errores de validación
            loader.hide();
           
          });
      
    },
     consultasTipoDesechosClasificacion(value) {
 
        let that = this;
        let url =
          this.$store.getters.getRuta +
          "/modulos/admision/paciente/cargarClasificacionporTipo/"+value;
        
        axios
          .get(url)
          .then(function (response) {
            that.clasificacion_desechos_ = response.data.data;

          
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