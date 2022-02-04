<?php

namespace App\Http\Controllers\Modulos\Medico;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Modulos\Medico\consultaexternapreparacion;
use App\Models\Modulos\Medico\consultaexternapreparacionalergia;

class ControlClinico extends Controller
{
     //
     public function ConsultarSignosVitales($id){
        try {
            $preparacion = consultaexternapreparacion::where('paciente', $id)
            ->get();

           $alergia = consultaexternapreparacionalergia::where('paciente', $id)
           ->get();
           
                return  response()->json(['preparacion' => $preparacion,
                'alergia' => $alergia], 200);
          
        } catch (Exception $e) {
            return response()->json(['msj' => $e->getMessage()], 500);
        }
    }
    
}
