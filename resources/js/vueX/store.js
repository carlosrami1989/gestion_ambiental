import Vue from "vue";
import Vuex from "vuex";

//import emergencia_store from './modules/emergencia_store'

Vue.use(Vuex);

export default new Vuex.Store({
    modules: {
        // emergencia_store
    },
    state: {
        // ruta: '/gestion_mantenimiento/public',
        // patch_web_viewer: '/gestion_mantenimiento/public/',
        // patch_file_pdf: "/gestion_mantenimiento/public/path-to/",
        // urlPdf: "",

        // ruta: '/benemerita_erp_desarrollo/public',
        // patch_web_viewer: '/benemerita_erp_desarrollo/public/',
        // patch_file_pdf: "/benemerit a_erp_desarrollo/public/path-to/",
        // urlPdf:"",

        // ruta: "/benemerita_erp/public",
        // patch_web_viewer: "/benemerita_erp/public/",
        // patch_file_pdf: "/benemerita_erp/public/path-to/",
        // urlPdf: "",
        usuario: [],
        //CUANDO SE USA DIRECTORIO VIRTUAL
        //ruta: "/majoma_sistema",
        //CUANDO SE USA SITIO WEB
        ruta: "",

        patch_web_viewer: "/",
        patch_file_pdf: "public/path-to/",
        urlPdf: "",

        //variable donde guardar el id de los documentos habilitantes de Hospitalizacion
        documento_habilitante: {
            msp_id: 1,
            iess_id: 2,
            identificacion_cedula_carne_id: 3,
            codigo_validacion_id: 4,
            acta_entrega_id: 5,
            hoja_historia_clinica_id: 6,
            formulario053_carta_comuna_id: 7,
            formulario006_epicrisis_id: 8,
            formulario008_emergencia_id: 9,
            formato_verificacion_control_pre_quirurgico_id: 10,
            registro_anestesia_id: 11,
            listado_verificacion_seguridad_cirugia_id: 12,
            valoracion_preanestesica_id: 13,
            protocolo_operatorio_id: 14,
            formulario024_consentimiento_quirurgico_id: 15,
            hoja_post_operatorio_id: 16,
            hoja_gastos_id: 17,
            formato_checklist_prequirurgico_id: 18,
            recuento_material_blanco_id: 19,
            kardex_medicamento_cirugia_id: 20,
            kardex_oxigenoterapia_cirugia_id: 21,
            formulario001_hoja_admision_id: 22,
            formulario024_consentimiento_informado_clinica_id: 23,
            formulario003_anamnesis_id: 24,
            formulario005E_evolucionesPrescripciones_id: 25,
            formulario005H_evolucionesPrescripciones_id: 26,
            acta_defuncion_id: 27,
            recetas_id: 28,
            factura_proforma_insumos_id: 29,
            hoja_alta_hoja_peticion_id: 30,
            formulario007_interconsultas_id: 31,
            formulario010_ordenes_resultados_laboratorio_id: 32,
            formulario012_ordenes_resultado_rayos_x_id: 33,
            electrocardiogramas_id: 34,
            formulario013_patologias_biopsias_id: 35,
            formulario020_signos_vitales_id: 36,
            registro_recepcion_dieta_hospitalaria_id: 37,
            formulario022_kardex_medicamentos_id: 38,
            kardex_oxigenoteria_hospitalizacion_id: 39,
            terapias_respiratorias_id: 40,
            hoja_tratamiento_respiratorio_id: 41,
            consumoOxigenoPaciente_id: 42,
            nota_enfermeria_id: 43,
            hoja_bitacora_id: 44,
            hoja_balance_id: 45,
            cambios_postulares_hoja_riesgo_id: 46,
            control_glicemia_id: 47,
            control_hemoderivados_id: 48,
            cruz_roja_id: 49,
            pruebas_pre_transfuncionales_id: 50,
            carta_manejo_historia_clinica_id: 51,
            planilla_cargo_proveedor: 52
        },

        //variable donde guardar el id de los documentos habilitantes de Consulta Externa
        documento_habilitante_con_ext: {
            planilla_cargo_proveedor: 55,
            msp_id: 1,
            iess_id: 2,
            identificacion_cedula_carne_id: 3,
            acta_entrega_id: 5,
            formulario053_carta_comuna_id: 7,
            formulario008_emergencia_id: 9,
            formulario005CE_evolucionesPrescripciones_id: 26,
            recetas_id: 28,
            formulario010_ordenes_resultados_laboratorio_id: 32,
            formulario012_ordenes_resultado_rayos_x_id: 33,
            electrocardiogramas_id: 34,
            carta_manejo_historia_clinica_id: 51,
            carta_autorizacion: 52,
            credenciales_servicios: 53
        },

        //variable donde guardar el id de los documentos habilitantes de Emergencia
        documento_habilitante_emer: {
            planilla_cargo_proveedor: 70,
            msp_id: 71,
            iess_id: 72,
            identificacion_cedula_carne_id: 73,
            codigo_validacion_id: 74,
            acta_entrega_id: 75,
            hoja_historia_clinica_id: 76,
            formulario053_carta_comuna_id: 77,
            carnet_jefe_comuna_id: 78,
            formulario008_emergencia_id: 79,
            formulario005E_evolucionesPrescripciones_id: 80,
            recetas_id: 81,
            formulario010_ordenes_resultados_laboratorio_id: 82,
            formulario012_ordenes_resultado_rayos_x_id: 83,
            electrocardiogramas_id: 84,
            terapias_respiratorias_id: 85,
            carta_manejo_historia_clinica_id: 86,
        },

        longitud_min_cedula: 9,
        longitud_max_cedula: 10,

        //index ConsultaExterna
        subMenuConsultaExterna: "",

        //Componente IngresoPaciente
        tipoPaciente: true, //recibe true o false si es paciente titular o paciente dependiente

        //Componente Paciente Titular o Dependiente
        ingresoPaciente: {
            cedula: "",
            codigoTDocumento: "",

            cedulaT: "",
            codigoTDocumentoT: "",

            tipo_parentesco: "",
            tipo_beneficiario: ""
        },

        arrayDatosPaciente: [], //recibira la data de la db o del RCivil titular o dependiente
        arrayDatosPacienteT: [], //recibira la data de la db o del RCivil titular

        tipoDocumento: "", //ojecto que recibe el codigo y descripcion (tipo documento)
        tipoDocumentoT: "",

        validarIngresoPacienteSgt: false,

        //Componente Tipo Ingreso
        dataTipoIngreso: {
            tipo_seguro: ""
        },

        mTipoIngreso: "",

        validarTipoIngresoSgt: false,

        //Componente Datos Paciente
        paciente: "", //Paciente titular y dependiente obj //guardara la data
        pacienteT: "",
        validarDatosPacienteSgt: false,
        validarDatosPacienteSgtT: false,

        //Componente Digitalizacion Documentos
        validarDigDocumentoSgt: false,

        //Componnete Citas Medicas
        validarCitasMedicasSgt: false,

        //Componente IngresoPaciente Dependiente

        //-------------index AdmisionEmergencia
        subMenuAdmisionEmergencia: "",

        //Index Hospitalizacion ConsultaExterna
        subMenuHospitalizacion: "",

        /***
         *  Emergencia
         *
         */
        //Componnete 1RegistroAdmision
        validar1RegistroAdmisionTabSigt: false,
        pacienteEmerg: "",

        //Componnete 2InicioDeAtencionMotivo
        validar2InicioDeAtencionMotivoTabSigt: false,
        //Componnete 6SignosVitalesMedicionesValoraciones
        validar6SignosVitalesMedicionesValoracionesTabSigt: false,
        //Componnete 11DiagnosticoDeIngreso
        validar11DiagnosticoDeIngresoTabSigt: false,
        //Componnete 13PlanDeTratamiento
        validar13PlanDeTratamientoTabSigt: false,
        //Componnete EnvioCorreoIESS
        validarEnvioCorreoIESSTabSigt: false,

        /////003
        tbEmergenciaAnamnesis1_motivo: [],
        validarTabMotivo: false,

        tbEmergenciaAnamnesis1_personales: [],
        validarTabAntPersonales: false,

        tbEmergenciaAnamnesis1_familiares: [],
        validarTabAntFamiliares: false,

        tbEmergenciaAnamnesis1_rActual: [],
        validarTabRevisionActual: false,

        tbEmergenciaAnamnesis1_eFisico: [],
        validarTabExamenFisico: false,

        //bandera_save:0,

        //Hospitalizacion

        validarBusquedaPacienteSgt: false,
        tbHospitalizacion_busqueda: [],

        validarAsignacionUnidadSgt: false,
        tbHospitalizacion_asignacion: [],

        validarAsistenciaMedicaSgt: false,

        ///005

        validar1Evolucion: false,
        tbEmergenciaEvolucionPrescripcion1: [],

        validartb2ExamenFisico: false,
        tb2ExamenFisico: [],

        validar3Hospitalarias: false,
        tb3Hospitalarias: [],

        validar4Ambulatorias: false,
        tb4Ambulatorias: [],

        validar5Dieta: false,
        tbEmergenciaEvolucionPrescripcionDieta: [],

        validar6Medicacion: false,
        tbEmergenciaEvolucionPrescripcionFarmacia: [],

        validar7Laboratorio: false,
        tbEmergenciaEvolucionPrescripcionLaboratorio: [],

        validar8Imagenes: false,
        tbEmergenciaEvolucionPrescripcionImagenes: [],

        validar9Insumos: false,
        tbEmergenciaEvolucionPrescripcionInsumos: [],

        arrayDetalle_5Dieta: [],
        arrayDetalle_6Medicacion: [],
        arrayDetalle_7Laboratorio: [],
        arrayDetalle_8Imagenes: [],
        arrayDetalle_9Insumos: [],

        tb10SolicitudExamen: []
    },

    //una mutacion se va a realizar siempre y cuando sea llamada desde una acccion
    mutations: {
        addUsuario(state) {
            state.usuario = state.usuario;
        },
        addRuta(state) {
            state.ruta = state.ruta;
        },
        addWebViewer(state) {
            state.patch_web_viewer = state.patch_web_viewer;
        },
        addPatchFilePdf(state) {
            state.patch_file_pdf = state.patch_file_pdf;
        },
        addUrlPdf(state) {
            state.url_pdf = state.url_pdf;
        },

        muStateCleanStoreVueX: function(state) {
            state.arrayDatosPaciente = [];
            state.subMenuConsultaExterna = "";
            state.tipoPaciente = false;
            state.ingresoPaciente.cedula = "";
            state.ingresoPaciente.codigoTDocumento = "";
            state.ingresoPaciente.cedulaT = "";
            state.ingresoPaciente.codigoTDocumentoT = "";
            state.ingresoPaciente.tipo_parentesco = "";
            state.ingresoPaciente.tipo_beneficiario = "";
            state.arrayDatosPacienteT = [];
            state.tipoDocumento = "";
            state.tipoDocumentoT = "";
            state.validarIngresoPacienteSgt = false;
            state.dataTipoIngreso.tipo_seguro = "";
            state.mTipoIngreso = "";
            state.subMenuAdmisionEmergencia = "";
            state.validarTipoIngresoSgt = false;
            state.paciente = "";
            state.pacienteT = "";
            state.validarDatosPacienteSgt = false;
            state.validarDatosPacienteSgtT = false;
            state.validarDigDocumentoSgt = false;
            state.validarCitasMedicasSgt = false;
            state.subMenuHospitalizacion = "";

            //Emergencia
            state.validar1RegistroAdmisionTabSigt = false;
            state.pacienteEmerg = "";

            state.validar2InicioDeAtencionMotivoTabSigt = false;
            state.validar6SignosVitalesMedicionesValoracionesTabSigt = false;
            state.validar11DiagnosticoDeIngresoTabSigt = false;
            state.validar13PlanDeTratamientoTabSigt = false;
            state.validarEnvioCorreoIESSTabSigt = false;

            /////003
            state.tbEmergenciaAnamnesis1_motivo = [];
            state.validarTabMotivo = false;

            state.tbEmergenciaAnamnesis1_personales = [];
            state.validarTabAntPersonales = false;

            state.tbEmergenciaAnamnesis1_familiares = [];
            state.validarTabAntFamiliares = false;

            state.tbEmergenciaAnamnesis1_rActual = [];
            state.validarTabRevisionActual = false;

            state.tbEmergenciaAnamnesis1_eFisico = [];
            state.validarTabExamenFisico = false;

            //state.bandera_save=fañse;

            //Hospitalizacion
            state.validarBusquedaPacienteSgt = false;
            state.tbHospitalizacion_busqueda = [];
            state.validarAsignacionUnidadSgt = false;
            state.tbHospitalizacion_asignacion = [];

            state.validarAsistenciaMedicaSgt = false;

            //005
            state.validar1Evolucion = false;
            state.tbEmergenciaEvolucionPrescripcion1 = [];

            (state.validartb2ExamenFisico = false),
            (state.tb2ExamenFisico = []),
            (state.validar3Hospitalarias = false);
            state.tb3Hospitalarias = [];

            state.validar4Ambulatorias = false;
            state.tb4Ambulatorias = [];

            state.validar5Dieta = false;
            state.tbEmergenciaEvolucionPrescripcionDieta = [];

            state.validar6Medicacion = false;
            state.tbEmergenciaEvolucionPrescripcionFarmacia = [];

            state.validar7Laboratorio = false;
            state.tbEmergenciaEvolucionPrescripcionLaboratorio = [];

            state.validar8Imagenes = false;
            state.tbEmergenciaEvolucionPrescripcionImagenes = [];

            state.validar9Insumos = false;
            state.tbEmergenciaEvolucionPrescripcionInsumos = [];

            state.arrayDetalle_8Imagenes = [];

            state.arrayDetalle_5Dieta = [];
            state.arrayDetalle_6Medicacion = [];
            state.arrayDetalle_7Laboratorio = [];
            state.arrayDetalle_8Imagenes = [];
            state.arrayDetalle_9Insumos = [];
            state.tb10SolicitudExamen = [];
        },

        //index Admision ConsultaExterna
        muStateSubMenuConsultaExterna: function(state) {
            state.subMenuConsultaExterna; //hace referencia al state (model)
        },

        //Componente IngresoPaciente
        muStateTipoPaciente: function(state) {
            state.tipoPaciente;
        },

        //Componente Paciente Titular
        muStateIngresoPaciente: function(state) {
            state.ingresoPaciente;
        },
        muStatePaciente: function(state) {
            state.arrayDatosPaciente;
        },
        muStateTipoDocumento: function(state) {
            state.tipoDocumento;
        },
        muStateValidarIngresoPacienteSgt: function(state) {
            state.validarIngresoPacienteSgt;
        },

        //Componente Tipo Ingreso
        muStateTipoIngreso: function(state) {
            state.dataTipoIngreso;
        },
        muStateTipoIngresoDescripcion: function(state) {
            state.mTipoIngreso;
        },
        muStateValidarTipoIngresoSgt: function(state) {
            state.validarTipoIngresoSgt;
        },

        //Componente Datos Paciente
        muStateDatosPaciente: function(state) {
            state.paciente;
        },
        muStateValidarDatosPacienteSgt: function(state) {
            state.validarDatosPacienteSgt;
        },

        //Componente Digitalizacion Documentos
        muStateValidarDigDocumentoSgt: function(state) {
            state.validarDigDocumentoSgt;
        },

        //Componente Citas Medicas
        muStateValidarCitasMedicasSgt: function(state) {
            state.validarCitasMedicasSgt;
        },

        /*********** Dependiente*/

        //Componente Paciente Dependiente
        muStatePacienteT: function(state) {
            state.arrayDatosPacienteT;
        },

        muStateTipoDocumentoT: function(state) {
            state.tipoDocumentoT;
        },

        //Componente Paciente Titular
        muStateDatosPaciente: function(state) {
            state.pacienteT;
        },

        muStateValidarDatosPacienteSgtT: function(state) {
            state.validarDatosPacienteSgtT;
        },

        //-------------index AdmisionEmergencia
        muStateSubMenuAdmisionEmergencia: function(state) {
            state.subMenuAdmisionEmergencia;
        },

        //Index Hospitalizacion ConsultaExterna
        muStateSubMenuAdmisionHospitalizacion: function(state) {
            state.subMenuHospitalizacion;
        },

        /***
         *  Emergencia
         *
         */
        //-------------index 1RegistroAdmision
        muStateValidar1RegistroAdmisionTabSigt: function(state) {
            state.validar1RegistroAdmisionTabSigt;
        },

        muStatePacienteEmerg: function(state) {
            state.pacienteEmerg;
        },

        muStateValidar2InicioDeAtencionMotivoTabSigt: function(state) {
            state.validar2InicioDeAtencionMotivoTabSigt;
        },

        muStateValidar6SignosVitalesMedicionesValoracionesTabSigt: function(
            state
        ) {
            state.validar6SignosVitalesMedicionesValoracionesTabSigt;
        },

        muStateValidar11DiagnosticoDeIngresoTabSigt: function(state) {
            state.validar11DiagnosticoDeIngresoTabSigt;
        },

        muStateValidar13PlanDeTratamientoTabSigt: function(state) {
            state.validar13PlanDeTratamientoTabSigt;
        },

        muStateValidarEnvioCorreoIESSTabSigt: function(state) {
            state.validarEnvioCorreoIESSTabSigt;
        },

        ///003
        muStateTbEmergenciaAnamnesis1_motivo: function(state) {
            state.tbEmergenciaAnamnesis1_motivo, state.validarTabMotivo;
        },
        muStateTbEmergenciaAnamnesis1_personales: function(state) {
            state.tbEmergenciaAnamnesis1_personales,
                state.validarTabAntPersonales;
        },
        muStateTbEmergenciaAnamnesis1_familiares: function(state) {
            state.tbEmergenciaAnamnesis1_familiares,
                state.validarTabAntFamiliares;
        },
        muStateTbEmergenciaAnamnesis1_rActual: function(state) {
            state.tbEmergenciaAnamnesis1_rActual,
                state.validarTabRevisionActual;
        },
        muStateTbEmergenciaAnamnesis1_eFisico: function(state) {
            state.tbEmergenciaAnamnesis1_eFisico, state.validarTabExamenFisico;
        },

        /* muStateBanderaSave:function(state){
            state.bandera_save
        }, */

        //Hospitalizacion
        muState_tbHospitalizacion_busqueda: function(state) {
            state.validarBusquedaPacienteSgt, state.tbHospitalizacion_busqueda;
        },

        muState_tbHospitalizacion_asignacion: function(state) {
            state.validarAsignacionUnidadSgt,
                state.tbHospitalizacion_asignacion;
        },

        muState_validarAsistenciaMedicaSgt: function(state) {
            state.validarAsistenciaMedicaSgt;
        },

        //05
        muState_validar1Evolucion: function(state) {
            state.validar1Evolucion, state.tbEmergenciaEvolucionPrescripcion1;
        },

        muState_validartb2ExamenFisico: function(state) {
            state.validartb2ExamenFisico, state.tb2ExamenFisico;
        },

        muState_validar3Hospitalarias: function(state) {
            state.validar3Hospitalarias, state.tb3Hospitalarias;
        },

        muState_validar4Ambulatorias: function(state) {
            state.validar4Ambulatorias, state.tb4Ambulatorias;
        },

        muState_validar5Dieta: function(state) {
            state.validar5Dieta,
                state.arrayDetalle_5Dieta,
                state.tbEmergenciaEvolucionPrescripcionDieta;
        },

        muState_validar6Medicacion: function(state) {
            state.validar6Medicacion,
                state.arrayDetalle_6Medicacion,
                state.tbEmergenciaEvolucionPrescripcionFarmacia;
        },

        muState_validar7Laboratorio: function(state) {
            state.validar7Laboratorio,
                state.arrayDetalle_7Laboratorio,
                state.tb10SolicitudExamen,
                state.tbEmergenciaEvolucionPrescripcionLaboratorio;
        },

        muState_validar8Imagenes: function(state) {
            state.validar8Imagenes,
                state.arrayDetalle_8Imagenes,
                state.tbEmergenciaEvolucionPrescripcionImagenes;
        },

        muState_validar9Insumos: function(state) {
            state.validar9Insumos,
                state.arrayDetalle_9Insumos,
                state.tbEmergenciaEvolucionPrescripcionInsumos;
        }
    },
    //eventos actions del store
    actions: {
        addUsuarioAction(context) {
            context.commit("addUsuario");
        },
        addRutaAction(context) {
            context.commit("addRuta");
        },
        addPatchWebViewerAction(context) {
            context.commit("addPatchWebViewer");
        },
        addPatchFilePdfAction(context) {
            context.commit("addPatchFilePdf");
        },
        addUrlPdfAction(context) {
            context.commit("addUrlPdf");
        },

        actionStateCleanStoreVueX: function(context) {
            context.commit("muStateCleanStoreVueX", null);
        },

        //-------------index Admision Consulta Externa
        actionStateSubMenuConsultaExterna: function(context) {
            context.commit("muStateSubMenuConsultaExterna");
        },

        //Componente IngresoPaciente
        actionStateTipoPaciente: function(context) {
            context.commit("muStateTipoPaciente");
        },

        //Componente Paciente Titular
        actionStateIngresoPaciente: function(context) {
            context.commit("muStateIngresoPaciente");
        },
        actionStatePaciente: function(context) {
            context.commit("muStatePaciente");
        },
        actionStateTipoDocumento: function(context) {
            context.commit("muStateTipoDocumento");
        },
        actionStateValidarIngresoPacienteSgt: function(context) {
            context.commit("muStateValidarIngresoPacienteSgt");
        },

        //Componente Tipo Ingreso
        actionStateTipoIngreso: function(context) {
            context.commit("muStateTipoIngreso");
        },
        actionStateTipoIngresoDescripcion: function(context) {
            context.commit("muStateTipoIngresoDescripcion");
        },
        actionStateValidarTipoIngresoSgt: function(context) {
            context.commit("muStateValidarTipoIngresoSgt");
        },

        //Componente Datos Paciente
        actionStateDatosPaciente: function(context) {
            context.commit("muStateDatosPaciente");
        },
        actionStateValidarDatosPacienteSgt: function(context) {
            context.commit("muStateValidarDatosPacienteSgt");
        },

        //Componente Digitalizacion Documentos
        actionStateValidarDigDocumentoSgt: function(context) {
            context.commit("muStateValidarDigDocumentoSgt");
        },

        //Componente Citas Medicas
        actionStateValidarCitasMedicasSgt: function(context) {
            context.commit("muStateValidarCitasMedicasSgt");
        },

        /*********** Dependiente*/

        //Caomponente Paciente Dependiente
        actionStatePacienteT: function(context) {
            context.commit("muStatePacienteT");
        },
        actionStateTipoDocumentoT: function(context) {
            context.commit("muStateTipoDocumentoT");
        },

        //Componente Datos Titular
        actionStateDatosPacienteT: function(context) {
            context.commit("muStateDatosPaciente");
        },

        actionStateValidarDatosPacienteSgtT: function(context) {
            context.commit("muStateValidarDatosPacienteSgtT");
        },

        //-------------index AdmisionEmergencia
        actionStateSubMenuAdmisionEmergencia: function(context) {
            context.commit("muStateSubMenuAdmisionEmergencia");
        },

        //Index Hospitalizacion ConsultaExterna
        actionStateSubMenuAdmisionHospitalizacion: function(context) {
            context.commit("muStateSubMenuAdmisionHospitalizacion");
        },

        /***
         *  Emergencia
         *
         */
        //-------------index 1RegistroAdmision
        actionStateValidar1RegistroAdmisionTabSigt: function(context) {
            context.commit("muStateValidar1RegistroAdmisionTabSigt");
        },

        actionStatePacienteEmerg: function(context) {
            context.commit("muStatePacienteEmerg");
        },

        actionStateValidar2InicioDeAtencionMotivoTabSigt: function(context) {
            context.commit("muStateValidar2InicioDeAtencionMotivoTabSigt");
        },

        actionStateValidar6SignosVitalesMedicionesValoracionesTabSigt: function(
            context
        ) {
            context.commit(
                "muStateValidar6SignosVitalesMedicionesValoracionesTabSigt"
            );
        },

        actionStateValidar11DiagnosticoDeIngresoTabSigt: function(context) {
            context.commit("muStateValidar11DiagnosticoDeIngresoTabSigt");
        },

        actionStateValidar13PlanDeTratamientoTabSigt: function(context) {
            context.commit("muStateValidar13PlanDeTratamientoTabSigt");
        },

        actionStateValidarEnvioCorreoIESSTabSigt: function(context) {
            context.commit("muStateValidarEnvioCorreoIESSTabSigt");
        },

        ///003
        actionStateTbEmergenciaAnamnesis1_motivo: function(context) {
            context.commit("muStateTbEmergenciaAnamnesis1_motivo");
        },
        actionStateTbEmergenciaAnamnesis1_personales: function(context) {
            context.commit("muStateTbEmergenciaAnamnesis1_personales");
        },
        actionStateTbEmergenciaAnamnesis1_familiares: function(context) {
            context.commit("muStateTbEmergenciaAnamnesis1_familiares");
        },
        actionStateTbEmergenciaAnamnesis1_rActual: function(context) {
            context.commit("muStateTbEmergenciaAnamnesis1_rActual");
        },
        actionStateTbEmergenciaAnamnesis1_eFisico: function(context) {
            context.commit("muStateTbEmergenciaAnamnesis1_eFisico");
        },

        actionStateValidarTabExamenFisico: function(context) {
            context.commit("muState_validartb2ExamenFisico");
        },

        //Hospitalizacion
        actionState_tbHospitalizacion_busqueda: function(context) {
            context.commit("muState_tbHospitalizacion_busqueda");
        },

        actionState_tbHospitalizacion_asignacion: function(context) {
            context.commit("muState_tbHospitalizacion_asignacion");
        },

        actionStatevalidarAsistenciaMedicaSgt: function(context) {
            context.commit("muState_validarAsistenciaMedicaSgt");
        },

        //05

        actionStatetbEmergenciaEvolucionPrescripcion1: function(context) {
            context.commit("muState_validar1Evolucion");
        },
        actionStatetb3Hospitalarias: function(context) {
            context.commit("muState_validar3Hospitalarias");
        },
        actionStatetb4Ambulatorias: function(context) {
            context.commit("muState_validar4Ambulatorias");
        },
        actionStatetbEmergenciaEvolucionPrescripcionDieta: function(context) {
            context.commit("muState_validar5Dieta");
        },
        actionStatetbEmergenciaEvolucionPrescripcionFarmacia: function(
            context
        ) {
            context.commit("muState_validar6Medicacion");
        },
        actionStatetbEmergenciaEvolucionPrescripcionLaboratorio: function(
            context
        ) {
            context.commit("muState_validar7Laboratorio");
        },
        actionStatetbEmergenciaEvolucionPrescripcionImagenes: function(
            context
        ) {
            context.commit("muState_validar8Imagenes");
        },
        actionStatetbEmergenciaEvolucionPrescripcionInsumos: function(context) {
            context.commit("muState_validar9Insumos");
        }
    },
    getters: {
        getUsuario(state) {
            return state.clientefactura;
        },
        getLongitudMinCedula(state) {
            return state.longitud_min_cedula;
        },
        getLongitudMaxCedula(state) {
            return state.longitud_max_cedula;
        },
        getRuta(state) {
            return state.ruta;
        },
        getPatchWebViewerAction(state) {
            return state.patch_web_viewer;
        },
        getPatchFilePdfAction(state) {
            return state.patch_file_pdf;
        },
        getUrlPdf(state) {
            return state.url_pdf;
        },

        getStateDocumentoHabilitante: function(state) {
            return state.documento_habilitante;
        },

        getStateDocumentoHabilitanteConExt: function(state) {
            return state.documento_habilitante_con_ext;
        },

        getStateDocumentoHabilitanteEmer: function(state) {
            return state.documento_habilitante_emer;
        },
        //-------------index Admision Consulta Externa
        getStateSubMenuConsultaExterna(state) {
            return state.subMenuConsultaExterna;
        },

        //Componente IngresoPaciente
        getStateTipoPaciente(state) {
            return state.tipoPaciente;
        },

        //Componente Paciente Titular
        getStateIngresoPaciente: function(state) {
            return state.ingresoPaciente;
        },
        getStatePaciente: function(state) {
            return state.arrayDatosPaciente;
        },
        getStateTipoDocumento: function(state) {
            return state.tipoDocumento;
        },
        getStateValidarIngresoPacienteSgt: function(state) {
            return state.validarIngresoPacienteSgt;
        },

        //Componente Tipo Ingreso
        getStateTipoIngreso: function(state) {
            return state.dataTipoIngreso;
        },
        getStateTipoIngresoDescripcion: function(state) {
            return state.mTipoIngreso;
        },
        getStateValidarTipoIngresoSgt: function(state) {
            return state.validarTipoIngresoSgt;
        },

        //Componente Datos Paciente
        getStateDatosPaciente: function(state) {
            return state.paciente;
        },
        getStateValidarDatosPacienteSgt: function(state) {
            return state.validarDatosPacienteSgt;
        },

        //Componente Digitalizacion Documentos
        getStateValidarDigDocumentoSgt: function(state) {
            return state.validarDigDocumentoSgt;
        },

        //Componente Citas Medicas
        getStateValidarCitasMedicasSgt: function(state) {
            return state.validarCitasMedicasSgt;
        },

        /*********** Dependiente*/

        //Componente Paciente Dependiente
        getStatePacienteT: function(state) {
            return state.arrayDatosPacienteT;
        },
        getStateTipoDocumentoT: function(state) {
            return state.tipoDocumentoT;
        },

        //Componente Datos Titular
        getStateDatosPacienteT: function(state) {
            return state.pacienteT;
        },
        getStateValidarDatosPacienteSgtT: function(state) {
            return state.validarDatosPacienteSgtT;
        },

        getStateSubMenuAdmisionEmergencia: function(state) {
            return state.subMenuAdmisionEmergencia;
        },

        /***
         *  Emergencia
         *
         */
        //-------------index AdmisionEmergencia
        getStateValidar1RegistroAdmisionTabSigt(state) {
            return state.validar1RegistroAdmisionTabSigt;
        },

        getStatePacienteEmerg(state) {
            return state.pacienteEmerg;
        },

        getStateValidar2InicioDeAtencionMotivoTabSigt(state) {
            return state.validar2InicioDeAtencionMotivoTabSigt;
        },

        getStateValidar6SignosVitalesMedicionesValoracionesTabSigt(state) {
            return state.validar6SignosVitalesMedicionesValoracionesTabSigt;
        },

        getStateValidar11DiagnosticoDeIngresoTabSigt(state) {
            return state.validar11DiagnosticoDeIngresoTabSigt;
        },

        getStateValidar13PlanDeTratamientoTabSigt(state) {
            return state.validar13PlanDeTratamientoTabSigt;
        },

        getStateValidarEnvioCorreoIESSTabSigt(state) {
            return state.validarEnvioCorreoIESSTabSigt;
        },

        //////003
        getStateTbEmergenciaAnamnesis1_motivo(state) {
            return state.tbEmergenciaAnamnesis1_motivo;
        },
        getStateValidarTabMotivo(state) {
            return state.validarTabMotivo;
        },

        getStateTbEmergenciaAnamnesis1_personales(state) {
            return state.tbEmergenciaAnamnesis1_personales;
        },
        getStateValidarTabAntPersonales(state) {
            return state.validarTabAntPersonales;
        },

        getStateTbEmergenciaAnamnesis1_familiares(state) {
            return state.tbEmergenciaAnamnesis1_familiares;
        },
        getStateValidarTabAntFamiliares(state) {
            return state.validarTabAntFamiliares;
        },

        getStateTbEmergenciaAnamnesis1_rActual(state) {
            return state.tbEmergenciaAnamnesis1_rActual;
        },
        getStateValidarTabRevisionActual(state) {
            return state.validarTabRevisionActual;
        },

        getStateTbEmergenciaAnamnesis1_eFisico(state) {
            return state.tbEmergenciaAnamnesis1_eFisico;
        },
        getStateValidarTabExamenFisico(state) {
            return state.validarTabExamenFisico;
        },

        /* getStateBanderaSave(state){
            return state.bandera_save;
        }, */

        //Hospitalizacion
        getStateValidarBusquedaPacienteSgt(state) {
            return state.validarBusquedaPacienteSgt;
        },

        getState_tbHospitalizacion_busqueda(state) {
            return state.tbHospitalizacion_busqueda;
        },

        getStateValidarAsignacionUnidadSgt(state) {
            return state.validarAsignacionUnidadSgt;
        },

        getState_tbHospitalizacion_asignacion(state) {
            return state.tbHospitalizacion_asignacion;
        },

        getState_validarAsistenciaMedicaSgt(state) {
            return state.validarAsistenciaMedicaSgt;
        },

        //05

        getStateValidar1Evolucion(state) {
            return state.validar1Evolucion;
        },
        getStateValidar3Hospitalarias(state) {
            return state.validar3Hospitalarias;
        },
        getStateValidar4Ambulatorias(state) {
            return state.validar4Ambulatorias;
        },
        getStateValidar5Dieta(state) {
            return state.validar5Dieta;
        },
        getStateValidar6Medicacion(state) {
            return state.validar6Medicacion;
        },
        getStateValidar7Laboratorio(state) {
            return state.validar7Laboratorio;
        },
        getStateValidar8Imagenes(state) {
            return state.validar8Imagenes;
        },
        getStateValidar9Insumos(state) {
            return state.validar9Insumos;
        },

        getStateTbEmergenciaEvolucionPrescripcion1(state) {
            return state.tbEmergenciaEvolucionPrescripcion1;
        },
        getStateTb3Hospitalarias(state) {
            return state.tb3Hospitalarias;
        },
        getStateTb4Ambulatorias(state) {
            return state.tb4Ambulatorias;
        },
        getStateTbEmergenciaEvolucionPrescripcionDieta(state) {
            return state.tbEmergenciaEvolucionPrescripcionDieta;
        },
        getStateTbEmergenciaEvolucionPrescripcionFarmacia(state) {
            return state.tbEmergenciaEvolucionPrescripcionFarmacia;
        },
        getStateTbEmergenciaEvolucionPrescripcionLaboratorio(state) {
            return state.tbEmergenciaEvolucionPrescripcionLaboratorio;
        },
        getStateTbEmergenciaEvolucionPrescripcionImagenes(state) {
            return state.tbEmergenciaEvolucionPrescripcionImagenes;
        },
        getStateTbEmergenciaEvolucionPrescripcionInsumos(state) {
            return state.tbEmergenciaEvolucionPrescripcionInsumos;
        },

        getStateArrayDetalle_5Dieta(state) {
            return state.arrayDetalle_5Dieta;
        },

        getStateArrayDetalle_6Medicacion(state) {
            return state.arrayDetalle_6Medicacion;
        },

        getStateArrayDetalle_7Laboratorio(state) {
            return state.arrayDetalle_7Laboratorio;
        },

        getStateArrayDetalle_8Imagenes(state) {
            return state.arrayDetalle_8Imagenes;
        },

        getStateArrayDetalle_9Insumos(state) {
            return state.arrayDetalle_9Insumos;
        },

        getStateTb10SolicitudExamen(state) {
            return state.tb10SolicitudExamen;
        },

        getStateValidartb2ExamenFisico(state) {
            return state.validartb2ExamenFisico;
        },

        getStateTb2ExamenFisico(state) {
            return state.tb2ExamenFisico;
        }
    }
});