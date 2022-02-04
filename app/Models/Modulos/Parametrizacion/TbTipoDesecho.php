<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models\Modulos\Parametrizacion;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class TbTipoDesecho
 * 
 * @property int $id
 * @property string|null $descripcion
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 *
 * @package App\Models
 */
class TbTipoDesecho extends Model
{
	protected $table = 'tb_tipo_desechos';

	protected $fillable = [
		'descripcion'
	];
}
