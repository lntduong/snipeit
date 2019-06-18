<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateContractAssetsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contract_assets', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('contract_id')->unsigned();
            //$table->foreign('contract_id')->references('id')->on('contracts')->onDelete('cascade');
            $table->integer('asset_id')->unsigned();
            //$table->foreign('asset_id')->references('id')->on('assets')->onDelete('cascade');
            $table->timestamps(); 
            $table->softDeletes();
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
        Schema::table('contract_assets', function (Blueprint $table) {
            //$table->dropForeign('contract_assets_contract_id_foreign');
            //$table->dropForeign('contract_assets_asset_id_foreign');
            //$table->dropForeign('contract_assets_user_id_foreign');
        });
    }
}
