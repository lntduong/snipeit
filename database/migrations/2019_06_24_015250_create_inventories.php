<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateInventories extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('inventories', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('contract_id');
            //$table->foreign('contract_id')->references('id')->on('contracts')->onDelete('cascade'); 
            $table->date('inventory_date');
            $table->string('name')->nullable();
            $table->text('notes')->nullable();
            $table->integer('user_id')->unsigned();
            //$table->foreign('user_id')->references('id')->on('action_logs');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('inventories');
    }
}
