<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

/*
 * @Author: duong.lnt 
 * @Email: duong.lnt@vn.vinx.asia
 */

class CreateContractsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contracts', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('store_id')->unsigned();
            $table->string('name');
            $table->integer('location_id')->nullable();
            $table->integer('contact_id_1');
            $table->integer('contact_id_2')->nullable();
            $table->date('start_date');
            $table->date('end_date');
            $table->date('billing_date')->nullable();
            $table->date('payment_date')->nullable();
            $table->text('terms_and_conditions')->nullable();
            $table->text('notes')->nullable();
            $table->timestamps();
            $table->softDeletes(); 
            $table->integer('user_id')->unsigsned();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down(){}
}
