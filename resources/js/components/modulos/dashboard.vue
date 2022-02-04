<template>
    <div>
        <v-row dense>
                <v-col
                cols="12"
                
                >
                 <v-card
                    
                >
            <v-card-title class="text-h5">
              Gestión de Desechos

            </v-card-title>
            <br>
             <br>
             
            <v-spacer></v-spacer>
               <canvas
              id="ingresospacientes"
              height="120px"
              width="auto"
              
             
            ></canvas>
                  

            
             
          </v-card>
        </v-col>
      </v-row>
    <v-row dense>
        <v-col
          cols="12"
          md="4"
        >
         <!-- la primera card -->
             
                    <v-card
                     color="indigo lighten-5"
                        class="mx-auto"
                        max-width="344"
                    >
                         
                       
                        <v-card-title class="indigo--text">
                      Total Registros ingresados 
                        </v-card-title>

                        <v-card-subtitle class="black--text">
                        por día 
                        </v-card-subtitle>

                        <v-card-text class="black--text">
                         
                            <v-icon 
                           color="orange darken-1"
                            size="80px">
                            mdi-chart-bar-stacked
                            </v-icon>
                            <b>{{ datos.total_r }}</b> 
                        </v-card-text>
                        <v-spacer></v-spacer>
                       
                    </v-card>
                
             
                    
 
 
         <!-- fin -->
        </v-col>

        <v-col
          cols="12"
          md="4"
        > <!-- la primera card -->
                            
             
                    <v-card
                     color="indigo lighten-5"
                        class="mx-auto"
                        max-width="344"
                    >
                         
                       
                        <v-card-title class="black--text">
                      Total de Kg.
                        </v-card-title>

                        <v-card-subtitle class="black--text">
                         Por día. 
                        </v-card-subtitle>

                        <v-card-text class="black--text">
                         
                            <v-icon 
                           color="purple darken-1"
                            size="80px">
                            mdi-weight-kilogram
                            </v-icon>
                                <b>{{ datos.total_k_d }}</b> 
                        </v-card-text>
                        <v-spacer></v-spacer>
                       
                    </v-card>
 
 
         <!-- fin -->
        </v-col>

        <v-col
          cols="12"
          md="4"
        >
          <!-- la primera card -->
                            
             
                    <v-card
                    color="indigo lighten-5"
                        class="mx-auto"
                        max-width="344"
                    >
                         
                        <v-card-title class="black--text">
                     Total de Kg.
                        </v-card-title>

                        <v-card-subtitle class="black--text">
                        Generado
                        </v-card-subtitle>
                    <v-card-text class="black--text">
                         
                            <v-icon 
                           color="red darken-2"
                            size="80px">
                            mdi-weight-kilogram
                            </v-icon>
                               <b>{{ parseFloat(datos.total_k_t).toFixed(4)}}</b> 
                        </v-card-text>
                        <v-spacer></v-spacer>

                       
                    </v-card>
 
 
         <!-- fin -->
        </v-col>
      </v-row>


      <!-- aqui empieza otra fila -->
     <v-row dense>
        <v-col
          cols="12"
          md="4"
        >
         <!-- la primera card -->
             
                    <v-card
                     color="indigo lighten-5"
                        class="mx-auto"
                        max-width="344"
                    >
                         
                       
                        <v-card-title class="indigo--text">
                     Exportar Datos
                        </v-card-title>

                        <v-card-subtitle class="black--text">
                       total de datos
                        </v-card-subtitle>

                        <v-card-text class="black--text">
                         
                            <v-icon 
                           color="green"
                            size="80px">
                         mdi-database-check
                            </v-icon>
                            
                        </v-card-text>
                        <v-spacer></v-spacer>
                       
                    </v-card>
                
             
                    
 
 
         <!-- fin -->
        </v-col>

        <v-col
          cols="12"
          md="4"
        > <!-- la primera card -->
                            
             
                    <v-card
                     color="indigo lighten-5"
                        class="mx-auto"
                        max-width="344"
                    >
                         
                       
                        <v-card-title class="black--text">
                     Rotary Astillero
                        </v-card-title>

                        <v-card-subtitle class="black--text">
                        2022-2023
                        </v-card-subtitle>

                        <v-card-text class="black--text">
                         
                            <v-icon 
                           color="light-blue darken-3"
                            size="80px">
                           mdi-ferry
                            </v-icon>
                               
                        </v-card-text>
                        <v-spacer></v-spacer>
                       
                    </v-card>
 
 
         <!-- fin -->
        </v-col>

        <v-col
          cols="12"
          md="4"
        >
          <!-- la primera card -->
                            
             
                    <v-card
                    color="indigo lighten-5"
                        class="mx-auto"
                        max-width="344"
                    >
                         
                        <v-card-title class="black--text">
                     Codeveloper
                        </v-card-title>

                        <v-card-subtitle class="black--text">
                        v.1.0.0.0
                        </v-card-subtitle>
                    <v-card-text class="black--text">
                         
                            <v-icon 
                           color="teal darken-4"
                            size="80px">
                           mdi-database-marker
                            </v-icon>
                               <b>admin@codevesolut.com</b>  
                              
                        </v-card-text>
                        <v-spacer></v-spacer>

                       
                    </v-card>
 
 
         <!-- fin -->
        </v-col>
      </v-row>
      <!-- aqui termina :v -->
    </div>
