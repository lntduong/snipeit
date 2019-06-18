<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStoreTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('stores', function (Blueprint $table) {
            $table->increments('id')->unsigned();
            $table->integer('company_id')->unsigned();
            //$table->foreign('company_id')->references('id')->on('companies');
            $table->string('name');
            $table->integer('location_id')->nullable();
            $table->timestamps();
            $table->softDeletes();
            $table->string('image');
            $table->integer('user_id')->unsigned();
            //$table->foreign('user_id')->references('id')->on('action_logs');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('stores', function(Blueprint $table)
        {
            //$table->dropForeign('stores_company_id_foreign');
            //$table->dropForeign('stores_user_id_foreign');
        });
    }
}
