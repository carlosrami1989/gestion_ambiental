<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models\Modulos\Parametrizacion;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

use App\Models\Modulos\Parametrizacion\TbTipoDesecho;
use App\Models\Modulos\Parametrizacion\TbClasificacionDesecho;


/**
 * Class TbClasificacionDesechosDescripcion
 * 
 * @property int $id
 * @property int $id_tipo_desechos
 * @property int $id_clasificacion
 * @property string|null $descripcion
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 *
 * @package App\Models
 */
class TbClasificacionDesechosDescripcion extends Model
{
	protected $table = 'tb_clasificacion_desechos_descripcion';

	protected $casts = [
		'id_tipo_desechos' => 'int',
		'id_clasificacion' => 'int'
	];

	protected $fillable = [
		'id_tipo_desechos',
		'id_clasificacion',
		'descripcion'
	];

	
	public function scopeDatosClasificacionDesechos($query)
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

 
        $query->addSelect([
            'id_tipo_desechos' => $id_tipo_desechos,
			'des_tipo_desechos' => $des_tipo_desechos,
			'id_claificacion_desechos' => $id_claificacion_desechos,
            'des_clasificacion_desechos' => $des_clasificacion_desechos,
            
        ]);
    }
}
