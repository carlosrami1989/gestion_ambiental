<template>
 <div>
 <v-sheet >
   <v-alert
      :value="alert"
      color="#C51162"
      dark
      icon="mdi-human-child"
       
    >
     {{ formPaciente.name }}
    </v-alert>
 </v-sheet>
 <v-alert
      :value="alertA"
      color="orange"
      dark
      icon="mdi-alert"
     
    >
     {{ formPaciente.alergiastxt }}
    </v-alert>
 </v-sheet>
     
 
 
       
  <v-stepper
    v-model="e6"
    vertical
  >
    <v-stepper-step
      :complete="e6 > 1"
      step="1"
      editable
    >
    
     Selección del Paciente
      <small>Consutorio Dr.</small>
    </v-stepper-step>

    <v-stepper-content step="1">
    <v-form v-model="valid">
    
   <v-row>
     <v-col
          
        >
    <v-autocomplete
              v-model="model"
              :items="items"
              :loading="isLoading"
              :search-input.sync="search"
              chips
              @input="Consultar($event)"
            
              clearable
              hide-details
              hide-selected
              item-text="apellido_paterno"
              item-value="id"
              label="Busqueda de Paciente ..."
              return-object
               
            >
    
      <template v-slot:no-data>
        <v-list-item>
          <v-list-item-title>
            Busqueda de pacientes
            
          </v-list-item-title>
        </v-list-item>
      </template>
      <template v-slot:selection="{ attr, on, item, selected }">
        <v-chip
          v-bind="attr"
          :input-value="selected"
          color="blue-grey"
          class="white--text"
          v-on="on"
        >
          <v-icon left>
            mdi-bitcoin
          </v-icon>
        
             <span v-text="item.FULLNAME"></span>
        </v-chip>
      </template>
      <template v-slot:item="{ item }">
        <v-list-item-avatar
          
          class="text-h5 font-weight-light white--text"
        >
         <v-icon
           large
          color="blue darken-2"
         >mdi-human-child</v-icon>
        </v-list-item-avatar>
        <v-list-item-content>
          <v-list-item-title v-text=" item.FULLNAME"></v-list-item-title>
          <v-list-item-subtitle v-text="item.direccion"></v-list-item-subtitle>
        </v-list-item-content>
         
      </template>
    </v-autocomplete>
     
    </v-col>
</v-row>
 </v-form >
 <br>
      <v-btn
        color="primary"
        @click="siguiente()"
      >
        Continue
      </v-btn>
      <v-btn text>
        Cancel
      </v-btn>
    </v-stepper-content>

    <v-stepper-step
      :complete="e6 > 2"
      step="2"
      editable
    >
      Detalles de signos Vitales 
    </v-stepper-step>

    <v-stepper-content step="2"
    editable>
    <v-row>
     <v-col
          
        >
       <canvas
                                            id="ingresospacientes"
                                            height="100"
                                            width="250"
                                            class="chartjs-render-monitor"
                                             
                                        ></canvas>
                                        
      </v-col>
     </v-row>
     
          
         
      <v-btn
        color="primary"
        @click="e6 = 3"
      >
        Continue
      </v-btn>
      <v-btn text>
        Cancel
      </v-btn>
    </v-stepper-content>

    <v-stepper-step
      :complete="e6 > 3"
      step="3"
      editable
    >
      Alergías
    </v-stepper-step>

    <v-stepper-content step="3">
      <v-row>
        <v-col>
            <v-text-field
              label="Alergia"
              name="name"
              textarea
              v-model="formPaciente.alergiastxt"
            ></v-text-field>
        </v-col>
      </v-row>
      <v-btn
        color="primary"
        @click="e6 = 4"
      >
        Continue
      </v-btn>
      <v-btn text>
        Cancel
      </v-btn>
    </v-stepper-content>

    <v-stepper-step 
    :complete="e6 > 4"
     step="4"
     editable>
      Observación
    </v-stepper-step>
    <v-stepper-content step="4">
      <v-row>
        <v-col>
            <v-textarea
             
              
              
              
               hint="Observación"
            ></v-textarea>
        </v-col>
      </v-row>
      <v-btn
        color="primary"
        @click="e6 = 5"
      >
        Continue
      </v-btn>
      <v-btn text>
        Cancel
      </v-btn>
    </v-stepper-content>


    
    <v-stepper-step
      :complete="e6 > 5"
      step="5"
      editable
    >
      Prescripcion - Farmacoterapia
    </v-stepper-step>

    <v-stepper-content step="5">
      <v-row>
        <v-col>
            <v-text-field
              label="Alergia"
              name="name"
              textarea
              v-model="formPaciente.alergiastxt"
            ></v-text-field>
        </v-col>
      </v-row>
      <v-btn
        color="primary"
    
      >
        Continue
      </v-btn>
      <v-btn text>
        Cancel
      </v-btn>
    </v-stepper-content>
  </v-stepper>
 
      </div>  
 
