<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class OrderHistory extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {

        DB::unprepared('DROP TRIGGER `so_to_oh`');
        DB::unprepared('CREATE TRIGGER so_to_oh AFTER INSERT ON `salesorders` FOR EACH ROW
                BEGIN
                   INSERT INTO `order_histories` (`order_date`, `customer_name`, `total`) VALUES (NEW.order_date, NEW.customer_name, NEW.total);
                END');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        DB::unprepared('DROP TRIGGER `so_to_oh`');
    }
}
