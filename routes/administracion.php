<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::group(['prefix' => 'modulos/admision', 'middleware' => ['auth:web'], 'verified'], function () {

    /* SubModulo Medico */
    Route::namespace('Modulos\Administracion')->prefix('paciente')->group(function () {
        //Modulo de Cirugia
        Route::get('cargar_paciente/{nombre}', 'PacienteController@ConsultarPaciente');

        //Modulo de genero
        Route::get('cargar_genero', 'PacienteController@consultargenero');

        Route::get('cargar_provincia', 'PacienteController@consultarProvincia');
        Route::get('cargar_ciudad/{idprovincia}', 'PacienteController@consultarciudad');

        // tipo desechos
        Route::get('cargarTipoDesechos', 'tipo_desechos@consultar');
        Route::post('crearTipoDesechos', 'tipo_desechos@create');
        //** */
        Route::get('cargarClasificacion', 'tipo_desechos@consultarClasificacion');
        Route::post('crearClasificacionDesechos', 'tipo_desechos@createClasificacionDesechos');
        //***/ */
        Route::get('cargarClasificacionDescripcion', 'tipo_desechos@consultarClasificacionDescripcion');
        Route::get('cargarClasificacionporTipo/{tipo}', 'tipo_desechos@consultarClasificacionPorTipo');
        Route::get('cargarClasificacionporTipoDescripcion/{tipo}/{clasificacion}', 'tipo_desechos@consultarClasificacionPorDescripcion');

        Route::post('createClasificacionDesechosDescripcion', 'tipo_desechos@createClasificacionDesechosDescripcion');

       // createClasificacionDesechosDescripcion
        
        //responsable
        Route::get('cargarResponsable', 'tipo_desechos@consultarResponsable');
        Route::get('cargarResponsable_de/{id}', 'tipo_desechos@consultarResponsableDepar');

        //departamento
        Route::get('cargarDepartamento', 'tipo_desechos@consultarDepartamento');
        Route::get('cargarDepartamentoid/{id}', 'tipo_desechos@consultarDepartamentoid');




        
        Route::post('createCInformacion', 'tipo_desechos@createInformacion');


        //usuario
        Route::get('cargarUsuario/{id}', 'tipo_desechos@Consultarusuario');
        Route::get('cargarInformacion', 'tipo_desechos@ConsultarInformacion');

        Route::get('IncipSession/{id}', 'Dashboard@IncipSession');
        Route::get('usuario', 'Dashboard@User');




        //dashboard
        Route::get('graficosPorDia', 'Dashboard@ConsultarInformacion');
        Route::get('ConsultaDatos', 'Dashboard@ConsultarDatos');

        //reporte

        Route::get('generacionExcel', 'tipo_desechos@generacionExcel');
        Route::get('generacionPdf', 'tipo_desechos@generacionPDF');







       
    });
   });