</template>

<script>
 
  export default {
   
    data () {
      return {
        alert: false,
        alertA:false,
        model: null,
        search: null,
        items: [],
        valid: false,
        tab: null,
        e6: 1,
        isLoading: false,
        formPaciente:{
        hc:0,
        name:"",
        alergiastxt:"",

          },
        valorsv:null,
        chartssv:null,
        signosv:[],
        fechassv:[],
        temperaturav:[],
        pesov:[],
        tallasv:[],
            
        
      }
    },
    watch: {
       
      search (val) {
        // Items have already been loaded
        

        this.isLoading = true;

        // Lazily load input items
        fetch('/modulos/admision/paciente/cargar_paciente/'+ val)
          .then(res => res.clone().json())
          .then(res => {
            
            
            this.items = res.paciente
          })
          .catch(err => {
            console.log(err)
          })
          .finally(() => (this.isLoading = false))
      },
     

      /**fin */
    },
    methods: {
      siguiente(){
        if (this.formPaciente.hc == 0) {
            this.e6 = 1;
        } else {
          
        }
        this.alert = true;

        this.e6 = 2;
        this.consultarsv(this.formPaciente.hc);
      },
       Consultar(value){
      
        if ( value == null || value == undefined ) {
           this.formPaciente.hc = "" ;
          this.alert=false;
          this.formPaciente.name="";
          
        }else{
           this.formPaciente.hc = value.id;
            this.formPaciente.name=value.FULLNAME;
          
        }
       
       
  
          
      },
       consultarsv(value){
        let url = '/modulos/clinico/medico/cargar_sv/'+value;
            this.fechassv=[];
            this.temperaturav=[];
            this.pesov=[];
            this.tallasv=[];

            
         fetch(url)
          .then(res => res.clone().json())
          .then(res => {
          //   this.signosv = res.preparacion;
          //  console.log( this.signosv);
             for (let i = 0; i < res.preparacion.length; i++) {
             this.fechassv.push(res.preparacion[i].fecha_ingreso);
             this.temperaturav.push(res.preparacion[i].temperatura);
            this.pesov.push(res.preparacion[i].peso);
            this.tallasv.push(res.preparacion[i].talla);
             }
             this.totalesCirugia();
             if (res.alergia!=null) {
               this.alertA = true;
               this.formPaciente.alergiastxt =res.alergia[0].descripcion;
             }else{
               this.alertA = false;
             }
            //console.log( this.fechassv);
            
            
            
          })
          .catch(err => {
            console.log(err)
          })
          .finally(() => (this.isLoading = false))

      },
          totalesCirugia(){
          
            let that = this;
         
              var TemperaturaSv = {

                label: 'Temperatura',
                data: that.temperaturav,
                fill:false,
                borderColor: '#FF9800',
                
                };
          var PesoSv = {
                label: 'Peso',
                data: that.pesov,
                fill:false,
                borderColor: '#33691E',
                
                };
                
                var TallaSv = {
                label: 'Talla',
                data:  that.tallasv,
                fill:false,
               // backgroundColor: 'rgba(0, 187, 82, 1)',
                borderColor: '#0D47A1',
               
                };
    
                
                
                var totalesData  = {
                labels: that.fechassv,
                datasets: [TemperaturaSv,PesoSv,TallaSv]
                };

                var chartOptions = {
                scales: {
                    xAxes: [{
                    barPercentage: 1,
                    categoryPercentage: 0.6
                    }],
                    yAxes: [{
                    id: "y-axis-density"
                    }, {
                    id: "y-axis-gravity"
                    }]
                }
                };
                    
                   
                 that.valorsv = document.getElementById("ingresospacientes").getContext('2d');
                that.chartssv= new Chart(that.valorsv, {
                    type: 'line',
                    data: totalesData,
                    options: chartOptions
                    });



           
             //  that.charIngresos.destroy();  
               
        },
      
    },
    
  }
</script>