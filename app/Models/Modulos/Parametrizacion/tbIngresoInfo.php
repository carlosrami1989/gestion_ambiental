<?php

namespace App\Models\Modulos\Parametrizacion;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Modulos\Parametrizacion\TbTipoDesecho;
use App\Models\Modulos\Parametrizacion\TbClasificacionDesecho;
use App\Models\Modulos\Parametrizacion\TbClasificacionDesechosDescripcion;
use App\Models\Modulos\Parametrizacion\tbResponsable;
use App\Models\Modulos\Parametrizacion\tbDepartamento;
use Carbon\Carbon;



class tbIngresoInfo extends Model
{
    use HasFactory;
    
    protected $table = 'tb_ingreso_informacion';

    protected $fillable = [
             
        'id',
         'id_tipo_desechos', 
         'id_clasificacion', 
         'id_clasificacion_descripcion', 
         'id_departamento', 
         'id_responsable', 
         'peso',
         'descripcion', 
         'created_at',
         'updated_at',
    ];

    protected $casts = [
       
        'created_at' =>   'date:Y-m-d',
        'peso' =>   'decimal:2',
      

        //'CirProFecPro' => 'datetime:Y-m-d',
        //'CirProHorPro' => 'datetime:H:i:s',
        //'CirProHoraInicio' => 'datetime:H:i:s',
        //'CirProHoraFin' => 'datetime:H:i:s',
    ];
    protected $appends = [
        'Mes' 
    ];

    protected $hidden = [
        'mes',
    ];
    public function getMesAttribute()
    {
        return Carbon::parse($this->created_at)->format('d');
    }

    public function scopeDatosInformacion($query)
    {
        $id_tipo_desechos = TbTipoDesecho::select('id')
            ->whereColumn('id_tipo_desechos', 'id')
            ->limit(1);
		//cirujano
		$des_tipo_desechos = TbTipoDesecho::select('descripcion')
		->whereColumn('id_tipo_desechos', 'id')
		->limit(1);


		$id_claificacion_desechos = TbClasificacionDesecho::select('id')
            ->whereColumn('id_clasificacion', 'id')
            ->limit(1);
		//cirujano
		$des_clasificacion_desechos = TbClasificacionDesecho::select('descripcion')
		->whereColumn('id_clasificacion', 'id')
        ->limit(1);
        

        
		$id_claificacion_desechos_des = TbClasificacionDesechosDescripcion::select('id')
        ->whereColumn('id_clasificacion_descripcion', 'id')
        ->limit(1);
    //cirujano
    $des_clasificacion_desechos_des = TbClasificacionDesechosDescripcion::select('descripcion')
    ->whereColumn('id_clasificacion_descripcion', 'id')
    ->limit(1);

    $responsable_nombre = tbResponsable::select('nombres')
    ->whereColumn('id_responsable', 'id')
    ->limit(1);

    $responsable_apellido = tbResponsable::select('apellidos')
    ->whereColumn('id_responsable', 'id')
    ->limit(1);


    $departamento = tbDepartamento::select('descripcion')
    ->whereColumn('id_departamento', 'id')
    ->limit(1);




 
        $query->addSelect([
            'id_tipo_desechos' => $id_tipo_desechos,
			'des_tipo_desechos' => $des_tipo_desechos,
			'id_claificacion_desechos' => $id_claificacion_desechos,
            'des_clasificacion_desechos' => $des_clasificacion_desechos,
            'id_claificacion_desechos_des' => $id_claificacion_desechos_des,
            'des_clasificacion_desechos_des' => $des_clasificacion_desechos_des,
            'responsable_nombre' => $responsable_nombre,
            'responsable_apellido' => $responsable_apellido,
            'departamento'=>$departamento

            
        ]);
    }

}
