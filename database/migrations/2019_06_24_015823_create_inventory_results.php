<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateInventoryResults extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('inventory_results', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('inventory_id');
            //$table->foreign('inventory_id')->references('id')->on('inventories');
            $table->integer('asset_id');
            //$table->foreign('asset_id')->references('id')->on('assets');
            $table->boolean('unrecognized');
            $table->timestamp('checked_time');
            $table->integer('user_id')->unsigned();
            //$table->foreign('user_id')->references('id')->on('action_logs');
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
        Schema::dropIfExists('inventory_results');
    }
}
