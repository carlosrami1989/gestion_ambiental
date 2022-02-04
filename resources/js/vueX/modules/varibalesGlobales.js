const varibalesGlobales = {
    state: {
        ruta: "/benemerita_erp/public"
    },
    mutations: {
        addRuta(state) {
            state.ruta = state.ruta;
        }
    },
    getters: {
        getRuta(state) {
            return state.ruta;
        }
    }
};

export default varibalesGlobales;
