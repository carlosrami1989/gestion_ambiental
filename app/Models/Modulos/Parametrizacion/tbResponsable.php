<?php

namespace App\Models\Modulos\Parametrizacion;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Modulos\Parametrizacion\tbDepartamento;

class tbResponsable extends Model
{
    use HasFactory;

    protected $table = 'tb_responsable';

	protected $fillable = [
       
        'id','cedula', 'nombres', 'apellidos', 'correo','profesion', 'cargo', 'Departamento', 'created_at', 'updated_at'
    ];
    
    protected $appends = [
        'NOMBRESALL', 'ALL'
    ];
    public function getnombresAttribute($value)
    {
        return utf8_encode($value);
    }

   

    public function getNOMBRESALLattribute()
    {
        //return calculaEdad($this->CirProHisCli);
        return $this->apellidos.' '.$this->nombres;

       
    }

    public function getALLattribute()
    {
        $descripcion = tbDepartamento::select('descripcion')
        ->where('id',$this->Departamento)->first();
        //return calculaEdad($this->CirProHisCli);
        return $this->apellidos.' '.$this->nombres.' - '.$descripcion->descripcion;

       
    }

  
}
