<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

/*
 * @Author: duong.lnt  
 * @Email: duong.lnt@vn.vinx.asia
 */

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
            $table->integer('asset_id');
            $table->boolean('unrecognized');
            $table->timestamp('checked_time');
            $table->integer('user_id')->unsigned();
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
