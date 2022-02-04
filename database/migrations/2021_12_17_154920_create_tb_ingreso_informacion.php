<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTbIngresoInformacion extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tb_ingreso_informacion', function (Blueprint $table) {
            $table->id();
            $table->integer('id_tipo_desechos');
            $table->integer('id_clasificacion');
            $table->integer('id_clasificacion_descripcion');
            $table->integer('id_departamento');
            $table->integer('id_responsable');
            $table->double('peso', 15, 8);
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
        Schema::dropIfExists('tb_ingreso_informacion');
    }
}
