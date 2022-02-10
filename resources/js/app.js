require('./bootstrap');

import Vue from "vue";
import App from "./components/home/components/AppBar";

import { funcionesGlobales } from "./funciones.js";


import routes from "./routes/index";
import VueRouter from "vue-router";

import Vuetify from 'vuetify';
import 'vuetify/dist/vuetify.min.css';
import store from "./vueX/store";
import "./plugins";

import 'Chart.js';

const utf8 = require('utf8');
Vue.prototype.utf8 = utf8;

Vue.prototype.$funcionesGlobales = funcionesGlobales;
Vue.use(Vuetify);

Vue.use(VueRouter);
const router = new VueRouter({
    mode: "hash",
    routes,
    mode: 'history',
});



Vue.component(
    "home",
    require("./components/home/index").default
);
Vue.component(
    "home-app-bar",
    require("./components/home/components/AppBar").default
);
Vue.component(
    "home-view",
    require("./components/home/components/View").default
);
//*componentes de pacientes //
Vue.component(
    "paciente-informacion",
    require("./components/modulos/Administracion/PacientesComponents/informacionpersonal.vue").default
);
Vue.component(
    "paciente-representante",
    require("./components/modulos/Administracion/PacientesComponents/informacionrepresentante.vue").default
);
//**  fin */
new Vue({
    store,

    vuetify: new Vuetify(), //<-----
    el: "#app",
    components: {
        App
    },
    router
})