<template>
    <div>
    
      
   <v-col
                  
             
                >
                 <v-card
                    
                >
                
            <v-app-bar
      dark
      color="green"
    >
   
    <v-btn icon>
        <v-icon>mdi-clipboard-text</v-icon>
      </v-btn>
      <v-toolbar-title>Reportes</v-toolbar-title>

      <v-spacer></v-spacer>

      
      <!-- <br>
      <v-divider vertical color="white"></v-divider>
      <br> -->
       
    </v-app-bar>
             
            <v-spacer></v-spacer>
              
             <v-card-text>
               <v-row dense
                      xl="3"
                      md="2">
                      <v-col>
                       <v-select
                       color="green"
                        append-outer-icon="mdi-filter"
                      v-model="form.tipo_desechos"
                            :items="tipos_desechos_"
                            label="Seleccionar Tipos de Desechos"
                            item-text="descripcion"
                            item-value="id"
                            @change="consultasTipoDesechosClasificacion_(form.tipo_desechos)"
                            clearable
                          ></v-select>
                                
                  </v-col>
                  <!-- <v-divider vertical color="green" ></v-divider> -->
                  <v-col>

                            <v-select
                            clearable
                            color="green"
                            append-outer-icon="mdi-filter"
                                  v-model="form.clasificacion_desechos"
                                    :items="clasificacion_desechos_"
                                    label="Seleccionar Clasificación de Desechos"
                                    item-text="descripcion"
                                    item-value="id"
                                    @change="consultasTipoDesechosClasificacionDescripcion(form.tipo_desechos,form.clasificacion_desechos)"
                                   
                                  ></v-select>

                  </v-col>
                  <v-col> 
                             <v-select
                             clearable
                             color="green"
                            append-outer-icon="mdi-filter"
                            v-model="form.descripcion_desechos"
                                  :items="clasificacion_desechos_descripcion_"
                                  label="Seleccionar Clasificación de descripción de Desechos"
                                  item-text="descripcion"
                                  item-value="id"
                                  
                                ></v-select>
                      </v-col>
                    </v-row>
             </v-card-text>     
                <br>
                <v-divider></v-divider>
                <br>
            <v-card-text>
              <v-row dense
                        xl="2"
                        md="2">
                        <v-col >
                             <v-select
                                v-model="form.responsable"
                                :items="responsable_"
                                label="Seleccionar Responsable"
                                item-text="ALL"
                                item-value="id"
                                append-outer-icon="mdi-filter"
                                clearable
                                
                              ></v-select>
                             
                          </v-col>
                          <v-col>
                             
                                <v-select
                                 color="orange"
                                append-outer-icon="mdi-filter"
                                clearable
                                 v-model="form.id_departamento"
                                :items="departamento_"
                                label="Seleccionar el departamento donde proviene el desecho"
                                item-text="descripcion"
                                item-value="id"
                                
                              
                                
                              ></v-select>
                            
                             
                        </v-col>
                        </v-row>

            </v-card-text>
            


             <v-card-text>
                <v-row dense
                        xl="4"
                        md="2">
                                   
     
    <v-col
      cols="12"
      sm="6"
      md="4"
    >
      <v-menu
        v-model="menu2"
        :close-on-content-click="false"
        :nudge-right="40"
        transition="scale-transition"
        offset-y
        min-width="auto"
      >
        <template v-slot:activator="{ on, attrs }">
          <v-text-field
            v-model="form.date_desde"
            label="Fecha Inicio"
            prepend-icon="mdi-calendar"
            readonly
            v-bind="attrs"
            v-on="on"
          ></v-text-field>

 
        </template>
        <v-date-picker
          v-model="form.date_desde"
          @input="menu2 = false"
        ></v-date-picker>
       
      </v-menu>
    </v-col>
       <v-col
      cols="12"
      sm="6"
      md="4"
    >
       <v-menu
        v-model="menu3"
        :close-on-content-click="false"
        :nudge-right="40"
        transition="scale-transition"
        offset-y
        min-width="auto"
      >
        <template v-slot:activator="{ on, attrs }">
         

            <v-text-field
            v-model="form.date_hasta"
            label="Fecha Fin"
            prepend-icon="mdi-calendar"
            readonly
            v-bind="attrs"
            v-on="on"
          ></v-text-field>
        </template>
       
          <v-date-picker
          v-model="form.date_hasta"
          @input="menu3 = false"
        ></v-date-picker>
      </v-menu>
    </v-col>
    <v-spacer></v-spacer>
    
                   
                    </v-row>
             </v-card-text>
              <v-card-text>
                 <v-row dense
                        xl="4"
                        md="2">
                        <v-col >
                             <v-tooltip bottom>
                              <template v-slot:activator="{ on, attrs }">
                                <v-btn
                                  color="green"
                                  dark
                                  v-bind="attrs"
                                  v-on="on"
                                  @click="GenerarDocumento('E')"
                                >
                                   <v-icon>mdi-file-excel-box</v-icon>
                                </v-btn>
 
                              </template>
                              <span>Generar Excel</span>
                            </v-tooltip>
                               <v-tooltip bottom>
                              <template v-slot:activator="{ on, attrs }">
                                <v-btn
                                  color="red"
                                  dark
                                  v-bind="attrs"
                                  v-on="on"
                                >
                                    <v-icon>mdi-file-pdf-box</v-icon>
                                </v-btn>
 
                              </template>
                              <span>Generar PDF</span>
                            </v-tooltip>
                          </v-col>
                          
                        </v-row>

             </v-card-text>
          </v-card>
        </v-col>
    
  <!-- <v-divider color="green" ></v-divider> -->
  
 
      <!-- aqui empieza otra fila -->
   
      <!-- aqui termina :v -->
    </div>
