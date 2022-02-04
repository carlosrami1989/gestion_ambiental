<?php

namespace App\Http\Controllers\Modulos\Administracion;
use App\Models\User;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Modulos\Parametrizacion\TbTipoDesecho;
use App\Models\Modulos\Parametrizacion\TbClasificacionDesecho;
use App\Models\Modulos\Parametrizacion\TbClasificacionDesechosDescripcion;
use App\Models\Modulos\Parametrizacion\tbResponsable;
use App\Models\Modulos\Parametrizacion\tbDepartamento;

//use App\Models\Modulos\Parametrizacion­\tbIngresoInfo;
use App\Models\Modulos\Parametrizacion\tbIngresoInfo;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use App\Exports\UsersExport;
use Maatwebsite\Excel\Facades\Excel;
use Barryvdh\DomPDF\Facade as PDF;



use Exception;

class tipo_desechos extends Controller
{
//
//
public function generacionPDF(){
    try {
        //code...
        $fecha = date('y-m-d');

        $resultado = tbIngresoInfo::DatosInformacion()->orderby('created_at','desc')->get();
       

        
                    $pdf = PDF::loadView('reports.excel', [
                        'lista' => $resultado,
                        'titulo' => 'CIRUGÍAS PROGRAMADAS POR PERIODOS',


                    ]);
                    return $pdf->stream("Cirugias");



    //     $nameExcel = 'Reporte General de Desechos' . '.xlsx';
    //    // return  response()->json(['data' =>$nameExcel], 200);
    //     return Excel::download(new UsersExport($resultado,'Reporte General de Desechos'), 
    //     $nameExcel);



       
    } catch (Exception $e) {
        return  response()->json(['data' => $e->getMessage()], 500);
        //throw $th;
    }
}
public function generacionExcel(){
    try {
        //code...
        $fecha = date('y-m-d');

        $resultado = tbIngresoInfo::DatosInformacion()->orderby('created_at','desc')->get();
       
        $nameExcel = 'Reporte General de Desechos' . '.xls';
       // return  response()->json(['data' =>$nameExcel], 200);
      
        return Excel::download(new UsersExport($resultado,'Reporte General de Desechos'), 
        $nameExcel, header("Content-Type: application/vnd.ms-excel;"));



       
    } catch (Exception $e) {
        return  response()->json(['data' => $e->getMessage()], 500);
        //throw $th;
    }
}
public function ConsultarInformacion(){
    try {
        //code...
        $resultado = tbIngresoInfo::DatosInformacion()->orderby('created_at','desc')->get();
        return  response()->json(['data' =>$resultado], 200);
    } catch (Exception $e) {
        return  response()->json(['data' => $e->getMessage()], 500);
        //throw $th;
    }
}

public function Consultarusuario($id){
    try {
        //code...
        $resultado = User::where('id',$id)->get();
        return  response()->json(['data' =>$resultado], 200);
    } catch (Exception $e) {
        return  response()->json(['data' => $e->getMessage()], 500);
        //throw $th;
    }
}
public function Salir(){
        Session::flush();
        
        Auth::logout();

        return redirect('login');
}
public function EnviarRegistro(){
    return view("auth.register");
}
public function createInformacion(Request $request){

    $request->validate([
         
     
        'peso' => 'required',
        'tipo_desechos' => 'required',
        'clasificacion_desechos' => 'required',
        'descripcion_desechos' => 'required',
        'responsable' => 'required',
        'id_departamento' => 'required',




        
    
    ]);


   //return  response()->json(['data' =>$request->all()], 200);
    try {
        //code...

        // $var = tbIngresoInfo::All();
        // return  response()->json(['data' =>$var], 200);


        $crear = tbIngresoInfo::UpdateOrCreate([
            'id'=>$request->id,
        ],
        [   
            'id_tipo_desechos'=> $request->tipo_desechos, 
            'id_clasificacion'=> $request->clasificacion_desechos, 
            'id_clasificacion_descripcion'=> $request->descripcion_desechos, 
            'id_departamento'=>  $request->id_departamento, 
            'id_responsable'=> $request->responsable, 
            'peso'=> $request->peso, 
            'descripcion'=> $request->observacion, 
            

        ]

        );

        $wasCreated = $crear->wasRecentlyCreated; 

        return  response()->json(['data' =>$wasCreated], 200);
    } catch (Exception $e) {
        return  response()->json(['data' => $e->getMessage()], 500);
        //throw $th;
    }
}
public function consultarDepartamentoid($id){
    try {
        //code..
        $consulta = tbDepartamento::all()->where('id',$id);

        
        return  response()->json(['data' =>$consulta], 200);
    } catch (Exception $e) {
        return response()->json(['ERROR' => $e->getMessage()], 500);
    }
}
public function consultarDepartamento(){
    try {
        //code..
        $consulta = tbDepartamento::all();

        
        return  response()->json(['data' =>$consulta], 200);
    } catch (Exception $e) {
        return response()->json(['ERROR' => $e->getMessage()], 500);
    }
}
public function consultarResponsableDepar($id){
    try {
        //code..
        $consulta = tbResponsable::where('Departamento',$id)->get();
        
        
        return  response()->json(['data' =>$consulta], 200);
    } catch (Exception $e) {
        return response()->json(['ERROR' => $e->getMessage()], 500);
    }
}
    public function consultarResponsable(){
        try {
            //code..
            $consulta = tbResponsable::all();

            
            return  response()->json(['data' =>$consulta], 200);
        } catch (Exception $e) {
            return response()->json(['ERROR' => $e->getMessage()], 500);
        }
    }


