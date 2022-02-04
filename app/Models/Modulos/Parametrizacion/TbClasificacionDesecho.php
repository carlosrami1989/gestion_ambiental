<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models\Modulos\Parametrizacion;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

use App\Models\Modulos\Parametrizacion\TbTipoDesecho;

/**
 * Class TbClasificacionDesecho
 * 
 * @property int $id
 * @property int $tipo_desechos
 * @property string|null $descripcion
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 *
 * @package App\Models
 */
class TbClasificacionDesecho extends Model
{
	protected $table = 'tb_clasificacion_desechos';

	protected $casts = [
		'tipo_desechos' => 'int'
	];

	protected $fillable = [
		'tipo_desechos',
		'descripcion'
	];

	public function scopeDatosDesechos($query)
    {
        $id_tipo_desechos = TbTipoDesecho::select('id')
            ->whereColumn('tipo_desechos', 'id')
            ->limit(1);
		//cirujano
		$des_tipo_desechos = TbTipoDesecho::select('descripcion')
		->whereColumn('tipo_desechos', 'id')
		->limit(1);

 
        $query->addSelect([
            'id_tipo_desechos' => $id_tipo_desechos,
            'des_tipo_desechos' => $des_tipo_desechos,
            
        ]);
    }
}
