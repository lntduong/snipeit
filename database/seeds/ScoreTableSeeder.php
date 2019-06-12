<?php

use Illuminate\Database\Seeder;
use App\Models\User;
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
                'score' =>$faker->unique()->numberBetween($min = 1, $max = 10),
                'user_id' => User::all()->random()->id,
            ]);
        }
    }
}