</template>
<script>


export default {
    data() {
        return {
            rating1:5,
            rating2:4.5,
          
                items: [
                    { text: 'Guayaquil', icon: 'mdi-city',color:'purple darken-3' },
                    { text: 'Duran', icon: 'mdi-home-city',color:'indigo darken-1' },
                    { text: 'Daule', icon: 'mdi-city-variant-outline',color:'green darken-2' },
                ],
            labels: [
      ],
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
      this.consultasTotales();
      this.consultasDashboard();
      this.totalesCirugia();
       
    },
    methods: {
      consultasTotales() {
 
        let that = this;
        let url =
          this.$store.getters.getRuta +
          "/modulos/admision/paciente/ConsultaDatos";
        
        axios
          .get(url)
          .then(function (response) {
          //  that.valor = response.data.data;
             that.datos.total_r=response.data.toal_registro;
           that.datos.total_k_d=response.data.kilos_dia;
           that.datos.total_k_t=response.data.kilos_total;

            

          
          })
          .catch((error) => {
            //Errores de validación
           
           
          });
      
    },
       consultasDashboard() {
 
        let that = this;
        let url =
          this.$store.getters.getRuta +
          "/modulos/admision/paciente/graficosPorDia";
        
        axios
          .get(url)
          .then(function (response) {
            that.valor = response.data.data;
            let objeto ={};
            for (let index = 0; index <  that.valor.length; index++) {
              //const element = array[index];
                objeto.fecha = that.valor[index].fech; 
                  that.labels.push(objeto.fecha);

                  objeto.peso = that.valor[index].total;
                   that.value.push(objeto.peso);
            }
           that.totalesCirugia();
           

            

          
          })
          .catch((error) => {
            //Errores de validación
           
           
          });

         
      
    },
       totalesCirugia(){
 

                 var cirSuspendida = {
                label: 'DESECHOS POR DIA',
                data: this.value,
                backgroundColor: 'rgba(255, 0, 0, 1)',
                borderColor: 'rgba(99, 132, 0, 1)',
                lineTension: 0,
                      fill: false,
                      borderColor: 'orange',
                      backgroundColor: 'transparent',
                      borderDash: [5, 5],
                      pointBorderColor: 'orange',
                      pointBackgroundColor: 'rgba(255,150,0,0.5)',
                      pointRadius: 5,
                      pointHoverRadius: 10,
                      pointHitRadius: 30,
                      pointBorderWidth: 2,
                      pointStyle: 'rectRounded',

                };

                var totalesData  = {
                labels: this.labels,
                datasets: [cirSuspendida]
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


                 this.vardatos = document.getElementById("ingresospacientes").getContext('2d');

                this.chardatos= new Chart(this.vardatos, {
                    type: 'line',
                  
                    data: totalesData,
                    options: chartOptions
                    //options: chartOptions
                    });

 

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