import { prefix } from "../variables";
//import paciente from "../components/modulos/Administracion/paciente";
import dashboard from ".././components/modulos/dashboard";
import IndexCompra from ".././components/modulos/compra/indexCompra";

import paciente from ".././components/modulos/Administracion/paciente";
import control_clinico from ".././components/modulos/Medico/index.vue";

import tipodesechos from ".././components/modulos/Parametrizacion/TiposDesechos/index.vue";
import Clasificacion from ".././components/modulos/Parametrizacion/ClasificacionDesechos/index.vue";
import DesechosDescripcion from ".././components/modulos/Parametrizacion/DesechosDescripcion/index.vue";
import ingresodesechos from ".././components/modulos/Administracion/Mantenimiento/index.vue";
import departamento from ".././components/modulos/Parametrizacion/TiposDesechos/index.vue";


///modulos/administracion/ingreso
//seguridad
import registrar from ".././components/modulos/Seguridad/Registro_usuario.vue";


let prefijo = prefix;
console.log(prefijo);

const home = [{
        path: prefix +
            "",
        name: "Ingreso de Pacientes",
        component: dashboard
    },
    {
        path: prefix +
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
        component: DesechosDescripcion,
    },
    {
        path: prefix +
            "/modulos/medico/005",
        name: "Control Clinico",
        component: control_clinico,


    },
    //ingresodesechos
    {
        path: prefix +
            "/modulos/administracion/ingreso",
        name: "Ingreso de Desechos",
        component: ingresodesechos,


    },
    //registrar
    {
        path: prefix +
            "/modulos/seguridad/registrar",
        name: "Creación de Usuario",
        component: registrar,


    },


];

export default home;