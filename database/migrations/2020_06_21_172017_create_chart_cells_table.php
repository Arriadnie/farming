<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateChartCellsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('chart_cells', function (Blueprint $table) {
            $table->id();

            $table->unsignedInteger('chart_id');
            $table->unsignedBigInteger('chart_column_id');
            $table->unsignedBigInteger('chart_row_id');
            $table->double('value');

            $table->timestamps();

            $table->foreign('chart_id')
                ->references('id')->on('charts')
                ->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('chart_column_id')
                ->references('id')->on('chart_columns')
                ->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('chart_row_id')
                ->references('id')->on('chart_rows')
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
        Schema::dropIfExists('chart_cells');
    }
}