    public function consultarClasificacionPorDescripcion($tipo,$clasificacion){
        try {
            //code..
            $consulta = TbClasificacionDesechosDescripcion::where('id_tipo_desechos',$tipo)
            ->where('id_clasificacion',$clasificacion)->get();

            
            return  response()->json(['data' =>$consulta], 200);
        } catch (Exception $e) {
            return response()->json(['ERROR' => $e->getMessage()], 500);
        }
    }
    public function consultarClasificacionPorTipo($tipo){
        try {
            //code..
            $consulta = TbClasificacionDesecho::where('tipo_desechos',$tipo)->get();
            return  response()->json(['data' =>$consulta], 200);
        } catch (Exception $e) {
            return response()->json(['ERROR' => $e->getMessage()], 500);
        }
    }
    public function consultarClasificacionDescripcion(){
        try {
            //code..
            $consulta = TbClasificacionDesechosDescripcion::DatosClasificacionDesechos()->get();
            return  response()->json(['data' =>$consulta], 200);
        } catch (Exception $e) {
            return response()->json(['ERROR' => $e->getMessage()], 500);
        }
    }
    public function consultarClasificacion(){
        try {
            //code..
            $consulta = TbClasificacionDesecho::DatosDesechos()->get();
            return  response()->json(['data' =>$consulta], 200);
        } catch (Exception $e) {
            return response()->json(['ERROR' => $e->getMessage()], 500);
        }
    }
    //
    public function consultar(){
        try {
            //code..
            $consulta = TbTipoDesecho::all();
            return  response()->json(['data' =>$consulta], 200);
        } catch (Exception $e) {
            return response()->json(['ERROR' => $e->getMessage()], 500);
        }
    }

    public function create(Request $request){

        $request->validate([
            'name' => 'required',
        
        ]);
        try {
            //code...

            $crear = TbTipoDesecho::UpdateOrCreate([
                'id'=>$request->id,
            ],
            [
                'descripcion' => $request->name,
            ]

            );

            $wasCreated = $crear->wasRecentlyCreated; 

            return  response()->json(['data' =>$wasCreated], 200);
        } catch (Exception $e) {
            return  response()->json(['data' => $e->getMessage()], 500);
            //throw $th;
        }
    }


    public function createClasificacionDesechos(Request $request){

        $request->validate([
            'name' => 'required',
            'tipo_desechos' => 'required',

            
        
        ]);
        try {
            //code...

            $crear = TbClasificacionDesecho::UpdateOrCreate([
                'id'=>$request->id,
            ],
            [   'tipo_desechos'=> $request->tipo_desechos,
                'descripcion' => $request->name,
            ]

            );

            $wasCreated = $crear->wasRecentlyCreated; 

            return  response()->json(['data' =>$wasCreated], 200);
        } catch (Exception $e) {
            return  response()->json(['data' => $e->getMessage()], 500);
            //throw $th;
        }
    }


    public function createClasificacionDesechosDescripcion(Request $request){

        $request->validate([
            'name' => 'required',
            'tipo_desechos' => 'required',
            'clasificacion_desechos' => 'required',

            
        
        ]);
        try {
            //code...

            $crear = TbClasificacionDesechosDescripcion::UpdateOrCreate([
                'id'=>$request->id,
            ],
            [   'id_tipo_desechos'=> $request->tipo_desechos,
                'id_clasificacion' => $request->clasificacion_desechos,
                'descripcion' => $request->name,

            ]

            );

            $wasCreated = $crear->wasRecentlyCreated; 

            return  response()->json(['data' =>$wasCreated], 200);
        } catch (Exception $e) {
            return  response()->json(['data' => $e->getMessage()], 500);
            //throw $th;
        }
    }
}
