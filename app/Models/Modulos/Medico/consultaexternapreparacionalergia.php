<?php

namespace App\Models\Modulos\Medico;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class consultaexternapreparacionalergia extends Model
{
    use HasFactory;
    protected $table = 'tbconsultaexternapreparacionalergia';
    /**
     * @var string
     */
   
    public $timestamps = false;
    protected $fillable = [
        'id', 'consulta_externa', 'paciente', 'titular', 'alergico', 'descripcion', 'des_campo1', 'des_campo2', 'des_campo3', 
        'usuario_ingreso', 'fecha_ingreso',
         'usuario_modificacion', 'fecha_modificacion', 'pcname', 'status' 
    ];
}
