<?php

namespace App\Models\Modulos\Parametrizacion;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class tbIngresoInformacion extends Model
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
         'updated_at'
    ];
    
    
}