</template>
<script>


export default {
    data() {
        return {
            rating1:5,
            rating2:4.5,
             date: (new Date(Date.now() - (new Date()).getTimezoneOffset() * 60000)).toISOString().substr(0, 10),
              menu: false,
              modal: false,
              menu2: false,
              menu3: false,

             form:{
                    icono:"mdi-file-star",
                    id:0,
                    name:"",
                    tipo_desechos:0,
                    clasificacion_desechos:0,
                    id_departamento:0,
                    descripcion_desechos:0,
                    peso:0,
                    responsable:0,
                    observacion:"",
                    date_desde: (new Date(Date.now() - (new Date()).getTimezoneOffset() * 60000)).toISOString().substr(0, 10),
                    date_hasta: (new Date(Date.now() - (new Date()).getTimezoneOffset() * 60000)).toISOString().substr(0, 10),
                    identificacion:"",

                },
            tipos_desechos_: [
          
        ],
        responsable_:[],
         clasificacion_desechos_:[],
        clasificacion_desechos_descripcion_:[],
         detalle_mantenimiento_:[],
         departamento_:[],
                    
                
            clearable:false,
      chartData: {
            labels: [],
            series:[[1,2], [4,5]]
        },
        chartOptions: {
            lineSmooth: false
        },
        datos:null,
            chardatos:null,
            datos:[],
            vardatosTotal:[],
            vardatosMes:[],
      value: [
       
      ],
      datos:{
          total_r:0,
          total_k_d:0,
          total_k_t:0,

      },
      valor:[],
        }
    },
    mounted() {
      

      //reportes
        this.consultasTipoDesechos() ;

   

 
      this.consultasResponsable();
      this.consultasDepartamento();
       
    },
    methods: {
      GenerarDocumento(value){
            
        let that = this;
        this.form.identificacion = value;
        let url =
          this.$store.getters.getRuta +
          "/modulos/admision/paciente/generacionDocumento";
          axios.post(url,that.form, {responseType: 'blob'},
         ).then(response => {
             // console.log(response.data);
              
              const url = window.URL.createObjectURL(new Blob([response.data]));
              const link = document.createElement('a');
              link.href = url;
              link.setAttribute('download', 'Reporte_de_registros.pdf'); //or any other extension
              document.body.appendChild(link);
              link.click();

            })
            .catch(error => {
              console.log(error);
            });
        
        // axios
        //   .post(url,that.form)
        //   .then(function (response) {
        //      console.log(response.data);
           
           

        //    // loader.hide();
        //   })
        //   .catch((error) => {
              
           
        //   });

      },
      Onchangetipos_desechos(value){
      if (value!=null) {
       

           this.form.tipo_desechos = value.id;
           this.consultasTipoDesechosClasificacion_(value.id);
        }
        // else{
        //    this.form.tipo_desechos =0;
        //       this.form.clasificacion_desechos = 0;
        //     this.clasificacion_desechos_=[];
        //      this.clasificacion_desechos_descripcion_=[];
        
        //    this.form.descripcion_desechos = 0;
        // }
      },
      OnchangeClasificacionDesechos(value){
      if (value!=null) {
         console.log(value);
         
           this.form.clasificacion_desechos = value.id;
           this.consultasTipoDesechosClasificacionDescripcion(this.form.tipo_desechos,  this.form.clasificacion_desechos )
        }else{
           console.log(value);
           this.clearable = true;
           this.form.clasificacion_desechos=0;
            this.clasificacion_desechos_=[];
        }
      },
      OnchangeClasificacionDesechosDescricion(value){
      if (value!=null) {
      
          this.clasificacion_desechos_descripcion_=[];
        
           this.form.descripcion_desechos = value.id;
        }else{
          
          this.clasificacion_desechos_descripcion_=[];
        
           this.form.descripcion_desechos = 0;
        }
      },
      OnchangeDepartamento(value){
      if (value!=null) {
      
           this.form.id_departamento = value.id;
        }
      },
      OnchangeResponsable(value){
        if (value!=null) {
           this.form.responsable = value.id;
        }
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
    consultasTipoDesechosClasificacionDescripcion(value,value2){
       let that = this;
        let url =
          this.$store.getters.getRuta +
          "/modulos/admision/paciente/cargarClasificacionporTipoDescripcion/"+value+"/"+value2;
        
        axios
          .get(url)
          .then(function (response) {
            that.clasificacion_desechos_descripcion_ = response.data.data;

          
          })
          .catch((error) => {
            //Errores de validación
            loader.hide();
           
          });
      

    },
     consultasTipoDesechosClasificacion_(value) {
 
        let that = this;
         that.clasificacion_desechos_descripcion_ = [];
        let url =
          this.$store.getters.getRuta +
          "/modulos/admision/paciente/cargarClasificacionporTipo/"+value;
        
        axios
          .get(url)
          .then(function (response) {
            that.clasificacion_desechos_ = response.data.data;
            if (that.clasificacion_desechos_.length==0) {
              that.form.clasificacion_desechos=0;
              that.form.descripcion_desechos=0;

               that.clasificacion_desechos_descripcion_ = [];
            }
             
            
          
          })
          .catch((error) => {
            //Errores de validación
            loader.hide( );
           
          });
         
      
    },
     
     consultasDepartamento(value) {
      //  if (value!=null) {
      //    console.log(value);
         
       
       
       
        let that = this;
        let url =
          this.$store.getters.getRuta +
          "/modulos/admision/paciente/cargarDepartamento";
        // let url =
        //   this.$store.getters.getRuta +
        //   "/modulos/admision/paciente/cargarDepartamentoid/"+value.Departamento;
        axios
          .get(url)
          .then(function (response) {
            that.departamento_ = response.data.data;
          
             
            
          
          })
          .catch((error) => {
            //Errores de validación
            loader.hide( );
           
          });
         
     // }
    },

      consultasResponsable() {
        
        
        let that = this;
        let url =
          this.$store.getters.getRuta +
          "/modulos/admision/paciente/cargarResponsable";
        
        axios
          .get(url)
          .then(function (response) {
            that.responsable_ = response.data.data;
          
             
            
          
          })
          .catch((error) => {
            //Errores de validación
            loader.hide( );
           
          });
         
      
    },
       consultarExcel(value){
     // console.log(value);
      
       window.open(
                  this.$store.getters.getRuta +
                    "/modulos/admision/paciente/generacionExcel");

       

    },

   
   
     
      
    },
}
</script>

<style>
  .v-sheet--offset {
    top: -24px;
    position: relative;
  }
</style>