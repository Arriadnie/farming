<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateChartRowsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('chart_rows', function (Blueprint $table) {
            $table->id();

            $table->unsignedInteger('chart_id');
            $table->string('title')->nullable();
            $table->integer('order')->default(1);

            $table->timestamps();

            $table->foreign('chart_id')
                ->references('id')->on('charts')
                ->onUpdate('cascade')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('chart_rows');
    }
}
