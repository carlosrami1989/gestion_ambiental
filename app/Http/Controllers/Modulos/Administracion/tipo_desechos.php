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
public function createreporte(Request $request){

    //return  response()->json(['data' =>$request->all()], 200);
    try {
        //code...
        $tipo_desechos="";
        $clasificacion_desechos="";
        $descripcion_desechos="";
        $responsable="";
        $id_departamento="";
       

 

        if ($request->tipo_desechos ==null || $request->tipo_desechos ==0) {
            # code...
            $tipo_desechos="%";
        }else {
            # code...
            $tipo_desechos=$request->tipo_desechos;
        }
        if ($request->clasificacion_desechos ==null || $request->clasificacion_desechos ==0) {
            # code...
            $clasificacion_desechos="%";
        }else {
            $clasificacion_desechos=$request->clasificacion_desechos;
        }
        if ($request->descripcion_desechos ==null || $request->descripcion_desechos ==0) {
            # code...
            $descripcion_desechos="%";
        }else {
            $descripcion_desechos=$request->descripcion_desechos;
        }
        if ($request->responsable ==null || $request->responsable ==0) {
            # code...
            $responsable="%";
        }else {
            $responsable=$request->responsable;
        }
        if ($request->id_departamento ==null || $request->id_departamento ==0) {
            # code...
            $id_departamento="%";
        }else {
            $id_departamento=$request->id_departamento;
        }



        // 'id_tipo_desechos', 
        // 'id_clasificacion', 
        // 'id_clasificacion_descripcion', 
        // 'id_departamento', 
        // 'id_responsable', 
 
        $resultado = tbIngresoInfo::DatosInformacion()
        ->where('id_tipo_desechos', 'like',   $tipo_desechos )
         ->where('id_clasificacion', 'like', '%' . $clasificacion_desechos . '%')
         ->where('id_clasificacion_descripcion', 'like', '%' . $descripcion_desechos . '%')
         ->where('id_departamento', 'like', '%' . $id_departamento . '%')
         ->where('id_responsable', 'like', '%' . $responsable . '%')
        ->whereBetween('created_at', [date($request->date_desde),date($request->date_hasta)]) 
        ->orderby('created_at','desc')->get();
        // date($request->date_desde)])
        
    
       // return  response()->json(['data' => $resultado], 200);
        
        $pdf = PDF::loadView('reports.excel', [
            'lista' => $resultado,
            'titulo' => 'CIRUGÍAS PROGRAMADAS POR PERIODOS',


        ]);
        return $pdf->output();
        //return response()->file($pdf->stream("Cirugias"));
        
       // return $pdf->download("Cirugias.pdf");

    

       
 
    } catch (Exception $e) {
        return  response()->json(['data' => $e->getMessage()], 500);
        //throw $th;
    }
}
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
       
        $nameExcel = 'Reporte General de Desechos-'.$fecha. '.xls';
       // return  response()->json(['data' =>$resultado], 200);
      
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
         
     
        'peso' => 'required|not_in:0',
        'tipo_desechos' => 'required|not_in:0',
        'clasificacion_desechos' => 'required|not_in:0',
        'descripcion_desechos' => 'required',
        'responsable' => 'required|not_in:0',
        'id_departamento' => 'required|not_in:0',




        
    
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
        $consulta = tbDepartamento::where('id',$id)->get();

        
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
