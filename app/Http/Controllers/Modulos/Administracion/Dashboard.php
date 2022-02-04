<?php

namespace App\Http\Controllers\Modulos\Administracion;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;


use App\Models\Modulos\Parametrizacion\TbTipoDesecho;
use App\Models\Modulos\Parametrizacion\TbClasificacionDesecho;
use App\Models\Modulos\Parametrizacion\TbClasificacionDesechosDescripcion;
use App\Models\Modulos\Parametrizacion\tbResponsable;
//use App\Models\Modulos\Parametrizacion­\tbIngresoInfo;
use App\Models\Modulos\Parametrizacion\tbIngresoInfo;
use Illuminate\Support\Facades\DB;
use App\Models\User;

use App\Models\Modulos\Parametrizacion\tbUsuarioPerfil;
use Exception;

class Dashboard extends Controller
{
    public function User(){
        try {
          

            $resultado =User::All();
          

            return  response()->json(['data' => $resultado], 200);
        } catch (Exception $e) {
            return  response()->json(['data' => $e->getMessage()], 500);
            //throw $th;
        }
    }
    //
    public function IncipSession($id){
        try {
          

            $resultado =tbUsuarioPerfil::where("id_usuario",$id)->get();
          

            return  response()->json(['data' => $resultado], 200);
        } catch (Exception $e) {
            return  response()->json(['data' => $e->getMessage()], 500);
            //throw $th;
        }
    }
    public function ConsultarInformacion(){
        try {
          

            $resultado =DB::select("call buscarDatos");
          

            return  response()->json(['data' => $resultado], 200);
        } catch (Exception $e) {
            return  response()->json(['data' => $e->getMessage()], 500);
            //throw $th;
        }
    }

    public function ConsultarDatos(){
        try {
          $fecha =  date('Y-m-d');
            $resultado = tbResponsable::all();

            $kilos_dia = tbIngresoInfo::whereDate('created_at',$fecha)->get();
            $kilos_total = tbIngresoInfo::all();


         
          

            return  response()->json(['toal_registro' => $resultado->count(),
            'kilos_dia' => $kilos_dia->sum('peso'),
            'kilos_total' => $kilos_total->sum('peso')], 200);
        } catch (Exception $e) {
            return  response()->json(['data' => $e->getMessage()], 500);
            //throw $th;
        }
    }
}
