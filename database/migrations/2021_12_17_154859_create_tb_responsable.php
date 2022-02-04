<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTbResponsable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tb_responsable', function (Blueprint $table) {
            $table->id();
            $table->string('nombres', 100)->nullable()->default('text');
            $table->string('apellidos', 100)->nullable()->default('text');
            $table->string('profesion', 100)->nullable()->default('text');
            $table->string('cargo', 100)->nullable()->default('text');
            $table->string('departamento', 100)->nullable()->default('text');
            //$table->string('cargo', 100)->nullable()->default('text');
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
        Schema::dropIfExists('tb_responsable');
    }
}
