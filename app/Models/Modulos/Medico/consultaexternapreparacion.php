<?php

namespace App\Models\Modulos\Medico;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class consultaexternapreparacion extends Model
{
    use HasFactory;
    protected $table = 'tbconsultaexternapreparacion';
    /**
     * @var string
     */
   
    public $timestamps = false;
    protected $fillable = [
        'id', 'consulta_externa', 'paciente',
         'titular', 'temperatura', 'pulso', 
         'presion_arterial', 'respiracion', 'peso', 
         'estatura', 'talla', 'discapacidad', 'carnet_conais', 
         'des_campo1', 'des_campo2', 'des_campo3', 'usuario_ingreso',
          'fecha_ingreso', 'usuario_modificacion', 'fecha_modificacion', 'pcname', 'status' 
    ];
    public function pacienteAlergia()
    {
        return $this->hasOne('App\Models\Modulos\Medico\consultaexternapreparacionalergia', 'paciente', 'paciente');
    }
}
