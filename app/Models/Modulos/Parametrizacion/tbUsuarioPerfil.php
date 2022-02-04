<?php

namespace App\Models\Modulos\Parametrizacion;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class tbUsuarioPerfil extends Model
{
    use HasFactory;
    
    protected $table = 'usuario_por_perfil';

    protected $fillable = [
             
        'id',
         'id_usuario', 
         'id_perfil', 
          
         'created_at',
         'updated_at',
    ];
}
