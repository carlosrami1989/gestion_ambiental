<?php

namespace App\Models\Modulos\Parametrizacion;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

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
        //return calculaEdad($this->CirProHisCli);
        return $this->apellidos.' '.$this->nombres.' - '.$this->departamento;

       
    }

  
}
