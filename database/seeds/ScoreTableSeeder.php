<?php

use Illuminate\Database\Seeder;

class ScoreTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker\Factory::create();

        $limit = 100;

        for ($i = 0; $i < $limit; $i++) {
            DB::table('scores')->insert([
                'name' => $faker->name,
                'email' => $faker->unique()->email,
                'contact_number' => $faker->phoneNumber,
                'created_at' => date("Y-m-d H:i:s"),
            ]);
        }
    }
}
