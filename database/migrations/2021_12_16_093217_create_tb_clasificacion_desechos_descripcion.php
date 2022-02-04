<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTbClasificacionDesechosDescripcion extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tb_clasificacion_desechos_descripcion', function (Blueprint $table) {
            $table->id();
            $table->integer('id_tipo_desechos');
            $table->integer('id_clasificacion');
            $table->string('descripcion', 800)->nullable()->default('text');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tb_clasificacion_desechos_descripcion');
    }
}
