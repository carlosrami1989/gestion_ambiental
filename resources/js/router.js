import Vue from "vue";
import { prefix } from "../variables";
import VueRouter from "vue-router";
import dashboard from "./components/modulos/dashboard";
import IndexCompra from "./components/modulos/compra/indexCompra";

import paciente from "./components/modulos/Administracion/paciente";
import tipodesechos from "./components/modulos/Parametrizacion/TipoDesechos/index.vue";
import Clasificacion from "./components/modulos/Parametrizacion/ClasificacionDesechos/index.vue";
import DesechosDescripcion from "./components/modulos/Parametrizacion/DesechosDescripcion/index.vue";



import control_clinico from "./components/modulos/Medico/index.vue";

Vue.use(VueRouter);

let prefijo = prefix;

export default new VueRouter({
    routes: [{
            path: prefijo +
                "/modulos/parametrizacion/tipodesechos",
            name: "Tipos de Desechos",
            component: tipodesechos,


        },
        {
            path: prefijo +
                "/modulos/parametrizacion/clasificaciondesechos",
            name: "Clasificacion de Desechos",
            component: Clasificacion,


        },
        {
            path: prefijo +
                "/modulos/parametrizacion/desechosdescripcion",
            name: "Desechos por Descripcion",
            component: tipodesechos,


        },
        {
            path: prefijo +
                "/modulos/medico/005",
            name: "Control Clinico",
            component: control_clinico,


        }
        ///modulos/administracion/ingreso

    ],
    mode: "history" //Evita que aparezca # en la ruta
});