export default ({
    namespaced: true,
    state:{
       
        //Componnete 1RegistroAdmision
        validar1RegistroAdmisionTabSigt:false,      
        pacienteEmerg:'',

    },
    
    mutations:{
        //-------------index 1RegistroAdmision
        muStateValidar1RegistroAdmisionTabSigt:function(state){
            state.validar1RegistroAdmisionTabSigt; 
        },

        muStatePacienteEmerg:function(state){
            state.paciente; 
        },
    },
    //eventos actions del store
    actions:{
        //-------------index 1RegistroAdmision
        actionStateValidar1RegistroAdmisionTabSigt:function(state){
            context.commit('muStateValidar1RegistroAdmisionTabSigt')
        },

        actionStatePacienteEmerg:function(context){
            context.commit('muStatePaciente')
        },



    },
    getters:{
        //-------------index 1RegistroAdmision
        getStateValidar1RegistroAdmisionTabSigt(state){
            return state.validar1RegistroAdmisionTabSigt;
        },

        getStatePacienteEmerg(state){
            return state.paciente;
        },
    }
});

