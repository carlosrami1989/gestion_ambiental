<?php

namespace App\Models\Modulos\Parametrizacion;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class tbDepartamento extends Model
{
    use HasFactory;

    protected $table = 'tb_departamentos';

	protected $fillable = [
		'descripcion'
	];
}
